package com.asad.interviewos.interviews.dto;

import com.asad.interviewos.interviews.domain.QuestionTopic;
import com.asad.interviewos.interviews.domain.Role;

public class StartInterviewRequest {

    private Role role;

    private QuestionTopic topic;

    public Role getRole() { return role; }

    public void setRole(Role role) { this.role = role; }

    public QuestionTopic getTopic() { return topic; }

    public void setTopic(QuestionTopic topic) { this.topic = topic; }
}
