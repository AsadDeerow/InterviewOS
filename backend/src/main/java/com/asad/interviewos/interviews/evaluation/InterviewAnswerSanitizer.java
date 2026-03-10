package com.asad.interviewos.interviews.evaluation;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class InterviewAnswerSanitizer {

    private final int maxAnswerLength;

    public InterviewAnswerSanitizer(@Value("${app.evaluation.max-answer-length:2000}") int maxAnswerLength) {
        this.maxAnswerLength = maxAnswerLength;
    }

    public String sanitize(String answerText) {
        if (answerText == null) {
            return "";
        }

        String normalized = answerText.trim()
                .replace("\r\n", "\n")
                .replace('\r', '\n');

        StringBuilder cleaned = new StringBuilder(normalized.length());
        for (int index = 0; index < normalized.length(); index++) {
            char current = normalized.charAt(index);
            if (Character.isISOControl(current) && current != '\n' && current != '\t') {
                continue;
            }
            cleaned.append(current);
        }

        String sanitized = cleaned.toString();
        if (sanitized.length() > maxAnswerLength) {
            sanitized = sanitized.substring(0, maxAnswerLength);
        }

        return sanitized.trim();
    }
}
