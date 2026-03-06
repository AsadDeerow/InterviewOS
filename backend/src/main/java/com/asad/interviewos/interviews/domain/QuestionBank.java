package com.asad.interviewos.interviews.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "question_bank")
public class QuestionBank {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    private Role role;

    @Enumerated(EnumType.STRING)
    private QuestionTopic topic;

    private String difficulty;

    @Column(length = 1000, nullable = false)
    private String questionText;

    public Long getId() { return id; }

    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; }

    public QuestionTopic getTopic() { return topic; }
    public void setTopic(QuestionTopic topic) { this.topic = topic; }

    public String getDifficulty() { return difficulty; }
    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }

    public String getQuestionText() { return questionText; }
    public void setQuestionText(String questionText) { this.questionText = questionText; }
}
