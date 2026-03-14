package com.asad.interviewos.interviews.evaluation;

import com.asad.interviewos.interviews.domain.QuestionEvaluation;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class InterviewEvaluationServiceTests {

    private final InterviewEvaluationClient interviewEvaluationClient = mock(InterviewEvaluationClient.class);
    private final InterviewEvaluationService interviewEvaluationService = new InterviewEvaluationService(
            interviewEvaluationClient,
            new InterviewAnswerSanitizer(2000),
            new ObjectMapper()
    );

    @Test
    void evaluateQuestionRetriesWhenResponseContainsHanScript() {
        when(interviewEvaluationClient.evaluate(anyString(), anyString()))
                .thenReturn(
                        """
                        {"score":6,"strengths":["Identifies JWT statelessness"],"weaknesses":["collision\\u68c0\\u67e5"],"feedback":"The answer references JWT trust boundaries.","modelAnswer":"A stronger answer would explain signature verification and expiration validation."}
                        """,
                        """
                        {"score":7,"strengths":["Identifies JWT statelessness"],"weaknesses":["Needs stronger explanation of expiration validation"],"feedback":"The answer identifies JWT trust boundaries and stateless authentication. It should explain signature verification and expiration checks more clearly.","modelAnswer":"A stronger answer would explain that JWT trust comes from verifying the token signature and validating claims such as expiration before accepting the request."}
                        """
                );

        QuestionEvaluation evaluation = interviewEvaluationService.evaluateQuestion(1L, 2L, "Explain JWT validation.", "Sample answer");

        assertThat(evaluation.isEvaluationError()).isFalse();
        assertThat(evaluation.getWeaknesses()).containsExactly("Needs stronger explanation of expiration validation");
        verify(interviewEvaluationClient, times(2)).evaluate(anyString(), anyString());
    }

    @Test
    void evaluateQuestionRetriesWhenFeedbackLooksIncomplete() {
        when(interviewEvaluationClient.evaluate(anyString(), anyString()))
                .thenReturn(
                        """
                        {"score":5,"strengths":["Mentions signature verification"],"weaknesses":["Misses expiration checks"],"feedback":"Trust comes from signature,","modelAnswer":"A stronger answer would explain that the server verifies the token signature and validates expiration before trusting the claims."}
                        """,
                        """
                        {"score":6,"strengths":["Mentions signature verification"],"weaknesses":["Misses expiration checks"],"feedback":"The answer correctly mentions signature verification. It should also explain expiration validation and why stateless auth still requires server-side signature trust.","modelAnswer":"A stronger answer would explain that JWT trust comes from verifying the token signature and validating claims such as expiration and issuer before using the payload."}
                        """
                );

        QuestionEvaluation evaluation = interviewEvaluationService.evaluateQuestion(3L, 4L, "Explain JWT validation.", "Sample answer");

        assertThat(evaluation.isEvaluationError()).isFalse();
        assertThat(evaluation.getFeedback()).endsWith(".");
        verify(interviewEvaluationClient, times(2)).evaluate(anyString(), anyString());
    }

    @Test
    void evaluateQuestionRetriesWhenModelAnswerIsTooShort() {
        when(interviewEvaluationClient.evaluate(anyString(), anyString()))
                .thenReturn(
                        """
                        {"score":6,"strengths":["Mentions signature verification"],"weaknesses":["Misses issuer validation"],"feedback":"The answer identifies one relevant mechanism but leaves out other important validation steps.","modelAnswer":"Verify it."}
                        """,
                        """
                        {"score":7,"strengths":["Mentions signature verification"],"weaknesses":["Misses issuer validation"],"feedback":"The answer identifies a relevant JWT validation step. It should also explain issuer checks and why claims must be validated together with the signature.","modelAnswer":"A stronger answer would explain that the server verifies the token signature and then validates claims such as expiration, issuer, and audience before trusting the token payload."}
                        """
                );

        QuestionEvaluation evaluation = interviewEvaluationService.evaluateQuestion(5L, 6L, "Explain JWT validation.", "Sample answer");

        assertThat(evaluation.isEvaluationError()).isFalse();
        assertThat(evaluation.getModelAnswer().length()).isGreaterThan(60);
        verify(interviewEvaluationClient, times(2)).evaluate(anyString(), anyString());
    }
}
