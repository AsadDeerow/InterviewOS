package com.asad.interviewos.interviews.dto;

import java.util.List;

public class SubmitAnswersResponse {

    private final int overallScore;
    private final List<QuestionEvaluationResponse> evaluations;

    public SubmitAnswersResponse(int overallScore, List<QuestionEvaluationResponse> evaluations) {
        this.overallScore = overallScore;
        this.evaluations = evaluations;
    }

    public int getOverallScore() {
        return overallScore;
    }

    public List<QuestionEvaluationResponse> getEvaluations() {
        return evaluations;
    }
}
