package com.asad.interviewos.interviews.dto;

public class QuestionDTO {

    private Long questionId;
    private String text;
    private String difficulty;

    public QuestionDTO(Long questionId, String text, String difficulty) {
        this.questionId = questionId;
        this.text = text;
        this.difficulty = difficulty;
    }

    public Long getQuestionId() { return questionId; }

    public String getText() { return text; }

    public String getDifficulty() { return difficulty; }
}