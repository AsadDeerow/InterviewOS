package com.asad.interviewos.billing.stripe;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Customer;
import com.stripe.model.checkout.Session;
import com.stripe.param.CustomerCreateParams;
import com.stripe.param.checkout.SessionCreateParams;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.util.Map;

@Component
public class StripeSdkBillingClient implements StripeBillingClient {

    private final String secretKey;
    private final String baseUrl;
    private final int timeoutMillis;

    public StripeSdkBillingClient(
            @Value("${stripe.secret.key}") String secretKey,
            @Value("${app.billing.stripe.base-url:https://api.stripe.com}") String baseUrl,
            @Value("${app.billing.stripe.timeout-seconds:30}") long timeoutSeconds) {
        this.secretKey = secretKey == null ? "" : secretKey.trim();
        this.baseUrl = baseUrl == null ? "" : baseUrl.trim();
        this.timeoutMillis = Math.toIntExact(Duration.ofSeconds(timeoutSeconds).toMillis());
    }

    @PostConstruct
    void init() {
        ensureConfigured();
        Stripe.apiKey = secretKey;
        Stripe.setConnectTimeout(timeoutMillis);
        Stripe.setReadTimeout(timeoutMillis);
        Stripe.setMaxNetworkRetries(2);
        if (!baseUrl.isBlank()) {
            Stripe.overrideApiBase(baseUrl);
        }
    }

    @Override
    public StripeCustomer createCustomer(String email, Map<String, String> metadata) {
        ensureConfigured();

        CustomerCreateParams.Builder paramsBuilder = CustomerCreateParams.builder()
                .setEmail(email);
        metadata.forEach(paramsBuilder::putMetadata);

        try {
            Customer customer = Customer.create(paramsBuilder.build());
            return new StripeCustomer(readRequiredValue(customer.getId(), "Stripe customer id"));
        } catch (StripeException ex) {
            throw new IllegalStateException("Stripe customer creation failed", ex);
        }
    }

    @Override
    public StripeCheckoutSession createCheckoutSession(String customerId,
                                                       String priceId,
                                                       String successUrl,
                                                       String cancelUrl,
                                                       Map<String, String> metadata) {
        ensureConfigured();

        SessionCreateParams.Builder paramsBuilder = SessionCreateParams.builder()
                .setMode(SessionCreateParams.Mode.SUBSCRIPTION)
                .setCustomer(customerId)
                .setSuccessUrl(successUrl)
                .setCancelUrl(cancelUrl)
                .setSubscriptionData(buildSubscriptionData(metadata))
                .addLineItem(
                        SessionCreateParams.LineItem.builder()
                                .setPrice(priceId)
                                .setQuantity(1L)
                                .build()
                );
        metadata.forEach(paramsBuilder::putMetadata);

        try {
            Session session = Session.create(paramsBuilder.build());
            return new StripeCheckoutSession(
                    readRequiredValue(session.getId(), "Stripe checkout session id"),
                    readRequiredValue(session.getUrl(), "Stripe checkout session url")
            );
        } catch (StripeException ex) {
            throw new IllegalStateException("Stripe checkout session creation failed", ex);
        }
    }

    private SessionCreateParams.SubscriptionData buildSubscriptionData(Map<String, String> metadata) {
        SessionCreateParams.SubscriptionData.Builder builder = SessionCreateParams.SubscriptionData.builder();
        metadata.forEach(builder::putMetadata);
        return builder.build();
    }

    private void ensureConfigured() {
        if (secretKey.isBlank()) {
            throw new IllegalStateException("Stripe secret key is not configured");
        }
    }

    private String readRequiredValue(String value, String label) {
        if (value == null || value.isBlank()) {
            throw new IllegalStateException(label + " is missing");
        }
        return value;
    }
}
