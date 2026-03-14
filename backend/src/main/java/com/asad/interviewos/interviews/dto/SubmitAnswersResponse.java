package com.asad.interviewos.interviews.dto;

import java.util.List;

public class SubmitAnswersResponse {

    private final double overallScore;
    private final List<QuestionEvaluationResponse> evaluations;

    public SubmitAnswersResponse(double overallScore, List<QuestionEvaluationResponse> evaluations) {
        this.overallScore = overallScore;
        this.evaluations = evaluations;
    }

    public double getOverallScore() {
        return overallScore;
    }

    public List<QuestionEvaluationResponse> getEvaluations() {
        return evaluations;
    }
}
