package com.asad.interviewos.billing.stripe;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.stripe.exception.SignatureVerificationException;
import com.stripe.net.Webhook;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class StripeWebhookVerifier {

    private final ObjectMapper objectMapper;
    private final String webhookSecret;
    private final long toleranceSeconds;

    public StripeWebhookVerifier(ObjectMapper objectMapper,
                                 @Value("${app.billing.stripe.webhook-secret:${STRIPE_WEBHOOK_SECRET:}}") String webhookSecret,
                                 @Value("${app.billing.stripe.webhook-tolerance-seconds:300}") long toleranceSeconds) {
        this.objectMapper = objectMapper;
        this.webhookSecret = webhookSecret == null ? "" : webhookSecret.trim();
        this.toleranceSeconds = toleranceSeconds;
    }

    public JsonNode verifyAndParse(String payload, String signatureHeader) {
        if (webhookSecret.isBlank()) {
            throw new IllegalStateException("Stripe webhook secret is not configured");
        }
        if (payload == null || payload.isBlank()) {
            throw new IllegalArgumentException("Stripe webhook payload is empty");
        }
        if (signatureHeader == null || signatureHeader.isBlank()) {
            throw new IllegalArgumentException("Stripe signature header is missing");
        }

        try {
            Webhook.constructEvent(payload, signatureHeader, webhookSecret, toleranceSeconds);
            return objectMapper.readTree(payload);
        } catch (SignatureVerificationException ex) {
            throw new IllegalArgumentException("Stripe signature verification failed", ex);
        } catch (Exception ex) {
            throw new IllegalArgumentException("Stripe webhook payload is not valid JSON", ex);
        }
    }
}
