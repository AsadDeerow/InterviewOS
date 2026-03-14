package com.asad.interviewos.interviews.dto;

import com.asad.interviewos.interviews.domain.QuestionEvaluation;
import com.asad.interviewos.interviews.domain.SessionAnswer;

import java.util.List;

public class SessionFeedbackResponse {

    private final Long questionId;
    private final String question;
    private final String answer;
    private final Integer score;
    private final String feedback;
    private final List<String> strengths;
    private final List<String> weaknesses;
    private final String modelAnswer;

    public SessionFeedbackResponse(Long questionId,
                                   String question,
                                   String answer,
                                   Integer score,
                                   String feedback,
                                   List<String> strengths,
                                   List<String> weaknesses,
                                   String modelAnswer) {
        this.questionId = questionId;
        this.question = question;
        this.answer = answer;
        this.score = score;
        this.feedback = feedback;
        this.strengths = strengths;
        this.weaknesses = weaknesses;
        this.modelAnswer = modelAnswer;
    }

    public static SessionFeedbackResponse from(Long questionId,
                                               String question,
                                               SessionAnswer answer,
                                               QuestionEvaluation evaluation) {
        return new SessionFeedbackResponse(
                questionId,
                question,
                answer != null ? answer.getAnswerText() : "",
                evaluation != null ? evaluation.getScore() : null,
                evaluation != null ? evaluation.getFeedback() : null,
                evaluation != null ? evaluation.getStrengths() : List.of(),
                evaluation != null ? evaluation.getWeaknesses() : List.of(),
                evaluation != null ? evaluation.getModelAnswer() : null
        );
    }

    public Long getQuestionId() {
        return questionId;
    }

    public String getQuestion() {
        return question;
    }

    public String getAnswer() {
        return answer;
    }

    public Integer getScore() {
        return score;
    }

    public String getFeedback() {
        return feedback;
    }

    public List<String> getStrengths() {
        return strengths;
    }

    public List<String> getWeaknesses() {
        return weaknesses;
    }

    public String getModelAnswer() {
        return modelAnswer;
    }
}
