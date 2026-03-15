package com.asad.interviewos;

import com.asad.interviewos.interviews.domain.QuestionBank;
import com.asad.interviewos.interviews.domain.QuestionTopic;
import com.asad.interviewos.interviews.domain.Role;
import com.asad.interviewos.interviews.evaluation.InterviewEvaluationClient;
import com.asad.interviewos.interviews.repository.InterviewSessionRepository;
import com.asad.interviewos.interviews.repository.QuestionBankRepository;
import com.asad.interviewos.interviews.repository.QuestionEvaluationRepository;
import com.asad.interviewos.interviews.repository.SessionAnswerRepository;
import com.asad.interviewos.interviews.repository.SessionQuestionRepository;
import com.asad.interviewos.repository.UserRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.options;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class AuthIntegrationTests {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private InterviewSessionRepository interviewSessionRepository;

    @Autowired
    private QuestionBankRepository questionBankRepository;

    @Autowired
    private SessionQuestionRepository sessionQuestionRepository;

    @Autowired
    private SessionAnswerRepository sessionAnswerRepository;

    @Autowired
    private QuestionEvaluationRepository questionEvaluationRepository;

    @Autowired
    private ObjectMapper objectMapper;

    @MockitoBean
    private InterviewEvaluationClient interviewEvaluationClient;

    @BeforeEach
    void cleanDatabase() {
        questionEvaluationRepository.deleteAll();
        sessionAnswerRepository.deleteAll();
        sessionQuestionRepository.deleteAll();
        interviewSessionRepository.deleteAll();
        userRepository.deleteAll();
        when(interviewEvaluationClient.evaluate(anyString(), anyString()))
                .thenReturn(evaluationJson(7, "Correct concept", "Needs more depth", "Reasonable answer with relevant technical detail."));
    }

    @Test
    void registerSuccess() throws Exception {
        registerUser("test@example.com", "password123");
    }

    @Test
    void registerDuplicateEmailReturnsConflict() throws Exception {
        String body = """
                {"email":"duplicate@example.com","password":"password123"}
                """;

        mockMvc.perform(post("/api/auth/register")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(body))
                .andExpect(status().isCreated());

        mockMvc.perform(post("/api/auth/register")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(body))
                .andExpect(status().isConflict())
                .andExpect(jsonPath("$.message").value("Email already exists"));
    }

    @Test
    void loginSuccessReturnsJwtToken() throws Exception {
        registerUser("login@example.com", "password123");

        mockMvc.perform(post("/api/auth/login")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                                {"email":"login@example.com","password":"password123"}
                                """))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.token").isNotEmpty());
    }

    @Test
    void protectedEndpointWithoutTokenReturnsUnauthorized() throws Exception {
        mockMvc.perform(get("/api/interviews/sessions"))
                .andExpect(status().isUnauthorized())
                .andExpect(jsonPath("$.message").value("Unauthorized"));
    }

    @Test
    void corsPreflightForProtectedMutationIsAllowed() throws Exception {
        mockMvc.perform(options("/api/interviews/start")
                        .header("Origin", "http://localhost:3000")
                        .header("Access-Control-Request-Method", "POST")
                        .header("Access-Control-Request-Headers", "content-type,authorization"))
                .andExpect(status().isOk())
                .andExpect(header().string("Access-Control-Allow-Origin", "http://localhost:3000"));
    }

    @Test
    void startInterviewReturnsThreeQuestionsForRole() throws Exception {
        registerUser("interview@example.com", "password123");
        String authToken = loginAndGetAuthToken("interview@example.com", "password123");

        mockMvc.perform(post("/api/interviews/start")
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                                {"role":"BACKEND_ENGINEER"}
                                """))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.sessionId").isNumber())
                .andExpect(jsonPath("$.role").value("BACKEND_ENGINEER"))
                .andExpect(jsonPath("$.questions.length()").value(3));
    }

    @Test
    void startInterviewReturnsUniqueQuestionTextsEvenWhenQuestionBankContainsDuplicates() throws Exception {
        registerUser("unique@example.com", "password123");
        String authToken = loginAndGetAuthToken("unique@example.com", "password123");

        QuestionBank duplicateQuestion = new QuestionBank();
        duplicateQuestion.setRole(Role.BACKEND_ENGINEER);
        duplicateQuestion.setTopic(QuestionTopic.API_DESIGN);
        duplicateQuestion.setDifficulty("MEDIUM");
        duplicateQuestion.setQuestionText("Explain REST and why statelessness matters.");
        questionBankRepository.save(duplicateQuestion);

        JsonNode startResponse = startInterview(authToken, "BACKEND_ENGINEER");

        assertThat(startResponse.get("questions")).hasSize(3);
        assertThat(startResponse.get("questions"))
                .extracting(question -> question.get("text").asText())
                .doesNotHaveDuplicates();
    }

    @Test
    void getSessionHistoryReturnsCurrentUsersSessionsNewestFirst() throws Exception {
        registerUser("history@example.com", "password123");
        String authToken = loginAndGetAuthToken("history@example.com", "password123");

        JsonNode firstSession = startInterview(authToken, "BACKEND_ENGINEER");
        submitAnswers(authToken, firstSession);
        JsonNode secondSession = startInterview(authToken, "DATA_SCIENTIST");

        registerUser("other-history@example.com", "password123");
        String otherAuthToken = loginAndGetAuthToken("other-history@example.com", "password123");
        startInterview(otherAuthToken, "PRODUCT_MANAGER");

        mockMvc.perform(get("/api/interviews/sessions")
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(2))
                .andExpect(jsonPath("$[0].id").value(secondSession.get("sessionId").asLong()))
                .andExpect(jsonPath("$[0].role").value("Data Scientist"))
                .andExpect(jsonPath("$[0].status").value("IN_PROGRESS"))
                .andExpect(jsonPath("$[0].createdAt").isNotEmpty())
                .andExpect(jsonPath("$[1].id").value(firstSession.get("sessionId").asLong()))
                .andExpect(jsonPath("$[1].role").value("Backend Engineer"))
                .andExpect(jsonPath("$[1].status").value("COMPLETED"));
    }

    @Test
    void freeUsersCannotStartMoreThanTwoSessionsPerMonth() throws Exception {
        registerUser("limit@example.com", "password123");
        String authToken = loginAndGetAuthToken("limit@example.com", "password123");

        startInterview(authToken, "BACKEND_ENGINEER");
        startInterview(authToken, "DATA_SCIENTIST");

        mockMvc.perform(post("/api/interviews/start")
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                                {"role":"PRODUCT_MANAGER"}
                                """))
                .andExpect(status().isForbidden())
                .andExpect(jsonPath("$.error").value("FREE_TIER_LIMIT_REACHED"))
                .andExpect(jsonPath("$.message").value("You have used your 2 free sessions this month. Upgrade to continue practicing."));
    }

    @Test
    void getSessionDetailReturnsOwnedSessionFeedback() throws Exception {
        registerUser("detail@example.com", "password123");
        String authToken = loginAndGetAuthToken("detail@example.com", "password123");
        JsonNode startResponse = startInterview(authToken, "BACKEND_ENGINEER");

        submitAnswers(authToken, startResponse);

        mockMvc.perform(get("/api/interviews/sessions/{sessionId}", startResponse.get("sessionId").asLong())
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value(startResponse.get("sessionId").asLong()))
                .andExpect(jsonPath("$.role").value("Backend Engineer"))
                .andExpect(jsonPath("$.status").value("COMPLETED"))
                .andExpect(jsonPath("$.evaluations.length()").value(3))
                .andExpect(jsonPath("$.evaluations[0].questionId").value(startResponse.get("questions").get(0).get("questionId").asLong()))
                .andExpect(jsonPath("$.evaluations[0].question").isNotEmpty())
                .andExpect(jsonPath("$.evaluations[0].answer").value("First answer"))
                .andExpect(jsonPath("$.evaluations[0].score").value(7))
                .andExpect(jsonPath("$.evaluations[0].feedback").value("Reasonable answer with relevant technical detail."))
                .andExpect(jsonPath("$.evaluations[0].modelAnswer").isNotEmpty());
    }

    @Test
    void getSessionDetailDoesNotExposeOtherUsersSession() throws Exception {
        registerUser("owner@example.com", "password123");
        String ownerAuthToken = loginAndGetAuthToken("owner@example.com", "password123");
        JsonNode ownerSession = startInterview(ownerAuthToken, "BACKEND_ENGINEER");
        submitAnswers(ownerAuthToken, ownerSession);

        registerUser("viewer@example.com", "password123");
        String viewerAuthToken = loginAndGetAuthToken("viewer@example.com", "password123");

        mockMvc.perform(get("/api/interviews/sessions/{sessionId}", ownerSession.get("sessionId").asLong())
                        .header(HttpHeaders.AUTHORIZATION, bearer(viewerAuthToken)))
                .andExpect(status().isNotFound())
                .andExpect(jsonPath("$.message").value("Interview session not found"));
    }

    @Test
    void submitAnswersStoresAnswersForSession() throws Exception {
        registerUser("answers@example.com", "password123");
        String authToken = loginAndGetAuthToken("answers@example.com", "password123");
        JsonNode startResponse = startInterview(authToken, "BACKEND_ENGINEER");

        long sessionId = startResponse.get("sessionId").asLong();
        long questionOneId = startResponse.get("questions").get(0).get("questionId").asLong();
        long questionTwoId = startResponse.get("questions").get(1).get("questionId").asLong();
        long questionThreeId = startResponse.get("questions").get(2).get("questionId").asLong();

        when(interviewEvaluationClient.evaluate(anyString(), anyString()))
                .thenReturn(
                        evaluationJson(8, "Correct concept", "Lacks depth", "Good explanation but missing examples."),
                        evaluationJson(7, "Clear explanation", "Missing edge cases", "Solid answer but not complete."),
                        evaluationJson(8, "Reasonable coverage", "Could be more precise", "Strong answer with minor gaps.")
                );

        String submitBody = """
                {
                  "answers": [
                    {"questionId": %d, "answerText": "First answer"},
                    {"questionId": %d, "answerText": "Second answer"},
                    {"questionId": %d, "answerText": "Third answer"}
                  ]
                }
                """.formatted(questionOneId, questionTwoId, questionThreeId);

        mockMvc.perform(post("/api/interviews/{sessionId}/submit", sessionId)
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(submitBody))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.overallScore").value(7.7))
                .andExpect(jsonPath("$.evaluations.length()").value(3))
                .andExpect(jsonPath("$.evaluations[0].questionId").value(questionOneId))
                .andExpect(jsonPath("$.evaluations[0].score").value(8))
                .andExpect(jsonPath("$.evaluations[0].modelAnswer").isNotEmpty())
                .andExpect(jsonPath("$.evaluations[1].questionId").value(questionTwoId))
                .andExpect(jsonPath("$.evaluations[1].score").value(7))
                .andExpect(jsonPath("$.evaluations[2].questionId").value(questionThreeId))
                .andExpect(jsonPath("$.evaluations[2].score").value(8));

        assertThat(questionEvaluationRepository.findBySessionIdOrderByQuestionIdAsc(sessionId))
                .hasSize(3)
                .extracting(evaluation -> evaluation.getScore())
                .containsExactlyInAnyOrder(8, 7, 8);
    }

    @Test
    void submitAnswersRetriesEvaluationWhenJsonIsInvalid() throws Exception {
        registerUser("retry@example.com", "password123");
        String authToken = loginAndGetAuthToken("retry@example.com", "password123");
        JsonNode startResponse = startInterview(authToken, "BACKEND_ENGINEER");

        long sessionId = startResponse.get("sessionId").asLong();
        long questionOneId = startResponse.get("questions").get(0).get("questionId").asLong();
        long questionTwoId = startResponse.get("questions").get(1).get("questionId").asLong();
        long questionThreeId = startResponse.get("questions").get(2).get("questionId").asLong();

        when(interviewEvaluationClient.evaluate(anyString(), anyString()))
                .thenReturn(
                        "not-json",
                        evaluationJson(7, "Correct core idea", "Missing detail", "Reasonable answer after retry."),
                        evaluationJson(8, "Good structure", "Needs stronger examples", "Clear answer overall."),
                        evaluationJson(9, "Accurate explanation", "Minor omissions", "Strong answer with strong technical coverage.")
                );

        String submitBody = """
                {
                  "answers": [
                    {"questionId": %d, "answerText": "First answer"},
                    {"questionId": %d, "answerText": "Second answer"},
                    {"questionId": %d, "answerText": "Third answer"}
                  ]
                }
                """.formatted(questionOneId, questionTwoId, questionThreeId);

        mockMvc.perform(post("/api/interviews/{sessionId}/submit", sessionId)
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(submitBody))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.overallScore").value(8.0))
                .andExpect(jsonPath("$.evaluations[0].questionId").value(questionOneId))
                .andExpect(jsonPath("$.evaluations[0].score").value(7))
                .andExpect(jsonPath("$.evaluations[0].modelAnswer").isNotEmpty());

        verify(interviewEvaluationClient, times(4)).evaluate(anyString(), anyString());
    }

    @Test
    void submitAnswersRetriesWhenEvaluationContainsTranscriptMetadata() throws Exception {
        registerUser("contamination@example.com", "password123");
        String authToken = loginAndGetAuthToken("contamination@example.com", "password123");
        JsonNode startResponse = startInterview(authToken, "BACKEND_ENGINEER");

        long sessionId = startResponse.get("sessionId").asLong();
        long questionOneId = startResponse.get("questions").get(0).get("questionId").asLong();
        long questionTwoId = startResponse.get("questions").get(1).get("questionId").asLong();
        long questionThreeId = startResponse.get("questions").get(2).get("questionId").asLong();

        when(interviewEvaluationClient.evaluate(anyString(), anyString()))
                .thenReturn(
                        evaluationJson(6, "Acknowledges the topic", "assistant to=final code corrupted trace", "Incomplete answer with missing core detail."),
                        evaluationJson(6, "Acknowledges the topic", "Missing key mechanisms", "Incomplete answer with missing core detail."),
                        evaluationJson(8, "Good structure", "Needs deeper detail", "Clear answer overall."),
                        evaluationJson(7, "Reasonable coverage", "Missing examples", "Decent answer with gaps.")
                );

        String submitBody = """
                {
                  "answers": [
                    {"questionId": %d, "answerText": "First answer"},
                    {"questionId": %d, "answerText": "Second answer"},
                    {"questionId": %d, "answerText": "Third answer"}
                  ]
                }
                """.formatted(questionOneId, questionTwoId, questionThreeId);

        mockMvc.perform(post("/api/interviews/{sessionId}/submit", sessionId)
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(submitBody))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.evaluations[0].questionId").value(questionOneId))
                .andExpect(jsonPath("$.evaluations[0].weaknesses[0]").value("Missing key mechanisms"));

        assertThat(questionEvaluationRepository.findBySessionIdOrderByQuestionIdAsc(sessionId))
                .allSatisfy(evaluation -> {
                    assertThat(evaluation.getWeaknesses())
                            .allSatisfy(weakness -> assertThat(weakness.toLowerCase()).doesNotContain("assistant to="));
                    assertThat(evaluation.getFeedback().toLowerCase()).doesNotContain("assistant to=");
                    assertThat(evaluation.getModelAnswer().toLowerCase()).doesNotContain("assistant to=");
                });

        verify(interviewEvaluationClient, times(4)).evaluate(anyString(), anyString());
    }

    @Test
    void submitAnswersFallsBackToZeroWhenEvaluationFailsTwice() throws Exception {
        registerUser("fallback@example.com", "password123");
        String authToken = loginAndGetAuthToken("fallback@example.com", "password123");
        JsonNode startResponse = startInterview(authToken, "BACKEND_ENGINEER");

        long sessionId = startResponse.get("sessionId").asLong();
        long questionOneId = startResponse.get("questions").get(0).get("questionId").asLong();
        long questionTwoId = startResponse.get("questions").get(1).get("questionId").asLong();
        long questionThreeId = startResponse.get("questions").get(2).get("questionId").asLong();

        when(interviewEvaluationClient.evaluate(anyString(), anyString()))
                .thenReturn(
                        "not-json",
                        "still-not-json",
                        evaluationJson(9, "Strong coverage", "Small gap", "Very good answer with only a small gap."),
                        evaluationJson(6, "Some correctness", "Needs depth", "Partial answer with notable missing depth.")
                );

        String submitBody = """
                {
                  "answers": [
                    {"questionId": %d, "answerText": "First answer"},
                    {"questionId": %d, "answerText": "Second answer"},
                    {"questionId": %d, "answerText": "Third answer"}
                  ]
                }
                """.formatted(questionOneId, questionTwoId, questionThreeId);

        mockMvc.perform(post("/api/interviews/{sessionId}/submit", sessionId)
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(submitBody))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.overallScore").value(5.0))
                .andExpect(jsonPath("$.evaluations[0].questionId").value(questionOneId))
                .andExpect(jsonPath("$.evaluations[0].score").value(0))
                .andExpect(jsonPath("$.evaluations[0].weaknesses[0]").value("Evaluation unavailable"))
                .andExpect(jsonPath("$.evaluations[0].feedback").value("Evaluation unavailable due to processing error."))
                .andExpect(jsonPath("$.evaluations[0].modelAnswer").value("Model answer unavailable due to evaluation error."));

        assertThat(questionEvaluationRepository.findBySessionIdOrderByQuestionIdAsc(sessionId))
                .anyMatch(evaluation -> evaluation.getQuestionId().equals(questionOneId) && evaluation.isEvaluationError());
    }

    @Test
    void submitAnswersRejectsDuplicateQuestionIds() throws Exception {
        registerUser("dupe@example.com", "password123");
        String authToken = loginAndGetAuthToken("dupe@example.com", "password123");
        JsonNode startResponse = startInterview(authToken, "BACKEND_ENGINEER");

        long sessionId = startResponse.get("sessionId").asLong();
        long questionId = startResponse.get("questions").get(0).get("questionId").asLong();
        long otherQuestionId = startResponse.get("questions").get(1).get("questionId").asLong();

        String submitBody = """
                {
                  "answers": [
                    {"questionId": %d, "answerText": "First answer"},
                    {"questionId": %d, "answerText": "Duplicate answer"},
                    {"questionId": %d, "answerText": "Third answer"}
                  ]
                }
                """.formatted(questionId, questionId, otherQuestionId);

        mockMvc.perform(post("/api/interviews/{sessionId}/submit", sessionId)
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(submitBody))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.message").value("Duplicate questionId values are not allowed"));
    }

    @Test
    void submitAnswersRequiresFullSubmission() throws Exception {
        registerUser("partial@example.com", "password123");
        String authToken = loginAndGetAuthToken("partial@example.com", "password123");
        JsonNode startResponse = startInterview(authToken, "BACKEND_ENGINEER");

        long sessionId = startResponse.get("sessionId").asLong();
        long questionId = startResponse.get("questions").get(0).get("questionId").asLong();

        String submitBody = """
                {
                  "answers": [
                    {"questionId": %d, "answerText": "Only one answer"}
                  ]
                }
                """.formatted(questionId);

        mockMvc.perform(post("/api/interviews/{sessionId}/submit", sessionId)
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(submitBody))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.message").value("All session questions must be answered in a single submission"));
    }

    @Test
    void secondSubmissionReturnsConflict() throws Exception {
        registerUser("conflict@example.com", "password123");
        String authToken = loginAndGetAuthToken("conflict@example.com", "password123");
        JsonNode startResponse = startInterview(authToken, "BACKEND_ENGINEER");

        long sessionId = startResponse.get("sessionId").asLong();
        long questionOneId = startResponse.get("questions").get(0).get("questionId").asLong();
        long questionTwoId = startResponse.get("questions").get(1).get("questionId").asLong();
        long questionThreeId = startResponse.get("questions").get(2).get("questionId").asLong();

        String submitBody = """
                {
                  "answers": [
                    {"questionId": %d, "answerText": "First answer"},
                    {"questionId": %d, "answerText": "Second answer"},
                    {"questionId": %d, "answerText": "Third answer"}
                  ]
                }
                """.formatted(questionOneId, questionTwoId, questionThreeId);

        mockMvc.perform(post("/api/interviews/{sessionId}/submit", sessionId)
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(submitBody))
                .andExpect(status().isCreated());

        mockMvc.perform(post("/api/interviews/{sessionId}/submit", sessionId)
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(submitBody))
                .andExpect(status().isConflict())
                .andExpect(jsonPath("$.message").value("Answer already submitted"));
    }

    private void registerUser(String email, String password) throws Exception {
        String registerBody = """
                {"email":"%s","password":"%s"}
                """.formatted(email, password);

        mockMvc.perform(post("/api/auth/register")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(registerBody))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.message").value("User registered successfully"));
    }

    private String loginAndGetAuthToken(String email, String password) throws Exception {
        String loginBody = """
                {"email":"%s","password":"%s"}
                """.formatted(email, password);

        MvcResult result = mockMvc.perform(post("/api/auth/login")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(loginBody))
                .andExpect(status().isOk())
                .andReturn();

        JsonNode responseBody = objectMapper.readTree(result.getResponse().getContentAsString());
        JsonNode tokenNode = responseBody.get("token");
        if (tokenNode == null || tokenNode.asText().isBlank()) {
            throw new IllegalStateException("JWT token was not returned");
        }
        return tokenNode.asText();
    }

    private JsonNode startInterview(String authToken, String role) throws Exception {
        String responseBody = mockMvc.perform(post("/api/interviews/start")
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                                {"role":"%s"}
                                """.formatted(role)))
                .andExpect(status().isCreated())
                .andReturn()
                .getResponse()
                .getContentAsString();

        return objectMapper.readTree(responseBody);
    }

    private void submitAnswers(String authToken, JsonNode startResponse) throws Exception {
        long sessionId = startResponse.get("sessionId").asLong();
        long questionOneId = startResponse.get("questions").get(0).get("questionId").asLong();
        long questionTwoId = startResponse.get("questions").get(1).get("questionId").asLong();
        long questionThreeId = startResponse.get("questions").get(2).get("questionId").asLong();

        String submitBody = """
                {
                  "answers": [
                    {"questionId": %d, "answerText": "First answer"},
                    {"questionId": %d, "answerText": "Second answer"},
                    {"questionId": %d, "answerText": "Third answer"}
                  ]
                }
                """.formatted(questionOneId, questionTwoId, questionThreeId);

        mockMvc.perform(post("/api/interviews/{sessionId}/submit", sessionId)
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken))
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(submitBody))
                .andExpect(status().isCreated());
    }

    private String evaluationJson(int score, String strength, String weakness, String feedback) {
        return """
                {"score":%d,"strengths":["%s"],"weaknesses":["%s"],"feedback":"%s","modelAnswer":"A stronger answer would explain the concept, key mechanisms, and practical trade-offs."}
                """.formatted(score, strength, weakness, feedback);
    }

    private String bearer(String token) {
        return "Bearer " + token;
    }
}
