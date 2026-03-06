package com.asad.interviewos.interviews.domain;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "interview_session")
public class InterviewSession {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long userId;

    @Enumerated(EnumType.STRING)
    private Role role;

    private LocalDateTime createdAt;

    private String status;

    @PrePersist
    void onCreate() {
        this.createdAt = LocalDateTime.now();
        if (this.status == null) {
            this.status = "IN_PROGRESS";
        }
    }

    public Long getId() { return id; }

    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }

    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; }

    public LocalDateTime getCreatedAt() { return createdAt; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}