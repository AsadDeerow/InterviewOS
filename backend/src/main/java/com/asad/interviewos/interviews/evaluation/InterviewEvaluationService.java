package com.asad.interviewos.interviews.evaluation;

import com.asad.interviewos.interviews.domain.QuestionEvaluation;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

@Service
public class InterviewEvaluationService {

    private static final Logger log = LoggerFactory.getLogger(InterviewEvaluationService.class);
    private static final int MAX_ATTEMPTS = 2;
    private static final int MAX_SCORE = 10;
    private static final int MIN_LIST_ITEMS = 1;
    private static final int MAX_LIST_ITEMS = 3;
    private static final int MAX_STRENGTH_LENGTH = 300;
    private static final int MAX_WEAKNESS_LENGTH = 300;
    private static final int MAX_FEEDBACK_LENGTH = 900;
    private static final int MAX_MODEL_ANSWER_LENGTH = 1400;
    private static final int MIN_FEEDBACK_QUALITY_LENGTH = 20;
    private static final int MIN_MODEL_ANSWER_QUALITY_LENGTH = 60;
    private static final Set<String> EXPECTED_FIELDS = Set.of("score", "strengths", "weaknesses", "feedback", "modelAnswer");
    private static final Pattern TRANSCRIPT_METADATA_PATTERN = Pattern.compile(
            "(?i)(assistant\\s+to=|user\\s+to=|system\\s+to=|tool_uses|recipient_name|to=(analysis|commentary|final)|```|<\\||json\\s+id=)"
    );
    private static final Pattern HAN_SCRIPT_PATTERN = Pattern.compile("[\\u4E00-\\u9FFF]");
    private static final Pattern SENTENCE_LIKE_PATTERN = Pattern.compile("[.!?]");
    private static final String FALLBACK_FEEDBACK = "Evaluation unavailable due to processing error.";
    private static final String FALLBACK_MODEL_ANSWER = "Model answer unavailable due to evaluation error.";

    private final InterviewEvaluationClient interviewEvaluationClient;
    private final InterviewAnswerSanitizer interviewAnswerSanitizer;
    private final ObjectMapper objectMapper;

    public InterviewEvaluationService(InterviewEvaluationClient interviewEvaluationClient,
                                      InterviewAnswerSanitizer interviewAnswerSanitizer,
                                      ObjectMapper objectMapper) {
        this.interviewEvaluationClient = interviewEvaluationClient;
        this.interviewAnswerSanitizer = interviewAnswerSanitizer;
        this.objectMapper = objectMapper;
    }

    public QuestionEvaluation evaluateQuestion(Long sessionId,
                                               Long questionId,
                                               String questionText,
                                               String answerText) {
        String sanitizedAnswer = interviewAnswerSanitizer.sanitize(answerText);

        for (int attempt = 1; attempt <= MAX_ATTEMPTS; attempt++) {
            try {
                String rawJson = interviewEvaluationClient.evaluate(questionText, sanitizedAnswer);
                InterviewEvaluationResult result = parseAndValidate(rawJson);
                return buildEvaluation(sessionId, questionId, result, false);
            } catch (Exception ex) {
                if (attempt == MAX_ATTEMPTS) {
                    log.warn("Evaluation failed for session {} question {} after {} attempts: {}",
                            sessionId,
                            questionId,
                            MAX_ATTEMPTS,
                            ex.getMessage());
                    return fallbackEvaluation(sessionId, questionId);
                }

                log.debug("Evaluation attempt {} failed for session {} question {}: {}",
                        attempt,
                        sessionId,
                        questionId,
                        ex.getMessage());
            }
        }

        return fallbackEvaluation(sessionId, questionId);
    }

    private InterviewEvaluationResult parseAndValidate(String rawJson) throws JsonProcessingException {
        if (rawJson == null || rawJson.isBlank()) {
            throw new IllegalArgumentException("LLM response body was empty");
        }

        JsonNode root = objectMapper.readTree(rawJson);
        if (!root.isObject()) {
            throw new IllegalArgumentException("LLM response must be a JSON object");
        }

        Set<String> fieldNames = new HashSet<>();
        root.fieldNames().forEachRemaining(fieldNames::add);
        if (!fieldNames.equals(EXPECTED_FIELDS)) {
            throw new IllegalArgumentException("LLM response fields do not match schema");
        }

        JsonNode scoreNode = root.get("score");
        if (scoreNode == null || !scoreNode.isIntegralNumber()) {
            throw new IllegalArgumentException("score must be an integer");
        }

        int score = scoreNode.intValue();
        if (score < 0 || score > MAX_SCORE) {
            throw new IllegalArgumentException("score must be between 0 and " + MAX_SCORE);
        }

        List<String> strengths = readStringList(root.get("strengths"), "strengths");
        List<String> weaknesses = readStringList(root.get("weaknesses"), "weaknesses");

        JsonNode feedbackNode = root.get("feedback");
        if (feedbackNode == null || !feedbackNode.isTextual()) {
            throw new IllegalArgumentException("feedback must be a string");
        }

        String feedback = readPlainText(feedbackNode, "feedback", MAX_FEEDBACK_LENGTH);

        JsonNode modelAnswerNode = root.get("modelAnswer");
        String modelAnswer = readPlainText(modelAnswerNode, "modelAnswer", MAX_MODEL_ANSWER_LENGTH);

        InterviewEvaluationResult result = new InterviewEvaluationResult(score, strengths, weaknesses, feedback, modelAnswer);
        validateQuality(result);
        return result;
    }

    private List<String> readStringList(JsonNode node, String fieldName) {
        if (node == null || !node.isArray()) {
            throw new IllegalArgumentException(fieldName + " must be an array");
        }
        if (node.size() < MIN_LIST_ITEMS) {
            throw new IllegalArgumentException(fieldName + " must contain at least " + MIN_LIST_ITEMS + " item");
        }
        if (node.size() > MAX_LIST_ITEMS) {
            throw new IllegalArgumentException(fieldName + " must contain at most " + MAX_LIST_ITEMS + " items");
        }

        List<String> values = new ArrayList<>();
        for (JsonNode item : node) {
            if (!item.isTextual()) {
                throw new IllegalArgumentException(fieldName + " must contain only strings");
            }

            int maxLength = switch (fieldName) {
                case "strengths" -> MAX_STRENGTH_LENGTH;
                case "weaknesses" -> MAX_WEAKNESS_LENGTH;
                default -> throw new IllegalArgumentException("Unsupported list field " + fieldName);
            };

            values.add(readPlainText(item, fieldName + " entry", maxLength));
        }

        return values;
    }

    private String readPlainText(JsonNode node, String fieldName, int maxLength) {
        if (node == null || !node.isTextual()) {
            throw new IllegalArgumentException(fieldName + " must be a string");
        }

        String value = normalizePlainText(node.asText());
        if (value.isEmpty()) {
            throw new IllegalArgumentException(fieldName + " must not be blank");
        }
        if (value.length() > maxLength) {
            throw new IllegalArgumentException(fieldName + " must be concise");
        }
        if (containsDisallowedControlCharacter(value)) {
            throw new IllegalArgumentException(fieldName + " contains unsupported control characters");
        }
        if (TRANSCRIPT_METADATA_PATTERN.matcher(value).find()) {
            throw new IllegalArgumentException(fieldName + " contains transcript metadata");
        }
        if (HAN_SCRIPT_PATTERN.matcher(value).find()) {
            throw new IllegalArgumentException(fieldName + " contains non-English script");
        }
        return value;
    }

    private void validateQuality(InterviewEvaluationResult result) {
        validateQualityField(result.feedback(), "feedback", MIN_FEEDBACK_QUALITY_LENGTH);
        validateQualityField(result.modelAnswer(), "modelAnswer", MIN_MODEL_ANSWER_QUALITY_LENGTH);
    }

    private void validateQualityField(String value, String fieldName, int minimumLength) {
        if (value == null || value.length() < minimumLength) {
            throw new IllegalArgumentException(fieldName + " must be more complete");
        }
        if (!SENTENCE_LIKE_PATTERN.matcher(value).find()) {
            throw new IllegalArgumentException(fieldName + " must contain sentence-like structure");
        }
    }

    private String normalizePlainText(String value) {
        return value == null ? "" : value
                .replace("\r\n", "\n")
                .replace('\r', '\n')
                .trim();
    }

    private boolean containsDisallowedControlCharacter(String value) {
        for (int index = 0; index < value.length(); index++) {
            char ch = value.charAt(index);
            if (Character.isISOControl(ch) && ch != '\n' && ch != '\t') {
                return true;
            }
        }
        return false;
    }

    private QuestionEvaluation buildEvaluation(Long sessionId,
                                               Long questionId,
                                               InterviewEvaluationResult result,
                                               boolean evaluationError) {
        QuestionEvaluation evaluation = new QuestionEvaluation();
        evaluation.setSessionId(sessionId);
        evaluation.setQuestionId(questionId);
        evaluation.setScore(result.score());
        evaluation.setStrengths(new ArrayList<>(result.strengths()));
        evaluation.setWeaknesses(new ArrayList<>(result.weaknesses()));
        evaluation.setFeedback(result.feedback());
        evaluation.setModelAnswer(result.modelAnswer());
        evaluation.setEvaluationError(evaluationError);
        return evaluation;
    }

    private QuestionEvaluation fallbackEvaluation(Long sessionId, Long questionId) {
        return buildEvaluation(
                sessionId,
                questionId,
                new InterviewEvaluationResult(
                        0,
                        List.of("Strength assessment unavailable due to evaluation error."),
                        List.of("Evaluation unavailable"),
                        FALLBACK_FEEDBACK,
                        FALLBACK_MODEL_ANSWER
                ),
                true
        );
    }
}
