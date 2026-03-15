package com.asad.interviewos.email;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;

import java.time.LocalDateTime;

@Entity
@Table(
        name = "email_deliveries",
        uniqueConstraints = @UniqueConstraint(
                name = "uk_email_deliveries_type_external_event",
                columnNames = {"email_type", "external_event_id"}
        )
)
public class EmailDelivery {

    private static final int MAX_ERROR_LENGTH = 1000;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Enumerated(EnumType.STRING)
    @Column(name = "email_type", nullable = false, length = 100)
    private EmailType emailType;

    @Column(name = "external_event_id", length = 255)
    private String externalEventId;

    @Column(name = "provider_message_id", length = 255)
    private String providerMessageId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 50)
    private EmailDeliveryStatus status = EmailDeliveryStatus.PENDING;

    @Column(name = "error_message", length = MAX_ERROR_LENGTH)
    private String errorMessage;

    @Column(name = "sent_at")
    private LocalDateTime sentAt;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt = LocalDateTime.now();

    public EmailDelivery() {
    }

    public EmailDelivery(Long userId, EmailType emailType, String externalEventId) {
        this.userId = userId;
        this.emailType = emailType;
        this.externalEventId = normalizeEventId(externalEventId);
    }

    public Long getId() {
        return id;
    }

    public Long getUserId() {
        return userId;
    }

    public EmailType getEmailType() {
        return emailType;
    }

    public String getExternalEventId() {
        return externalEventId;
    }

    public String getProviderMessageId() {
        return providerMessageId;
    }

    public EmailDeliveryStatus getStatus() {
        return status;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public LocalDateTime getSentAt() {
        return sentAt;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public boolean isPending() {
        return status == EmailDeliveryStatus.PENDING;
    }

    public boolean isSent() {
        return status == EmailDeliveryStatus.SENT;
    }

    public boolean isFailed() {
        return status == EmailDeliveryStatus.FAILED;
    }

    public void markPending() {
        this.status = EmailDeliveryStatus.PENDING;
        this.providerMessageId = null;
        this.errorMessage = null;
        this.sentAt = null;
    }

    public void markSent(String providerMessageId) {
        this.status = EmailDeliveryStatus.SENT;
        this.providerMessageId = normalizeBlankToNull(providerMessageId);
        this.errorMessage = null;
        this.sentAt = LocalDateTime.now();
    }

    public void markFailed(String errorMessage) {
        this.status = EmailDeliveryStatus.FAILED;
        this.providerMessageId = null;
        this.errorMessage = truncate(normalizeBlankToNull(errorMessage));
        this.sentAt = null;
    }

    private static String truncate(String value) {
        if (value == null || value.length() <= MAX_ERROR_LENGTH) {
            return value;
        }
        return value.substring(0, MAX_ERROR_LENGTH);
    }

    private static String normalizeEventId(String value) {
        return normalizeBlankToNull(value);
    }

    private static String normalizeBlankToNull(String value) {
        if (value == null) {
            return null;
        }
        String trimmed = value.trim();
        return trimmed.isEmpty() ? null : trimmed;
    }
}
