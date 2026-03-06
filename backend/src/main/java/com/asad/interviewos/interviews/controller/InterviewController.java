package com.asad.interviewos.interviews.controller;

import com.asad.interviewos.interviews.dto.StartInterviewRequest;
import com.asad.interviewos.interviews.dto.StartInterviewResponse;
import com.asad.interviewos.interviews.service.InterviewService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/interviews")
public class InterviewController {

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
        }
    }
}
