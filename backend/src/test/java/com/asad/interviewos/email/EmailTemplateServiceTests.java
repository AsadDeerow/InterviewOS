package com.asad.interviewos.email;

import com.asad.interviewos.entity.User;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class EmailTemplateServiceTests {

    private final EmailTemplateService templateService =
            new EmailTemplateService("http://localhost:3000/", "support@interviewos.dev");

    @Test
    void welcomeTemplateIncludesDashboardLinkAndSupportAddress() {
        User user = new User("candidate@example.com", "hashed-password");

        EmailMessage message = templateService.buildWelcomeEmail(user);

        assertThat(message.to()).isEqualTo("candidate@example.com");
        assertThat(message.subject()).isEqualTo("Welcome to InterviewOS");
        assertThat(message.html()).contains("http://localhost:3000/dashboard");
        assertThat(message.html()).contains("support@interviewos.dev");
        assertThat(message.text()).contains("InterviewOS helps you run mock interviews");
        assertThat(message.text()).doesNotContain("null");
    }

    @Test
    void paymentTemplateRendersPlanIntervalAndStatusWithoutNulls() {
        User user = new User("paid.user@example.com", "hashed-password");

        EmailMessage message = templateService.buildPaymentConfirmationEmail(user, "PRO", "YEARLY");

        assertThat(message.to()).isEqualTo("paid.user@example.com");
        assertThat(message.subject()).isEqualTo("Your InterviewOS subscription is active");
        assertThat(message.html()).contains("Pro (Yearly)");
        assertThat(message.html()).contains("Active");
        assertThat(message.html()).contains("http://localhost:3000/dashboard/pricing");
        assertThat(message.text()).contains("Subscription: Pro (Yearly)");
        assertThat(message.text()).doesNotContain("null");
    }
}
