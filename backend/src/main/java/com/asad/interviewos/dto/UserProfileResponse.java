package com.asad.interviewos.dto;

public class UserProfileResponse {

    private String email;
    private String role;
    private String subscriptionStatus;
    private String subscriptionPlan;
    private String subscriptionInterval;

    public UserProfileResponse(String email, String role, String subscriptionStatus,
                                String subscriptionPlan, String subscriptionInterval) {
        this.email = email;
        this.role = role;
        this.subscriptionStatus = subscriptionStatus;
        this.subscriptionPlan = subscriptionPlan;
        this.subscriptionInterval = subscriptionInterval;
    }

    public String getEmail() { return email; }
    public String getRole() { return role; }
    public String getSubscriptionStatus() { return subscriptionStatus; }
    public String getSubscriptionPlan() { return subscriptionPlan; }
    public String getSubscriptionInterval() { return subscriptionInterval; }
}
