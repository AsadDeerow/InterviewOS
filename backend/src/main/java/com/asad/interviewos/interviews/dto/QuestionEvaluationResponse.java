package com.asad.interviewos.interviews.dto;

import java.util.List;

public class QuestionEvaluationResponse {

    private final Long questionId;
    private final int score;
    private final List<String> strengths;
    private final List<String> weaknesses;
    private final String feedback;
    private final String modelAnswer;

    public QuestionEvaluationResponse(Long questionId,
                                      int score,
                                      List<String> strengths,
                                      List<String> weaknesses,
                                      String feedback,
                                      String modelAnswer) {
        this.questionId = questionId;
        this.score = score;
        this.strengths = strengths;
        this.weaknesses = weaknesses;
        this.feedback = feedback;
        this.modelAnswer = modelAnswer;
    }

    public Long getQuestionId() {
        return questionId;
    }

    public int getScore() {
        return score;
    }

    public List<String> getStrengths() {
        return strengths;
    }

    public List<String> getWeaknesses() {
        return weaknesses;
    }

    public String getFeedback() {
        return feedback;
    }

    public String getModelAnswer() {
        return modelAnswer;
    }
}
