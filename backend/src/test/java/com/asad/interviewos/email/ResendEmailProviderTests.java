package com.asad.interviewos.email;

import org.junit.jupiter.api.Test;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.test.web.client.MockRestServiceServer;
import org.springframework.web.client.RestClient;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.header;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.jsonPath;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.requestTo;
import static org.springframework.test.web.client.response.MockRestResponseCreators.withStatus;
import static org.springframework.test.web.client.response.MockRestResponseCreators.withSuccess;

class ResendEmailProviderTests {

    @Test
    void sendPostsExpectedPayloadAndReturnsMessageId() {
        RestClient.Builder builder = RestClient.builder();
        MockRestServiceServer server = MockRestServiceServer.bindTo(builder).build();
        ResendEmailProvider provider = new ResendEmailProvider(
                builder,
                "resend",
                "no-reply@test.interviewos.dev",
                "support@test.interviewos.dev",
                "re_test_key"
        );

        server.expect(requestTo("https://api.resend.com/emails"))
                .andExpect(method(HttpMethod.POST))
                .andExpect(header(HttpHeaders.AUTHORIZATION, "Bearer re_test_key"))
                .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$.from").value("no-reply@test.interviewos.dev"))
                .andExpect(jsonPath("$.to[0]").value("candidate@example.com"))
                .andExpect(jsonPath("$.subject").value("Welcome to InterviewOS"))
                .andExpect(jsonPath("$.html").value("<p>Hello</p>"))
                .andExpect(jsonPath("$.text").value("Hello"))
                .andExpect(jsonPath("$.replyTo").value("support@test.interviewos.dev"))
                .andRespond(withSuccess("{\"id\":\"email_123\"}", MediaType.APPLICATION_JSON));

        String providerMessageId = provider.send(
                new EmailMessage("candidate@example.com", "Welcome to InterviewOS", "<p>Hello</p>", "Hello")
        );

        assertThat(providerMessageId).isEqualTo("email_123");
        server.verify();
    }

    @Test
    void sendThrowsOnNonSuccessResponse() {
        RestClient.Builder builder = RestClient.builder();
        MockRestServiceServer server = MockRestServiceServer.bindTo(builder).build();
        ResendEmailProvider provider = new ResendEmailProvider(
                builder,
                "resend",
                "no-reply@test.interviewos.dev",
                "support@test.interviewos.dev",
                "re_test_key"
        );

        server.expect(requestTo("https://api.resend.com/emails"))
                .andRespond(withStatus(HttpStatus.UNPROCESSABLE_ENTITY)
                        .contentType(MediaType.APPLICATION_JSON)
                        .body("{\"message\":\"invalid from address\"}"));

        assertThatThrownBy(() -> provider.send(
                new EmailMessage("candidate@example.com", "Welcome to InterviewOS", "<p>Hello</p>", "Hello")
        )).isInstanceOf(IllegalStateException.class)
                .hasMessageContaining("422");
    }
}
