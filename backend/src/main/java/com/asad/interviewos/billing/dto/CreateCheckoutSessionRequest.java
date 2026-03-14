package com.asad.interviewos.billing.dto;

import jakarta.validation.constraints.NotBlank;

public class CreateCheckoutSessionRequest {

    @NotBlank(message = "Plan is required")
    private String plan;

    @NotBlank(message = "Interval is required")
    private String interval;

    public String getPlan() {
        return plan;
    }

    public void setPlan(String plan) {
        this.plan = plan;
    }

    public String getInterval() {
        return interval;
    }

    public void setInterval(String interval) {
        this.interval = interval;
    }
}
