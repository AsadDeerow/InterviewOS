package com.asad.interviewos.interviews.dto;

import com.asad.interviewos.interviews.domain.InterviewSession;
import com.asad.interviewos.interviews.domain.Role;

import java.time.LocalDateTime;

public class SessionHistoryResponse {

    private final Long id;
    private final String role;
    private final LocalDateTime createdAt;
    private final String status;

    public SessionHistoryResponse(Long id, String role, LocalDateTime createdAt, String status) {
        this.id = id;
        this.role = role;
        this.createdAt = createdAt;
        this.status = status;
    }

    public static SessionHistoryResponse from(InterviewSession session) {
        return new SessionHistoryResponse(
                session.getId(),
                roleLabel(session.getRole()),
                session.getCreatedAt(),
                statusLabel(session.getStatus())
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

    static String roleLabel(Role role) {
        if (role == null) {
            return "";
        }

        return switch (role) {
            case BACKEND_ENGINEER -> "Backend Engineer";
            case DATA_SCIENTIST -> "Data Scientist";
            case PRODUCT_MANAGER -> "Product Manager";
        };
    }

    static String statusLabel(String status) {
        if (status == null || status.isBlank()) {
            return "UNKNOWN";
        }

        if ("EVALUATED".equalsIgnoreCase(status) || "SUBMITTED".equalsIgnoreCase(status)) {
            return "COMPLETED";
        }

        return status.toUpperCase();
    }
}
