package com.asad.interviewos.interviews.dto;

import com.asad.interviewos.interviews.domain.Role;
import java.util.List;

public class StartInterviewResponse {

    private Long sessionId;
    private Role role;
    private List<QuestionDTO> questions;

    public StartInterviewResponse(Long sessionId, Role role, List<QuestionDTO> questions) {
        this.sessionId = sessionId;
        this.role = role;
        this.questions = questions;
    }

    public Long getSessionId() { return sessionId; }

    public Role getRole() { return role; }

    public List<QuestionDTO> getQuestions() { return questions; }
}