package com.asad.interviewos.billing.controller;

import com.asad.interviewos.billing.dto.BillingStatusResponse;
import com.asad.interviewos.billing.dto.CreateCheckoutSessionRequest;
import com.asad.interviewos.billing.service.BillingService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/billing")
public class BillingController {

    private final BillingService billingService;

    public BillingController(BillingService billingService) {
        this.billingService = billingService;
    }

    @GetMapping("/status")
    public ResponseEntity<?> getBillingStatus(Authentication authentication) {
        try {
            BillingStatusResponse response = billingService.getBillingStatus(authentication.getName());
            return ResponseEntity.ok(response);
        } catch (IllegalArgumentException ex) {
            return ResponseEntity.badRequest().body(Map.of("message", ex.getMessage()));
        }
    }

    @PostMapping("/create-checkout-session")
    public ResponseEntity<?> createCheckoutSession(@Valid @RequestBody CreateCheckoutSessionRequest request,
                                                   Authentication authentication) {
        try {
            return ResponseEntity.ok(
                    billingService.createCheckoutSession(authentication.getName(), request.getPlan(), request.getInterval())
            );
        } catch (IllegalArgumentException ex) {
            return ResponseEntity.badRequest().body(Map.of("message", ex.getMessage()));
        } catch (IllegalStateException ex) {
            return ResponseEntity.internalServerError().body(Map.of("message", ex.getMessage()));
        }
    }

    @PostMapping({"/webhook", "/stripe/webhook"})
    public ResponseEntity<?> handleStripeWebhook(@RequestBody String payload,
                                                 @RequestHeader(name = "Stripe-Signature", required = false) String signatureHeader) {
        try {
            billingService.handleWebhook(payload, signatureHeader);
            return ResponseEntity.ok(Map.of("received", true));
        } catch (IllegalArgumentException ex) {
            return ResponseEntity.badRequest().body(Map.of("message", ex.getMessage()));
        } catch (IllegalStateException ex) {
            return ResponseEntity.internalServerError().body(Map.of("message", ex.getMessage()));
        }
    }
}
