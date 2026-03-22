package com.asad.interviewos.interviews.service;

import com.asad.interviewos.entity.User;
import com.asad.interviewos.interviews.domain.InterviewSession;
import com.asad.interviewos.interviews.domain.QuestionBank;
import com.asad.interviewos.interviews.domain.QuestionEvaluation;
import com.asad.interviewos.interviews.domain.Role;
import com.asad.interviewos.interviews.domain.SessionAnswer;
import com.asad.interviewos.interviews.domain.SessionQuestion;
import com.asad.interviewos.interviews.dto.QuestionDTO;
import com.asad.interviewos.interviews.dto.QuestionEvaluationResponse;
import com.asad.interviewos.interviews.dto.SessionDetailResponse;
import com.asad.interviewos.interviews.dto.SessionFeedbackResponse;
import com.asad.interviewos.interviews.dto.SessionHistoryResponse;
import com.asad.interviewos.interviews.dto.SessionAnswerRequest;
import com.asad.interviewos.interviews.dto.StartInterviewRequest;
import com.asad.interviewos.interviews.dto.StartInterviewResponse;
import com.asad.interviewos.interviews.dto.SubmitAnswersRequest;
import com.asad.interviewos.interviews.dto.SubmitAnswersResponse;
import com.asad.interviewos.interviews.evaluation.InterviewEvaluationService;
import com.asad.interviewos.interviews.repository.InterviewSessionRepository;
import com.asad.interviewos.interviews.repository.QuestionBankRepository;
import com.asad.interviewos.interviews.repository.QuestionEvaluationRepository;
import com.asad.interviewos.interviews.repository.SessionAnswerRepository;
import com.asad.interviewos.interviews.repository.SessionQuestionRepository;
import com.asad.interviewos.repository.UserRepository;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import com.asad.interviewos.interviews.domain.QuestionTopic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class InterviewService {

    private static final int QUESTIONS_PER_SESSION = 5;
    private static final Set<String> PAID_SUBSCRIPTION_STATUSES = Set.of("PRO", "ACTIVE");
    private static final int FREE_TIER_MONTHLY_SESSION_LIMIT = 2;
    private static final int BASIC_TIER_MONTHLY_SESSION_LIMIT = 25;
    private static final String FREE_TIER_LIMIT_REACHED = "FREE_TIER_LIMIT_REACHED";
    private static final String BASIC_TIER_LIMIT_REACHED = "BASIC_TIER_LIMIT_REACHED";

    private final UserRepository userRepository;
    private final InterviewSessionRepository interviewSessionRepository;
    private final QuestionBankRepository questionBankRepository;
    private final SessionAnswerRepository sessionAnswerRepository;
    private final SessionQuestionRepository sessionQuestionRepository;
    private final QuestionEvaluationRepository questionEvaluationRepository;
    private final InterviewEvaluationService interviewEvaluationService;

    public InterviewService(UserRepository userRepository,
                            InterviewSessionRepository interviewSessionRepository,
                            QuestionBankRepository questionBankRepository,
                            SessionAnswerRepository sessionAnswerRepository,
                            SessionQuestionRepository sessionQuestionRepository,
                            QuestionEvaluationRepository questionEvaluationRepository,
                            InterviewEvaluationService interviewEvaluationService) {
        this.userRepository = userRepository;
        this.interviewSessionRepository = interviewSessionRepository;
        this.questionBankRepository = questionBankRepository;
        this.sessionAnswerRepository = sessionAnswerRepository;
        this.sessionQuestionRepository = sessionQuestionRepository;
        this.questionEvaluationRepository = questionEvaluationRepository;
        this.interviewEvaluationService = interviewEvaluationService;
    }

    @Transactional
    public StartInterviewResponse startInterview(String userEmail, StartInterviewRequest request) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("Authenticated user not found"));
        enforceFreeTierLimit(user);

        // Use user's stored role, fall back to request role for backwards compatibility
        Role role = resolveRole(user, request.getRole());
        if (role == null) {
            throw new IllegalArgumentException("No role assigned. Please select a role first.");
        }

        List<QuestionBank> selectedQuestions = selectQuestions(role, request.getTopic());

        InterviewSession session = new InterviewSession();
        session.setUserId(user.getId());
        session.setRole(role);
        InterviewSession savedSession = interviewSessionRepository.save(session);

        for (int index = 0; index < selectedQuestions.size(); index++) {
            QuestionBank question = selectedQuestions.get(index);

            SessionQuestion sessionQuestion = new SessionQuestion();
            sessionQuestion.setSessionId(savedSession.getId());
            sessionQuestion.setQuestionId(question.getId());
            sessionQuestion.setOrderIndex(index + 1);
            sessionQuestionRepository.save(sessionQuestion);
        }

        List<QuestionDTO> questionDtos = selectedQuestions.stream()
                .map(question -> new QuestionDTO(question.getId(), question.getQuestionText(), question.getDifficulty()))
                .toList();

        return new StartInterviewResponse(savedSession.getId(), role, questionDtos);
    }

    @Transactional(readOnly = true)
    public List<SessionHistoryResponse> getSessionHistory(String userEmail) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("Authenticated user not found"));

        return interviewSessionRepository.findByUserIdOrderByCreatedAtDesc(user.getId()).stream()
                .map(SessionHistoryResponse::from)
                .toList();
    }

    @Transactional(readOnly = true)
    public SessionDetailResponse getSessionDetail(String userEmail, Long sessionId) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("Authenticated user not found"));

        InterviewSession session = interviewSessionRepository.findByIdAndUserId(sessionId, user.getId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Interview session not found"));

        List<SessionQuestion> sessionQuestions = sessionQuestionRepository.findBySessionIdOrderByOrderIndexAsc(sessionId);
        Map<Long, QuestionBank> questionsById = questionBankRepository.findAllById(sessionQuestions.stream()
                        .map(SessionQuestion::getQuestionId)
                        .toList())
                .stream()
                .collect(Collectors.toMap(QuestionBank::getId, Function.identity()));

        Map<Long, SessionAnswer> answersByQuestionId = sessionAnswerRepository.findBySessionIdOrderByQuestionIdAsc(sessionId)
                .stream()
                .collect(Collectors.toMap(SessionAnswer::getQuestionId, Function.identity()));

        Map<Long, QuestionEvaluation> evaluationsByQuestionId = questionEvaluationRepository.findBySessionIdOrderByQuestionIdAsc(sessionId)
                .stream()
                .collect(Collectors.toMap(QuestionEvaluation::getQuestionId, Function.identity()));

        List<SessionFeedbackResponse> evaluations = sessionQuestions.stream()
                .map(sessionQuestion -> {
                    QuestionBank question = questionsById.get(sessionQuestion.getQuestionId());
                    return SessionFeedbackResponse.from(
                            sessionQuestion.getQuestionId(),
                            question != null ? question.getQuestionText() : "Question unavailable",
                            question != null && question.getTopic() != null ? question.getTopic().name() : null,
                            question != null ? question.getDifficulty() : null,
                            answersByQuestionId.get(sessionQuestion.getQuestionId()),
                            evaluationsByQuestionId.get(sessionQuestion.getQuestionId())
                    );
                })
                .toList();

        return SessionDetailResponse.from(session, evaluations);
    }

    private Role resolveRole(User user, Role requestRole) {
        if (user.getRole() != null) {
            try {
                return Role.valueOf(user.getRole());
            } catch (IllegalArgumentException ignored) {
                // fall through
            }
        }
        return requestRole;
    }

    private List<QuestionBank> selectQuestions(Role role, QuestionTopic topic) {
        if (topic != null) {
            // Topic-priority: get topic questions first, fill from rest of role
            List<QuestionBank> topicQuestions = deduplicateQuestions(
                    questionBankRepository.findByRoleAndTopic(role, topic));
            Collections.shuffle(topicQuestions);

            List<QuestionBank> allRoleQuestions = deduplicateQuestions(
                    questionBankRepository.findByRole(role));
            Collections.shuffle(allRoleQuestions);

            // Merge: topic questions first, then fill from role pool
            Set<Long> selectedIds = new HashSet<>();
            List<QuestionBank> selected = new ArrayList<>();

            for (QuestionBank q : topicQuestions) {
                if (selected.size() >= QUESTIONS_PER_SESSION) break;
                if (selectedIds.add(q.getId())) {
                    selected.add(q);
                }
            }
            for (QuestionBank q : allRoleQuestions) {
                if (selected.size() >= QUESTIONS_PER_SESSION) break;
                if (selectedIds.add(q.getId())) {
                    selected.add(q);
                }
            }

            if (selected.size() < QUESTIONS_PER_SESSION) {
                throw new IllegalArgumentException("Not enough unique questions available for role " + role);
            }
            return selected;
        }

        // No topic: original behavior
        List<QuestionBank> availableQuestions = deduplicateQuestions(questionBankRepository.findByRole(role));
        if (availableQuestions.size() < QUESTIONS_PER_SESSION) {
            throw new IllegalArgumentException("Not enough unique questions available for role " + role);
        }
        Collections.shuffle(availableQuestions);
        return availableQuestions.subList(0, QUESTIONS_PER_SESSION);
    }

    public List<Map<String, Object>> getTopicsForRole(Role role) {
        List<QuestionBank> questions = deduplicateQuestions(questionBankRepository.findByRole(role));
        Map<String, Long> topicCounts = new LinkedHashMap<>();
        for (QuestionBank q : questions) {
            if (q.getTopic() != null) {
                topicCounts.merge(q.getTopic().name(), 1L, Long::sum);
            }
        }
        return topicCounts.entrySet().stream()
                .map(e -> Map.<String, Object>of("topic", e.getKey(), "questionCount", e.getValue()))
                .toList();
    }

    private List<QuestionBank> deduplicateQuestions(List<QuestionBank> questions) {
        List<QuestionBank> uniqueQuestions = new ArrayList<>();
        Set<String> seenQuestionTexts = new HashSet<>();

        for (QuestionBank question : questions) {
            String normalizedText = normalizeQuestionText(question.getQuestionText());
            if (seenQuestionTexts.add(normalizedText)) {
                uniqueQuestions.add(question);
            }
        }

        return uniqueQuestions;
    }

    private String normalizeQuestionText(String questionText) {
        return questionText == null ? "" : questionText.trim().toLowerCase(Locale.ROOT);
    }

    private void enforceFreeTierLimit(User user) {
        String status = user.getSubscriptionStatus() != null
                ? user.getSubscriptionStatus().toUpperCase(Locale.ROOT) : "FREE";
        String plan = user.getSubscriptionPlan() != null
                ? user.getSubscriptionPlan().toUpperCase(Locale.ROOT) : null;

        // Pro plan = unlimited
        if (PAID_SUBSCRIPTION_STATUSES.contains(status) && "PRO".equals(plan)) {
            return;
        }

        LocalDateTime startOfMonth = LocalDate.now().withDayOfMonth(1).atStartOfDay();
        long sessionsThisMonth = interviewSessionRepository.countByUserIdAndCreatedAtGreaterThanEqual(
                user.getId(),
                startOfMonth
        );

        // Basic plan = 10/month
        if (PAID_SUBSCRIPTION_STATUSES.contains(status) && "BASIC".equals(plan)) {
            if (sessionsThisMonth >= BASIC_TIER_MONTHLY_SESSION_LIMIT) {
                throw new ResponseStatusException(HttpStatus.FORBIDDEN, BASIC_TIER_LIMIT_REACHED);
            }
            return;
        }

        // Free tier = 2/month
        if (sessionsThisMonth >= FREE_TIER_MONTHLY_SESSION_LIMIT) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, FREE_TIER_LIMIT_REACHED);
        }
    }

    @Transactional
    public SubmitAnswersResponse submitAnswers(String userEmail, Long sessionId, SubmitAnswersRequest request) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("Authenticated user not found"));

        InterviewSession session = interviewSessionRepository.findById(sessionId)
                .orElseThrow(() -> new IllegalArgumentException("Interview session not found"));

        if (!session.getUserId().equals(user.getId())) {
            throw new IllegalArgumentException("Interview session not found");
        }

        if ("SUBMITTED".equals(session.getStatus()) || sessionAnswerRepository.existsBySessionId(sessionId)) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Answer already submitted");
        }

        List<SessionQuestion> sessionQuestions = sessionQuestionRepository.findBySessionIdOrderByOrderIndexAsc(sessionId);

        Set<Long> validQuestionIds = sessionQuestions
                .stream()
                .map(SessionQuestion::getQuestionId)
                .collect(Collectors.toSet());

        if (validQuestionIds.isEmpty()) {
            throw new IllegalArgumentException("Interview session has no questions");
        }

        if (request.getAnswers().size() != validQuestionIds.size()) {
            throw new IllegalArgumentException("All session questions must be answered in a single submission");
        }

        Set<Long> submittedQuestionIds = new HashSet<>();
        for (SessionAnswerRequest answerRequest : request.getAnswers()) {
            if (!submittedQuestionIds.add(answerRequest.getQuestionId())) {
                throw new IllegalArgumentException("Duplicate questionId values are not allowed");
            }

            if (!validQuestionIds.contains(answerRequest.getQuestionId())) {
                throw new IllegalArgumentException("Question does not belong to this session");
            }
        }

        if (!submittedQuestionIds.equals(validQuestionIds)) {
            throw new IllegalArgumentException("All session questions must be answered in a single submission");
        }

        List<SessionAnswer> answersToSave = request.getAnswers().stream()
                .map(answerRequest -> {
                    SessionAnswer sessionAnswer = new SessionAnswer();
                    sessionAnswer.setSessionId(sessionId);
                    sessionAnswer.setQuestionId(answerRequest.getQuestionId());
                    sessionAnswer.setAnswerText(answerRequest.getAnswerText());
                    return sessionAnswer;
                })
                .toList();

        try {
            sessionAnswerRepository.saveAll(answersToSave);
        } catch (DataIntegrityViolationException ex) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Answer already submitted", ex);
        }

        List<SessionQuestion> persistedSessionQuestions = sessionQuestionRepository.findBySessionIdOrderByOrderIndexAsc(sessionId);
        List<SessionAnswer> persistedAnswers = sessionAnswerRepository.findBySessionIdOrderByQuestionIdAsc(sessionId);

        Map<Long, SessionAnswer> answersByQuestionId = persistedAnswers.stream()
                .collect(Collectors.toMap(SessionAnswer::getQuestionId, Function.identity()));

        Map<Long, QuestionBank> questionsById = questionBankRepository.findAllById(validQuestionIds).stream()
                .collect(Collectors.toMap(QuestionBank::getId, Function.identity()));

        List<QuestionEvaluation> evaluationsToSave = persistedSessionQuestions.stream()
                .map(sessionQuestion -> buildEvaluation(sessionId, sessionQuestion, questionsById, answersByQuestionId))
                .toList();

        List<QuestionEvaluation> savedEvaluations = questionEvaluationRepository.saveAll(evaluationsToSave);
        Map<Long, QuestionEvaluation> evaluationsByQuestionId = savedEvaluations.stream()
                .collect(Collectors.toMap(QuestionEvaluation::getQuestionId, Function.identity()));

        double overallScore = Math.round(savedEvaluations.stream()
                .mapToInt(QuestionEvaluation::getScore)
                .average()
                .orElse(0) * 10.0) / 10.0;

        session.setStatus("EVALUATED");
        interviewSessionRepository.save(session);

        List<QuestionEvaluationResponse> evaluationResponses = persistedSessionQuestions.stream()
                .map(sessionQuestion -> toResponse(evaluationsByQuestionId.get(sessionQuestion.getQuestionId())))
                .toList();

        return new SubmitAnswersResponse(overallScore, evaluationResponses);
    }

    private QuestionEvaluation buildEvaluation(Long sessionId,
                                               SessionQuestion sessionQuestion,
                                               Map<Long, QuestionBank> questionsById,
                                               Map<Long, SessionAnswer> answersByQuestionId) {
        QuestionBank question = questionsById.get(sessionQuestion.getQuestionId());
        if (question == null) {
            throw new IllegalArgumentException("Interview session question not found");
        }

        SessionAnswer answer = answersByQuestionId.get(sessionQuestion.getQuestionId());
        if (answer == null) {
            throw new IllegalArgumentException("Interview session answer not found");
        }

        return interviewEvaluationService.evaluateQuestion(
                sessionId,
                sessionQuestion.getQuestionId(),
                question.getQuestionText(),
                answer.getAnswerText()
        );
    }

    private QuestionEvaluationResponse toResponse(QuestionEvaluation evaluation) {
        return new QuestionEvaluationResponse(
                evaluation.getQuestionId(),
                evaluation.getScore(),
                evaluation.getStrengths(),
                evaluation.getWeaknesses(),
                evaluation.getFeedback(),
                evaluation.getModelAnswer()
        );
    }
}
