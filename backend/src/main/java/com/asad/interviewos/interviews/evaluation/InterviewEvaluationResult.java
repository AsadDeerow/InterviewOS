package com.asad.interviewos.interviews.evaluation;

import java.util.List;

public record InterviewEvaluationResult(
        int score,
        List<String> strengths,
        List<String> weaknesses,
        String feedback,
        String modelAnswer
) {
}
