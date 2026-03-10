package com.asad.interviewos.interviews.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;

import java.util.List;

public class SubmitAnswersRequest {

    @Valid
    @NotEmpty
    private List<SessionAnswerRequest> answers;

    public List<SessionAnswerRequest> getAnswers() { return answers; }
    public void setAnswers(List<SessionAnswerRequest> answers) { this.answers = answers; }
}
