package com.asad.interviewos.email;

import com.asad.interviewos.entity.User;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

@Service
public class EmailTemplateService {

    private final String appBaseUrl;
    private final String supportAddress;

    public EmailTemplateService(@Value("${app.base-url:http://localhost:3000}") String appBaseUrl,
                                @Value("${email.reply-to:support@interviewos.dev}") String supportAddress) {
        this.appBaseUrl = normalizeBaseUrl(appBaseUrl);
        this.supportAddress = defaultIfBlank(supportAddress, "support@interviewos.dev");
    }

    public EmailMessage buildWelcomeEmail(User user) {
        String recipientLabel = recipientLabel(user);
        String escapedRecipientLabel = HtmlUtils.htmlEscape(recipientLabel);
        String escapedSupportAddress = HtmlUtils.htmlEscape(supportAddress);
        String dashboardUrl = buildUrl("/dashboard");
        String escapedDashboardUrl = HtmlUtils.htmlEscape(dashboardUrl);

        String subject = "Welcome to InterviewOS";
        String text = """
                Hi %s,

                Your InterviewOS account is ready.

                InterviewOS helps you run mock interviews, review structured feedback, and track your practice over time.

                Open your dashboard to start your first interview:
                %s

                If you need help, reply to this email or contact %s.
                """.formatted(recipientLabel, dashboardUrl, supportAddress).trim();

        String html = """
                <p>Hi %s,</p>
                <p>Your InterviewOS account is ready.</p>
                <p>InterviewOS helps you run mock interviews, review structured feedback, and track your practice over time.</p>
                <p><a href="%s">Open your dashboard</a> to start your first interview.</p>
                <p>If you need help, reply to this email or contact %s.</p>
                """.formatted(escapedRecipientLabel, escapedDashboardUrl, escapedSupportAddress).trim();

        return new EmailMessage(user.getEmail(), subject, html, text);
    }

    public EmailMessage buildPaymentConfirmationEmail(User user, String plan, String interval) {
        String recipientLabel = recipientLabel(user);
        String escapedRecipientLabel = HtmlUtils.htmlEscape(recipientLabel);
        String escapedSupportAddress = HtmlUtils.htmlEscape(supportAddress);
        String dashboardUrl = buildUrl("/dashboard");
        String billingUrl = buildUrl("/dashboard/pricing");
        String escapedDashboardUrl = HtmlUtils.htmlEscape(dashboardUrl);
        String escapedBillingUrl = HtmlUtils.htmlEscape(billingUrl);
        String planLabel = formatPlan(plan);
        String intervalLabel = formatInterval(interval);
        String summary = buildSubscriptionSummary(planLabel, intervalLabel);

        String subject = "Your InterviewOS subscription is active";
        String text = """
                Hi %s,

                Your InterviewOS subscription is active.
                Subscription: %s
                Status: Active

                Open your dashboard:
                %s

                Manage billing:
                %s

                If you need help, reply to this email or contact %s.
                """.formatted(recipientLabel, summary, dashboardUrl, billingUrl, supportAddress).trim();

        String html = """
                <p>Hi %s,</p>
                <p>Your InterviewOS subscription is active.</p>
                <ul>
                  <li><strong>Subscription:</strong> %s</li>
                  <li><strong>Status:</strong> Active</li>
                </ul>
                <p><a href="%s">Open your dashboard</a> or <a href="%s">manage billing</a>.</p>
                <p>If you need help, reply to this email or contact %s.</p>
                """.formatted(
                escapedRecipientLabel,
                HtmlUtils.htmlEscape(summary),
                escapedDashboardUrl,
                escapedBillingUrl,
                escapedSupportAddress
        ).trim();

        return new EmailMessage(user.getEmail(), subject, html, text);
    }

    private String recipientLabel(User user) {
        String email = defaultIfBlank(user.getEmail(), "there");
        int atIndex = email.indexOf('@');
        String localPart = atIndex > 0 ? email.substring(0, atIndex) : email;
        String readableLocalPart = localPart.replace('.', ' ')
                .replace('-', ' ')
                .replace('_', ' ')
                .trim();
        if (readableLocalPart.isEmpty()) {
            return email;
        }

        StringBuilder builder = new StringBuilder();
        for (String token : readableLocalPart.split("\\s+")) {
            if (token.isBlank()) {
                continue;
            }
            if (builder.length() > 0) {
                builder.append(' ');
            }
            builder.append(Character.toUpperCase(token.charAt(0)));
            if (token.length() > 1) {
                builder.append(token.substring(1));
            }
        }

        return builder.length() == 0 ? email : builder.toString();
    }

    private String buildSubscriptionSummary(String planLabel, String intervalLabel) {
        if (!planLabel.isBlank() && !intervalLabel.isBlank()) {
            return planLabel + " (" + intervalLabel + ")";
        }
        if (!planLabel.isBlank()) {
            return planLabel;
        }
        if (!intervalLabel.isBlank()) {
            return intervalLabel;
        }
        return "InterviewOS subscription";
    }

    private String formatPlan(String value) {
        String normalized = normalizeWord(value);
        if (normalized.isBlank()) {
            return "";
        }
        if ("pro".equals(normalized)) {
            return "Pro";
        }
        if ("basic".equals(normalized)) {
            return "Basic";
        }
        return titleCase(normalized);
    }

    private String formatInterval(String value) {
        String normalized = normalizeWord(value);
        if (normalized.isBlank()) {
            return "";
        }
        if ("month".equals(normalized) || "monthly".equals(normalized)) {
            return "Monthly";
        }
        if ("year".equals(normalized) || "yearly".equals(normalized)) {
            return "Yearly";
        }
        return titleCase(normalized);
    }

    private String titleCase(String value) {
        if (value.isBlank()) {
            return "";
        }
        return Character.toUpperCase(value.charAt(0)) + value.substring(1);
    }

    private String normalizeWord(String value) {
        return value == null ? "" : value.trim().toLowerCase();
    }

    private String buildUrl(String path) {
        return appBaseUrl + path;
    }

    private String normalizeBaseUrl(String value) {
        String resolved = defaultIfBlank(value, "http://localhost:3000");
        if (resolved.endsWith("/")) {
            return resolved.substring(0, resolved.length() - 1);
        }
        return resolved;
    }

    private String defaultIfBlank(String value, String fallback) {
        if (value == null || value.isBlank()) {
            return fallback;
        }
        return value.trim();
    }
}
