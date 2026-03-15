package com.asad.interviewos.email;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestClientResponseException;

import java.util.List;

@Component
public class ResendEmailProvider implements EmailProvider {

    private static final Logger log = LoggerFactory.getLogger(ResendEmailProvider.class);
    private static final String RESEND_PROVIDER = "resend";

    private final RestClient restClient;
    private final String providerName;
    private final String fromAddress;
    private final String replyToAddress;
    private final String apiKey;

    public ResendEmailProvider(RestClient.Builder restClientBuilder,
                               @Value("${email.provider:resend}") String providerName,
                               @Value("${email.from:no-reply@interviewos.dev}") String fromAddress,
                               @Value("${email.reply-to:support@interviewos.dev}") String replyToAddress,
                               @Value("${email.resend.api-key:}") String apiKey) {
        this.providerName = normalize(providerName);
        this.fromAddress = normalize(fromAddress);
        this.replyToAddress = normalize(replyToAddress);
        this.apiKey = normalize(apiKey);
        this.restClient = restClientBuilder
                .baseUrl("https://api.resend.com")
                .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
                .defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + this.apiKey)
                .build();
    }

    @Override
    public String send(EmailMessage message) {
        ensureConfigured();

        ResendSendEmailRequest request = new ResendSendEmailRequest(
                fromAddress,
                List.of(message.to()),
                message.subject(),
                blankToNull(message.html()),
                blankToNull(message.text()),
                blankToNull(replyToAddress)
        );

        try {
            ResendSendEmailResponse response = restClient.post()
                    .uri("/emails")
                    .body(request)
                    .retrieve()
                    .body(ResendSendEmailResponse.class);

            if (response == null || response.id() == null || response.id().isBlank()) {
                throw new IllegalStateException("Resend response did not include an email id");
            }

            log.info("Resend accepted email to {} with id {}", message.to(), response.id());
            return response.id();
        } catch (RestClientResponseException ex) {
            log.error(
                    "Resend email send failed for {} with status {} and body {}",
                    message.to(),
                    ex.getStatusCode().value(),
                    ex.getResponseBodyAsString(),
                    ex
            );
            throw new IllegalStateException("Resend email send failed with status " + ex.getStatusCode().value(), ex);
        } catch (RestClientException ex) {
            log.error("Resend email send failed for {}", message.to(), ex);
            throw new IllegalStateException("Resend email send failed", ex);
        }
    }

    private void ensureConfigured() {
        if (!RESEND_PROVIDER.equalsIgnoreCase(providerName)) {
            throw new IllegalStateException("Unsupported email provider: " + providerName);
        }
        if (apiKey.isBlank()) {
            throw new IllegalStateException("Resend API key is not configured");
        }
        if (fromAddress.isBlank()) {
            throw new IllegalStateException("Email from address is not configured");
        }
    }

    private String normalize(String value) {
        return value == null ? "" : value.trim();
    }

    private String blankToNull(String value) {
        if (value == null || value.isBlank()) {
            return null;
        }
        return value;
    }

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private record ResendSendEmailRequest(
            String from,
            List<String> to,
            String subject,
            String html,
            String text,
            String replyTo
    ) {
    }

    private record ResendSendEmailResponse(String id) {
    }
}
