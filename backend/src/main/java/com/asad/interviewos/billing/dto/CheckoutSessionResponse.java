package com.asad.interviewos.billing.dto;

public class CheckoutSessionResponse {

    private final String url;

    public CheckoutSessionResponse(String url) {
        this.url = url;
    }

    public String getUrl() {
        return url;
    }
}
