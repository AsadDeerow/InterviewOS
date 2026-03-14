package com.asad.interviewos.interviews.controller;

import com.asad.interviewos.interviews.dto.StartInterviewRequest;
import com.asad.interviewos.interviews.dto.StartInterviewResponse;
import com.asad.interviewos.interviews.dto.SubmitAnswersRequest;
import com.asad.interviewos.interviews.dto.SubmitAnswersResponse;
import com.asad.interviewos.interviews.service.InterviewService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import java.util.Map;

@RestController
@RequestMapping("/api/interviews")
public class InterviewController {

    private static final String FREE_TIER_LIMIT_REACHED = "FREE_TIER_LIMIT_REACHED";
    private static final String FREE_TIER_LIMIT_MESSAGE =
            "You have used your 2 free sessions this month. Upgrade to continue practicing.";

    private final InterviewService interviewService;

    public InterviewController(InterviewService interviewService) {
        this.interviewService = interviewService;
    }

    @PostMapping("/start")
    public ResponseEntity<?> startInterview(@Valid @RequestBody StartInterviewRequest request,
                                            Authentication authentication) {
        try {
            StartInterviewResponse response = interviewService.startInterview(authentication.getName(), request);
            return ResponseEntity.status(201).body(response);
        } catch (IllegalArgumentException ex) {
            return ResponseEntity.badRequest().body(Map.of("message", ex.getMessage()));
        } catch (ResponseStatusException ex) {
            if (ex.getStatusCode() == HttpStatus.FORBIDDEN && FREE_TIER_LIMIT_REACHED.equals(ex.getReason())) {
                return ResponseEntity.status(HttpStatus.FORBIDDEN).body(Map.of(
                        "error", FREE_TIER_LIMIT_REACHED,
                        "message", FREE_TIER_LIMIT_MESSAGE
                ));
            }
            return ResponseEntity.status(ex.getStatusCode()).body(Map.of("message", ex.getReason()));
        }
    }

    @GetMapping("/sessions")
    public ResponseEntity<?> getSessionHistory(Authentication authentication) {
        try {
            return ResponseEntity.ok(interviewService.getSessionHistory(authentication.getName()));
        } catch (IllegalArgumentException ex) {
            return ResponseEntity.badRequest().body(Map.of("message", ex.getMessage()));
        } catch (ResponseStatusException ex) {
            return ResponseEntity.status(ex.getStatusCode()).body(Map.of("message", ex.getReason()));
        }
    }

    @GetMapping("/sessions/{sessionId}")
    public ResponseEntity<?> getSessionDetail(@PathVariable Long sessionId, Authentication authentication) {
        try {
            return ResponseEntity.ok(interviewService.getSessionDetail(authentication.getName(), sessionId));
        } catch (IllegalArgumentException ex) {
            return ResponseEntity.badRequest().body(Map.of("message", ex.getMessage()));
        } catch (ResponseStatusException ex) {
            return ResponseEntity.status(ex.getStatusCode()).body(Map.of("message", ex.getReason()));
        }
    }

    @PostMapping("/{sessionId}/submit")
    public ResponseEntity<?> submitAnswers(@PathVariable Long sessionId,
                                           @Valid @RequestBody SubmitAnswersRequest request,
                                           Authentication authentication) {
        try {
            SubmitAnswersResponse response = interviewService.submitAnswers(authentication.getName(), sessionId, request);
            return ResponseEntity.status(201).body(response);
        } catch (IllegalArgumentException ex) {
            return ResponseEntity.badRequest().body(Map.of("message", ex.getMessage()));
        } catch (ResponseStatusException ex) {
            return ResponseEntity.status(ex.getStatusCode()).body(Map.of("message", ex.getReason()));
        }
    }
}
