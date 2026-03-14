package com.asad.interviewos.billing.dto;

public class BillingStatusResponse {

    private final String subscriptionStatus;
    private final String subscriptionPlan;
    private final String subscriptionInterval;

    public BillingStatusResponse(String subscriptionStatus, String subscriptionPlan, String subscriptionInterval) {
        this.subscriptionStatus = subscriptionStatus;
        this.subscriptionPlan = subscriptionPlan;
        this.subscriptionInterval = subscriptionInterval;
    }

    public String getSubscriptionStatus() {
        return subscriptionStatus;
    }

    public String getSubscriptionPlan() {
        return subscriptionPlan;
    }

    public String getSubscriptionInterval() {
        return subscriptionInterval;
    }
}
