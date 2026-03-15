package com.asad.interviewos.billing.service;

import com.asad.interviewos.billing.dto.BillingStatusResponse;
import com.asad.interviewos.billing.dto.CheckoutSessionResponse;
import com.asad.interviewos.billing.stripe.StripeBillingClient;
import com.asad.interviewos.billing.stripe.StripeCheckoutSession;
import com.asad.interviewos.billing.stripe.StripeCustomer;
import com.asad.interviewos.billing.stripe.StripeWebhookVerifier;
import com.asad.interviewos.entity.User;
import com.asad.interviewos.email.EmailService;
import com.asad.interviewos.repository.UserRepository;
import com.fasterxml.jackson.databind.JsonNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronization;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class BillingService {

    private static final Logger log = LoggerFactory.getLogger(BillingService.class);
    private static final String FREE_STATUS = "FREE";
    private static final String ACTIVE_STATUS = "ACTIVE";
    private static final String PAST_DUE_STATUS = "PAST_DUE";
    private static final String CANCELLED_STATUS = "CANCELLED";
    private static final String BASIC_PLAN = "BASIC";
    private static final String PRO_PLAN = "PRO";
    private static final String MONTHLY_INTERVAL = "MONTHLY";
    private static final String YEARLY_INTERVAL = "YEARLY";

    private final UserRepository userRepository;
    private final StripeBillingClient stripeBillingClient;
    private final StripeWebhookVerifier stripeWebhookVerifier;
    private final EmailService emailService;
    private final String basicMonthly;
    private final String basicYearly;
    private final String proMonthly;
    private final String proYearly;
    private final String successUrl;
    private final String cancelUrl;

    public BillingService(UserRepository userRepository,
                          StripeBillingClient stripeBillingClient,
                          StripeWebhookVerifier stripeWebhookVerifier,
                          EmailService emailService,
                          @Value("${stripe.price.basic.monthly}") String basicMonthly,
                          @Value("${stripe.price.basic.yearly}") String basicYearly,
                          @Value("${stripe.price.pro.monthly}") String proMonthly,
                          @Value("${stripe.price.pro.yearly}") String proYearly,
                          @Value("${app.billing.stripe.success-url:http://localhost:3000/dashboard?billing=success}") String successUrl,
                          @Value("${app.billing.stripe.cancel-url:http://localhost:3000/dashboard?billing=cancel}") String cancelUrl) {
        this.userRepository = userRepository;
        this.stripeBillingClient = stripeBillingClient;
        this.stripeWebhookVerifier = stripeWebhookVerifier;
        this.emailService = emailService;
        this.basicMonthly = basicMonthly == null ? "" : basicMonthly.trim();
        this.basicYearly = basicYearly == null ? "" : basicYearly.trim();
        this.proMonthly = proMonthly == null ? "" : proMonthly.trim();
        this.proYearly = proYearly == null ? "" : proYearly.trim();
        this.successUrl = successUrl == null ? "" : successUrl.trim();
        this.cancelUrl = cancelUrl == null ? "" : cancelUrl.trim();
    }

    @Transactional(readOnly = true)
    public BillingStatusResponse getBillingStatus(String userEmail) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("Authenticated user not found"));

        return new BillingStatusResponse(
                user.getSubscriptionStatus(),
                user.getSubscriptionPlan(),
                user.getSubscriptionInterval()
        );
    }

    @Transactional
    public CheckoutSessionResponse createCheckoutSession(String userEmail, String plan, String interval) {
        if (successUrl.isBlank() || cancelUrl.isBlank()) {
            throw new IllegalStateException("Stripe redirect URLs are not configured");
        }

        String priceId = resolveConfiguredPrice(plan, interval);
        String normalizedPlan = normalizePlanValue(plan);
        String normalizedInterval = normalizeIntervalValue(interval);

        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("Authenticated user not found"));
        Map<String, String> customerMetadata = buildCustomerMetadata(user);
        Map<String, String> checkoutMetadata = buildCheckoutMetadata(user, normalizedPlan, normalizedInterval);

        String customerId = user.getStripeCustomerId();
        if (customerId == null || customerId.isBlank()) {
            StripeCustomer customer = stripeBillingClient.createCustomer(
                    user.getEmail(),
                    customerMetadata
            );
            customerId = customer.id();
            user.setStripeCustomerId(customerId);
            userRepository.save(user);
        }

        StripeCheckoutSession session = stripeBillingClient.createCheckoutSession(
                customerId,
                priceId,
                successUrl,
                cancelUrl,
                checkoutMetadata
        );

        return new CheckoutSessionResponse(session.url());
    }

    private String resolveConfiguredPrice(String plan, String interval) {
        String resolvedPrice = resolvePrice(plan, interval);
        if (resolvedPrice.isBlank()) {
            throw new IllegalStateException(
                    "Stripe price is not configured for " + normalizePlan(plan) + " " + normalizeInterval(interval)
            );
        }
        return resolvedPrice;
    }

    private String resolvePrice(String plan, String interval) {
        if ("basic".equalsIgnoreCase(plan) && "monthly".equalsIgnoreCase(interval)) {
            return basicMonthly;
        }

        if ("basic".equalsIgnoreCase(plan) && "yearly".equalsIgnoreCase(interval)) {
            return basicYearly;
        }

        if ("pro".equalsIgnoreCase(plan) && "monthly".equalsIgnoreCase(interval)) {
            return proMonthly;
        }

        if ("pro".equalsIgnoreCase(plan) && "yearly".equalsIgnoreCase(interval)) {
            return proYearly;
        }

        throw new IllegalArgumentException("Invalid plan");
    }

    private String normalizePlan(String plan) {
        if (plan == null) {
            return "";
        }
        return plan.trim().toLowerCase();
    }

    private String normalizeInterval(String interval) {
        if (interval == null) {
            return "";
        }
        return interval.trim().toLowerCase();
    }

    @Transactional
    public void handleWebhook(String payload, String signatureHeader) {
        JsonNode event = stripeWebhookVerifier.verifyAndParse(payload, signatureHeader);
        String eventId = readText(event, "id");
        String eventType = readText(event, "type");
        JsonNode eventObject = event.path("data").path("object");

        switch (eventType) {
            case "checkout.session.completed" -> handleCheckoutCompleted(eventId, eventObject);
            case "invoice.paid" -> handleInvoicePaid(eventId, eventObject);
            case "invoice.payment_succeeded" -> handleInvoicePaymentSucceeded(eventId, eventObject);
            case "invoice.payment_failed" -> handleInvoicePaymentFailed(eventObject);
            case "customer.subscription.deleted" -> handleSubscriptionDeleted(eventObject);
            case "customer.subscription.updated" -> handleSubscriptionUpdated(eventId, eventObject);
            default -> log.debug("Ignoring unsupported Stripe event type {}", eventType);
        }
    }

    private void handleCheckoutCompleted(String eventId, JsonNode sessionObject) {
        String customerId = readText(sessionObject, "customer");
        String subscriptionId = readText(sessionObject, "subscription");
        String userId = readText(sessionObject.path("metadata"), "userId");
        String userEmail = readText(sessionObject.path("metadata"), "userEmail");
        if (userEmail == null || userEmail.isBlank()) {
            userEmail = readText(sessionObject, "customer_email");
        }

        Optional<User> user = findUser(customerId, subscriptionId, userId, userEmail);
        if (user.isEmpty()) {
            log.warn("Stripe checkout.session.completed could not be matched to a user");
            return;
        }

        SubscriptionUpdateOutcome outcome = applySubscriptionState(
                user.get(),
                ACTIVE_STATUS,
                extractPlan(sessionObject),
                extractInterval(sessionObject),
                customerId,
                subscriptionId
        );
        schedulePaymentConfirmationEmailAfterCommit(eventId, outcome);
    }

    private void handleInvoicePaid(String eventId, JsonNode invoiceObject) {
        SubscriptionUpdateOutcome outcome = updateFromSubscriptionEvent(invoiceObject, ACTIVE_STATUS);
        schedulePaymentConfirmationEmailAfterCommit(eventId, outcome);
    }

    private void handleInvoicePaymentSucceeded(String eventId, JsonNode invoiceObject) {
        SubscriptionUpdateOutcome outcome = updateFromSubscriptionEvent(invoiceObject, ACTIVE_STATUS);
        schedulePaymentConfirmationEmailAfterCommit(eventId, outcome);
    }

    private void handleInvoicePaymentFailed(JsonNode invoiceObject) {
        updateFromSubscriptionEvent(invoiceObject, PAST_DUE_STATUS);
    }

    private void handleSubscriptionDeleted(JsonNode subscriptionObject) {
        String customerId = readText(subscriptionObject, "customer");
        String subscriptionId = readText(subscriptionObject, "id");
        String userId = readText(subscriptionObject.path("metadata"), "userId");

        Optional<User> user = findUser(customerId, subscriptionId, userId, null);
        if (user.isEmpty()) {
            log.warn("Stripe customer.subscription.deleted could not be matched to a user");
            return;
        }

        applySubscriptionState(
                user.get(),
                CANCELLED_STATUS,
                extractPlan(subscriptionObject),
                extractInterval(subscriptionObject),
                customerId,
                subscriptionId
        );
    }

    private void handleSubscriptionUpdated(String eventId, JsonNode subscriptionObject) {
        String status = normalizeSubscriptionStatusValue(readText(subscriptionObject, "status"));
        if (status == null) {
            log.warn("Stripe customer.subscription.updated is missing a subscription status");
            return;
        }

        SubscriptionUpdateOutcome outcome = updateFromSubscriptionEvent(subscriptionObject, status);
        schedulePaymentConfirmationEmailAfterCommit(eventId, outcome);
    }

    private SubscriptionUpdateOutcome updateFromSubscriptionEvent(JsonNode object, String status) {
        String customerId = readText(object, "customer");
        String subscriptionId = readText(object, "subscription");
        String userId = readMetadataText(object, "userId");
        String userEmail = readMetadataText(object, "userEmail");

        Optional<User> user = findUser(customerId, subscriptionId, userId, userEmail);
        if (user.isEmpty()) {
            log.warn("Stripe billing event could not be matched to a user for status {}", status);
            return SubscriptionUpdateOutcome.noop();
        }

        return applySubscriptionState(
                user.get(),
                status,
                extractPlan(object),
                extractInterval(object),
                customerId,
                subscriptionId
        );
    }

    private Optional<User> findUser(String customerId, String subscriptionId, String userId, String userEmail) {
        if (customerId != null && !customerId.isBlank()) {
            Optional<User> userByCustomerId = userRepository.findByStripeCustomerId(customerId);
            if (userByCustomerId.isPresent()) {
                return userByCustomerId;
            }
        }

        if (subscriptionId != null && !subscriptionId.isBlank()) {
            Optional<User> userBySubscriptionId = userRepository.findByStripeSubscriptionId(subscriptionId);
            if (userBySubscriptionId.isPresent()) {
                return userBySubscriptionId;
            }
        }

        if (userId != null && !userId.isBlank()) {
            try {
                return userRepository.findById(Long.parseLong(userId));
            } catch (NumberFormatException ex) {
                log.warn("Stripe metadata userId '{}' is not a valid long", userId);
            }
        }

        if (userEmail != null && !userEmail.isBlank()) {
            return userRepository.findByEmail(userEmail);
        }

        return Optional.empty();
    }

    private SubscriptionUpdateOutcome applySubscriptionState(User user,
                                                             String status,
                                                             String plan,
                                                             String interval,
                                                             String customerId,
                                                             String subscriptionId) {
        boolean changed = false;
        String currentStatus = user.getSubscriptionStatus() == null ? FREE_STATUS : user.getSubscriptionStatus();

        if (customerId != null && !customerId.isBlank() && !customerId.equals(user.getStripeCustomerId())) {
            user.setStripeCustomerId(customerId);
            changed = true;
        }

        if (subscriptionId != null && !subscriptionId.isBlank() && !subscriptionId.equals(user.getStripeSubscriptionId())) {
            user.setStripeSubscriptionId(subscriptionId);
            changed = true;
        }

        if (!status.equalsIgnoreCase(currentStatus)) {
            user.setSubscriptionStatus(status);
            changed = true;
        }

        if (plan != null && !plan.equalsIgnoreCase(nullSafe(user.getSubscriptionPlan()))) {
            user.setSubscriptionPlan(plan);
            changed = true;
        }

        if (interval != null && !interval.equalsIgnoreCase(nullSafe(user.getSubscriptionInterval()))) {
            user.setSubscriptionInterval(interval);
            changed = true;
        }

        if (changed) {
            userRepository.save(user);
        }

        boolean transitionedToActive = !ACTIVE_STATUS.equalsIgnoreCase(currentStatus)
                && ACTIVE_STATUS.equalsIgnoreCase(status);
        return new SubscriptionUpdateOutcome(
                user.getId(),
                transitionedToActive,
                user.getSubscriptionPlan(),
                user.getSubscriptionInterval()
        );
    }

    private void schedulePaymentConfirmationEmailAfterCommit(String eventId, SubscriptionUpdateOutcome outcome) {
        if (!outcome.transitionedToActive()) {
            return;
        }

        Runnable emailTask = () -> emailService.sendPaymentConfirmationEmail(
                outcome.userId(),
                eventId,
                outcome.plan(),
                outcome.interval()
        );

        if (!TransactionSynchronizationManager.isSynchronizationActive()) {
            emailTask.run();
            return;
        }

        TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronization() {
            @Override
            public void afterCommit() {
                emailTask.run();
            }
        });
    }

    private Map<String, String> buildCustomerMetadata(User user) {
        return Map.of(
                "userId", user.getId().toString(),
                "userEmail", user.getEmail()
        );
    }

    private Map<String, String> buildCheckoutMetadata(User user, String plan, String interval) {
        return Map.of(
                "userId", user.getId().toString(),
                "userEmail", user.getEmail(),
                "plan", normalizePlan(plan),
                "interval", normalizeInterval(interval)
        );
    }

    private String extractPlan(JsonNode object) {
        String metadataPlan = readMetadataText(object, "plan");
        if (metadataPlan != null) {
            return normalizePlanValue(metadataPlan);
        }

        String priceId = extractPriceId(object);
        if (priceId == null) {
            return null;
        }

        return planForPriceId(priceId);
    }

    private String extractInterval(JsonNode object) {
        String metadataInterval = readMetadataText(object, "interval");
        if (metadataInterval != null) {
            return normalizeIntervalValue(metadataInterval);
        }

        String priceId = extractPriceId(object);
        if (priceId != null) {
            return intervalForPriceId(priceId);
        }

        String recurringInterval = readFirstText(
                object.path("items").path("data").path(0).path("price").path("recurring"),
                "interval"
        );
        if (recurringInterval != null) {
            return normalizeIntervalValue(recurringInterval);
        }

        recurringInterval = readFirstText(
                object.path("lines").path("data").path(0).path("price").path("recurring"),
                "interval"
        );
        if (recurringInterval != null) {
            return normalizeIntervalValue(recurringInterval);
        }

        return null;
    }

    private String readMetadataText(JsonNode object, String fieldName) {
        List<JsonNode> metadataCandidates = new ArrayList<>();
        metadataCandidates.add(object.path("metadata"));
        metadataCandidates.add(object.path("subscription_details").path("metadata"));
        metadataCandidates.add(object.path("parent").path("subscription_details").path("metadata"));
        metadataCandidates.add(object.path("lines").path("data").path(0).path("metadata"));
        metadataCandidates.add(object.path("lines").path("data").path(0).path("price").path("metadata"));

        for (JsonNode metadata : metadataCandidates) {
            String value = readText(metadata, fieldName);
            if (value != null) {
                return value;
            }
        }

        return null;
    }

    private String extractPriceId(JsonNode object) {
        String topLevelPriceId = readFirstText(object, "price", "id");
        if (topLevelPriceId != null) {
            return topLevelPriceId;
        }

        JsonNode items = object.path("items").path("data");
        if (items.isArray()) {
            for (JsonNode item : items) {
                String priceId = readFirstText(item, "price", "id");
                if (priceId != null) {
                    return priceId;
                }
            }
        }

        JsonNode lines = object.path("lines").path("data");
        if (!lines.isArray()) {
            return null;
        }

        for (JsonNode line : lines) {
            String priceId = readFirstText(line, "price", "id");
            if (priceId != null) {
                return priceId;
            }
        }

        return null;
    }

    private String planForPriceId(String priceId) {
        if (matchesPrice(priceId, basicMonthly, basicYearly)) {
            return BASIC_PLAN;
        }
        if (matchesPrice(priceId, proMonthly, proYearly)) {
            return PRO_PLAN;
        }
        return null;
    }

    private String intervalForPriceId(String priceId) {
        if (matchesPrice(priceId, basicMonthly, proMonthly)) {
            return MONTHLY_INTERVAL;
        }
        if (matchesPrice(priceId, basicYearly, proYearly)) {
            return YEARLY_INTERVAL;
        }
        return null;
    }

    private boolean matchesPrice(String actualPriceId, String firstExpected, String secondExpected) {
        return actualPriceId != null
                && (actualPriceId.equals(firstExpected) || actualPriceId.equals(secondExpected));
    }

    private String readFirstText(JsonNode node, String... fieldPath) {
        JsonNode current = node;
        for (String field : fieldPath) {
            if (current == null || current.isMissingNode()) {
                return null;
            }
            current = current.path(field);
        }
        if (current == null || current.isMissingNode() || current.isNull() || !current.isValueNode()) {
            return null;
        }
        String value = current.asText();
        return value == null || value.isBlank() ? null : value;
    }

    private String normalizePlanValue(String plan) {
        String normalizedPlan = normalizePlan(plan);
        if ("basic".equals(normalizedPlan)) {
            return BASIC_PLAN;
        }
        if ("pro".equals(normalizedPlan)) {
            return PRO_PLAN;
        }
        return null;
    }

    private String normalizeIntervalValue(String interval) {
        String normalizedInterval = normalizeInterval(interval);
        if ("monthly".equals(normalizedInterval) || "month".equals(normalizedInterval)) {
            return MONTHLY_INTERVAL;
        }
        if ("yearly".equals(normalizedInterval) || "year".equals(normalizedInterval)) {
            return YEARLY_INTERVAL;
        }
        return null;
    }

    private String normalizeSubscriptionStatusValue(String status) {
        if (status == null || status.isBlank()) {
            return null;
        }

        String normalizedStatus = status.trim().toUpperCase().replace('-', '_');
        if ("CANCELED".equals(normalizedStatus) || "CANCELLED".equals(normalizedStatus)) {
            return CANCELLED_STATUS;
        }
        return normalizedStatus;
    }

    private String nullSafe(String value) {
        return value == null ? "" : value;
    }

    private String readText(JsonNode node, String fieldName) {
        if (node == null || node.isMissingNode()) {
            return null;
        }

        JsonNode valueNode = node.get(fieldName);
        if (valueNode == null || valueNode.isNull() || !valueNode.isValueNode()) {
            return null;
        }

        String value = valueNode.asText();
        return value == null || value.isBlank() ? null : value;
    }

    private record SubscriptionUpdateOutcome(Long userId, boolean transitionedToActive, String plan, String interval) {
        private static SubscriptionUpdateOutcome noop() {
            return new SubscriptionUpdateOutcome(null, false, null, null);
        }
    }
}
