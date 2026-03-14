package com.asad.interviewos;

import com.asad.interviewos.billing.stripe.StripeBillingClient;
import com.asad.interviewos.billing.stripe.StripeCheckoutSession;
import com.asad.interviewos.billing.stripe.StripeCustomer;
import com.asad.interviewos.entity.User;
import com.asad.interviewos.interviews.repository.InterviewSessionRepository;
import com.asad.interviewos.interviews.repository.QuestionEvaluationRepository;
import com.asad.interviewos.interviews.repository.SessionAnswerRepository;
import com.asad.interviewos.interviews.repository.SessionQuestionRepository;
import com.asad.interviewos.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.HexFormat;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.anyMap;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class BillingIntegrationTests {

    private static final String TEST_WEBHOOK_SECRET = "whsec_test_secret";

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private InterviewSessionRepository interviewSessionRepository;

    @Autowired
    private SessionQuestionRepository sessionQuestionRepository;

    @Autowired
    private SessionAnswerRepository sessionAnswerRepository;

    @Autowired
    private QuestionEvaluationRepository questionEvaluationRepository;

    @MockitoBean
    private StripeBillingClient stripeBillingClient;

    @BeforeEach
    void cleanDatabase() {
        questionEvaluationRepository.deleteAll();
        sessionAnswerRepository.deleteAll();
        sessionQuestionRepository.deleteAll();
        interviewSessionRepository.deleteAll();
        userRepository.deleteAll();
    }

    @Test
    void createCheckoutSessionCreatesStripeCustomerOnceAndReturnsUrl() throws Exception {
        registerUser("billing@example.com", "password123");
        User user = userRepository.findByEmail("billing@example.com").orElseThrow();
        String authToken = loginAndGetAuthToken("billing@example.com", "password123");
        Map<String, String> customerMetadata = customerMetadata(user);
        Map<String, String> checkoutMetadata = checkoutMetadata(user, "basic", "monthly");

        when(stripeBillingClient.createCustomer(eq("billing@example.com"), eq(customerMetadata)))
                .thenReturn(new StripeCustomer("cus_test_123"));
        when(stripeBillingClient.createCheckoutSession(
                eq("cus_test_123"),
                eq("price_test_basic_monthly"),
                eq("http://localhost:3000/dashboard?billing=success"),
                eq("http://localhost:3000/dashboard?billing=cancel"),
                eq(checkoutMetadata)
        )).thenReturn(new StripeCheckoutSession("cs_test_123", "https://checkout.stripe.com/c/pay/cs_test_123"));

        mockMvc.perform(post("/api/billing/create-checkout-session")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken))
                        .content(checkoutRequest("basic", "monthly")))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.url").value("https://checkout.stripe.com/c/pay/cs_test_123"));

        User updatedUser = userRepository.findByEmail("billing@example.com").orElseThrow();
        assertThat(updatedUser.getStripeCustomerId()).isEqualTo("cus_test_123");

        verify(stripeBillingClient, times(1)).createCustomer(eq("billing@example.com"), eq(customerMetadata));
        verify(stripeBillingClient, times(1)).createCheckoutSession(
                eq("cus_test_123"),
                eq("price_test_basic_monthly"),
                eq("http://localhost:3000/dashboard?billing=success"),
                eq("http://localhost:3000/dashboard?billing=cancel"),
                eq(checkoutMetadata)
        );
    }

    @Test
    void createCheckoutSessionReusesExistingStripeCustomerId() throws Exception {
        registerUser("existing-customer@example.com", "password123");
        User user = userRepository.findByEmail("existing-customer@example.com").orElseThrow();
        user.setStripeCustomerId("cus_existing_123");
        userRepository.save(user);

        String authToken = loginAndGetAuthToken("existing-customer@example.com", "password123");
        Map<String, String> checkoutMetadata = checkoutMetadata(user, "basic", "yearly");

        when(stripeBillingClient.createCheckoutSession(
                eq("cus_existing_123"),
                eq("price_test_basic_yearly"),
                eq("http://localhost:3000/dashboard?billing=success"),
                eq("http://localhost:3000/dashboard?billing=cancel"),
                eq(checkoutMetadata)
        )).thenReturn(new StripeCheckoutSession("cs_test_existing", "https://checkout.stripe.com/c/pay/cs_test_existing"));

        mockMvc.perform(post("/api/billing/create-checkout-session")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken))
                        .content(checkoutRequest("basic", "yearly")))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.url").value("https://checkout.stripe.com/c/pay/cs_test_existing"));

        verify(stripeBillingClient, never()).createCustomer(eq("existing-customer@example.com"), anyMap());
    }

    @Test
    void createCheckoutSessionRejectsInvalidPlanSelection() throws Exception {
        registerUser("invalid-plan@example.com", "password123");
        String authToken = loginAndGetAuthToken("invalid-plan@example.com", "password123");

        mockMvc.perform(post("/api/billing/create-checkout-session")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken))
                        .content(checkoutRequest("enterprise", "monthly")))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.message").value("Invalid plan"));
    }

    @Test
    void getBillingStatusReturnsCurrentSubscriptionDetails() throws Exception {
        registerUser("status@example.com", "password123");
        User user = userRepository.findByEmail("status@example.com").orElseThrow();
        user.setSubscriptionStatus("ACTIVE");
        user.setSubscriptionPlan("PRO");
        user.setSubscriptionInterval("YEARLY");
        userRepository.save(user);

        String authToken = loginAndGetAuthToken("status@example.com", "password123");

        mockMvc.perform(get("/api/billing/status")
                        .header(HttpHeaders.AUTHORIZATION, bearer(authToken)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.subscriptionStatus").value("ACTIVE"))
                .andExpect(jsonPath("$.subscriptionPlan").value("PRO"))
                .andExpect(jsonPath("$.subscriptionInterval").value("YEARLY"));
    }

    @Test
    void stripeWebhookCheckoutCompletedActivatesSubscriptionAndIsIdempotent() throws Exception {
        registerUser("webhook@example.com", "password123");
        User user = userRepository.findByEmail("webhook@example.com").orElseThrow();

        String payload = """
                {
                  "id": "evt_checkout_complete",
                  "type": "checkout.session.completed",
                  "data": {
                    "object": {
                      "customer": "cus_checkout_123",
                      "subscription": "sub_checkout_123",
                      "customer_email": "webhook@example.com",
                      "metadata": {
                        "userId": "%d",
                        "userEmail": "webhook@example.com",
                        "plan": "pro",
                        "interval": "monthly"
                      }
                    }
                  }
                }
                """.formatted(user.getId());

        String signature = stripeSignature(payload);

        mockMvc.perform(post("/api/billing/webhook")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header("Stripe-Signature", signature)
                        .content(payload))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.received").value(true));

        mockMvc.perform(post("/api/billing/webhook")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header("Stripe-Signature", signature)
                        .content(payload))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.received").value(true));

        User updatedUser = userRepository.findByEmail("webhook@example.com").orElseThrow();
        assertThat(updatedUser.getSubscriptionStatus()).isEqualTo("ACTIVE");
        assertThat(updatedUser.getSubscriptionPlan()).isEqualTo("PRO");
        assertThat(updatedUser.getSubscriptionInterval()).isEqualTo("MONTHLY");
        assertThat(updatedUser.getStripeCustomerId()).isEqualTo("cus_checkout_123");
        assertThat(updatedUser.getStripeSubscriptionId()).isEqualTo("sub_checkout_123");
    }

    @Test
    void stripeWebhookInvoicePaymentSucceededActivatesSubscriptionAndPersistsPlan() throws Exception {
        registerUser("invoice-success@example.com", "password123");
        User user = userRepository.findByEmail("invoice-success@example.com").orElseThrow();

        String payload = """
                {
                  "id": "evt_invoice_payment_succeeded",
                  "type": "invoice.payment_succeeded",
                  "data": {
                    "object": {
                      "customer": "cus_invoice_123",
                      "subscription": "sub_invoice_123",
                      "subscription_details": {
                        "metadata": {
                          "userId": "%d",
                          "userEmail": "invoice-success@example.com",
                          "plan": "basic",
                          "interval": "yearly"
                        }
                      },
                      "lines": {
                        "data": [
                          {
                            "price": {
                              "id": "price_test_basic_yearly",
                              "recurring": {
                                "interval": "year"
                              }
                            }
                          }
                        ]
                      }
                    }
                  }
                }
                """.formatted(user.getId());

        mockMvc.perform(post("/api/billing/webhook")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header("Stripe-Signature", stripeSignature(payload))
                        .content(payload))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.received").value(true));

        User updatedUser = userRepository.findByEmail("invoice-success@example.com").orElseThrow();
        assertThat(updatedUser.getSubscriptionStatus()).isEqualTo("ACTIVE");
        assertThat(updatedUser.getSubscriptionPlan()).isEqualTo("BASIC");
        assertThat(updatedUser.getSubscriptionInterval()).isEqualTo("YEARLY");
        assertThat(updatedUser.getStripeCustomerId()).isEqualTo("cus_invoice_123");
        assertThat(updatedUser.getStripeSubscriptionId()).isEqualTo("sub_invoice_123");
    }

    @Test
    void stripeWebhookPaymentFailedMarksSubscriptionPastDue() throws Exception {
        registerUser("past-due@example.com", "password123");
        User user = userRepository.findByEmail("past-due@example.com").orElseThrow();
        user.setStripeCustomerId("cus_past_due_123");
        user.setStripeSubscriptionId("sub_past_due_123");
        user.setSubscriptionStatus("ACTIVE");
        user.setSubscriptionPlan("PRO");
        user.setSubscriptionInterval("MONTHLY");
        userRepository.save(user);

        String payload = """
                {
                  "id": "evt_invoice_failed",
                  "type": "invoice.payment_failed",
                  "data": {
                    "object": {
                      "customer": "cus_past_due_123",
                      "subscription": "sub_past_due_123"
                    }
                  }
                }
                """;

        mockMvc.perform(post("/api/billing/webhook")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header("Stripe-Signature", stripeSignature(payload))
                        .content(payload))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.received").value(true));

        User updatedUser = userRepository.findByEmail("past-due@example.com").orElseThrow();
        assertThat(updatedUser.getSubscriptionStatus()).isEqualTo("PAST_DUE");
        assertThat(updatedUser.getSubscriptionPlan()).isEqualTo("PRO");
        assertThat(updatedUser.getSubscriptionInterval()).isEqualTo("MONTHLY");
    }

    @Test
    void stripeWebhookSubscriptionDeletedMarksSubscriptionCancelled() throws Exception {
        registerUser("cancelled@example.com", "password123");
        User user = userRepository.findByEmail("cancelled@example.com").orElseThrow();
        user.setStripeCustomerId("cus_cancelled_123");
        user.setStripeSubscriptionId("sub_cancelled_123");
        user.setSubscriptionStatus("ACTIVE");
        user.setSubscriptionPlan("BASIC");
        user.setSubscriptionInterval("YEARLY");
        userRepository.save(user);

        String payload = """
                {
                  "id": "evt_subscription_deleted",
                  "type": "customer.subscription.deleted",
                  "data": {
                    "object": {
                      "id": "sub_cancelled_123",
                      "customer": "cus_cancelled_123"
                    }
                  }
                }
                """;

        mockMvc.perform(post("/api/billing/webhook")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header("Stripe-Signature", stripeSignature(payload))
                        .content(payload))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.received").value(true));

        User updatedUser = userRepository.findByEmail("cancelled@example.com").orElseThrow();
        assertThat(updatedUser.getSubscriptionStatus()).isEqualTo("CANCELLED");
        assertThat(updatedUser.getSubscriptionPlan()).isEqualTo("BASIC");
        assertThat(updatedUser.getSubscriptionInterval()).isEqualTo("YEARLY");
    }

    @Test
    void stripeWebhookRejectsInvalidSignature() throws Exception {
        String payload = """
                {"id":"evt_invalid","type":"checkout.session.completed","data":{"object":{"customer":"cus_123"}}}
                """;

        mockMvc.perform(post("/api/billing/webhook")
                        .contentType(MediaType.APPLICATION_JSON)
                        .header("Stripe-Signature", "t=1,v1=invalid")
                        .content(payload))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.message").value("Stripe signature verification failed"));
    }

    private void registerUser(String email, String password) throws Exception {
        String body = """
                {"email":"%s","password":"%s"}
                """.formatted(email, password);

        mockMvc.perform(post("/api/auth/register")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(body))
                .andExpect(status().isCreated());
    }

    private String loginAndGetAuthToken(String email, String password) throws Exception {
        String body = """
                {"email":"%s","password":"%s"}
                """.formatted(email, password);

        String responseBody = mockMvc.perform(post("/api/auth/login")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(body))
                .andExpect(status().isOk())
                .andReturn()
                .getResponse()
                .getContentAsString();

        int tokenStart = responseBody.indexOf(":\"") + 2;
        int tokenEnd = responseBody.lastIndexOf("\"");
        return responseBody.substring(tokenStart, tokenEnd);
    }

    private String bearer(String token) {
        return "Bearer " + token;
    }

    private Map<String, String> customerMetadata(User user) {
        return Map.of(
                "userId", user.getId().toString(),
                "userEmail", user.getEmail()
        );
    }

    private Map<String, String> checkoutMetadata(User user, String plan, String interval) {
        return Map.of(
                "userId", user.getId().toString(),
                "userEmail", user.getEmail(),
                "plan", plan,
                "interval", interval
        );
    }

    private String checkoutRequest(String plan, String interval) {
        return """
                {"plan":"%s","interval":"%s"}
                """.formatted(plan, interval);
    }

    private String stripeSignature(String payload) throws Exception {
        long timestamp = Instant.now().getEpochSecond();
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(new SecretKeySpec(TEST_WEBHOOK_SECRET.getBytes(StandardCharsets.UTF_8), "HmacSHA256"));
        byte[] digest = mac.doFinal((timestamp + "." + payload).getBytes(StandardCharsets.UTF_8));
        return "t=" + timestamp + ",v1=" + HexFormat.of().formatHex(digest);
    }
}
