package com.asad.interviewos.interviews.dto;

public class QuestionDTO {

    private Long questionId;
    private String text;

    public QuestionDTO(Long questionId, String text) {
        this.questionId = questionId;
        this.text = text;
    }

    public Long getQuestionId() { return questionId; }

    public String getText() { return text; }
}