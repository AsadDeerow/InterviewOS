package com.asad.interviewos.interviews.dto;

import com.asad.interviewos.interviews.domain.InterviewSession;

import java.time.LocalDateTime;
import java.util.List;

public class SessionDetailResponse {

    private final Long id;
    private final String role;
    private final LocalDateTime createdAt;
    private final String status;
    private final List<SessionFeedbackResponse> evaluations;

    public SessionDetailResponse(Long id,
                                 String role,
                                 LocalDateTime createdAt,
                                 String status,
                                 List<SessionFeedbackResponse> evaluations) {
        this.id = id;
        this.role = role;
        this.createdAt = createdAt;
        this.status = status;
        this.evaluations = evaluations;
    }

    public static SessionDetailResponse from(InterviewSession session, List<SessionFeedbackResponse> evaluations) {
        return new SessionDetailResponse(
                session.getId(),
                SessionHistoryResponse.roleLabel(session.getRole()),
                session.getCreatedAt(),
                SessionHistoryResponse.statusLabel(session.getStatus()),
                evaluations
        );
    }

    public Long getId() {
        return id;
    }

    public String getRole() {
        return role;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public String getStatus() {
        return status;
    }

    public List<SessionFeedbackResponse> getEvaluations() {
        return evaluations;
    }
}
