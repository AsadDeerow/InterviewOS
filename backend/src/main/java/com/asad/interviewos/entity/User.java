package com.asad.interviewos.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String email;

    @Column(nullable = false)
    private String passwordHash;

    @Column(nullable = false)
    private String subscriptionStatus = "FREE";

    @Column(name = "subscription_plan")
    private String subscriptionPlan;

    @Column(name = "subscription_interval")
    private String subscriptionInterval;

    @Column(name = "stripe_customer_id")
    private String stripeCustomerId;

    @Column(name = "stripe_subscription_id")
    private String stripeSubscriptionId;

    @Column(nullable = false)
    private LocalDateTime createdAt = LocalDateTime.now();

    public User() {}

    public User(String email, String passwordHash) {
        this.email = email;
        this.passwordHash = passwordHash;
    }

    public Long getId() { return id; }

    public String getEmail() { return email; }

    public String getPasswordHash() { return passwordHash; }

    public String getSubscriptionStatus() { return subscriptionStatus; }

    public String getSubscriptionPlan() { return subscriptionPlan; }

    public String getSubscriptionInterval() { return subscriptionInterval; }

    public String getStripeCustomerId() { return stripeCustomerId; }

    public String getStripeSubscriptionId() { return stripeSubscriptionId; }

    public LocalDateTime getCreatedAt() { return createdAt; }

    public void setEmail(String email) { this.email = email; }

    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }

    public void setSubscriptionStatus(String subscriptionStatus) {
        this.subscriptionStatus = subscriptionStatus;
    }

    public void setSubscriptionPlan(String subscriptionPlan) {
        this.subscriptionPlan = subscriptionPlan;
    }

    public void setSubscriptionInterval(String subscriptionInterval) {
        this.subscriptionInterval = subscriptionInterval;
    }

    public void setStripeCustomerId(String stripeCustomerId) {
        this.stripeCustomerId = stripeCustomerId;
    }

    public void setStripeSubscriptionId(String stripeSubscriptionId) {
        this.stripeSubscriptionId = stripeSubscriptionId;
    }
}
