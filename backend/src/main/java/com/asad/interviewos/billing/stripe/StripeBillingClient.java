package com.asad.interviewos.billing.stripe;

import java.util.Map;

public interface StripeBillingClient {

    StripeCustomer createCustomer(String email, Map<String, String> metadata);

    StripeCheckoutSession createCheckoutSession(String customerId,
                                                String priceId,
                                                String successUrl,
                                                String cancelUrl,
                                                Map<String, String> metadata);
}
