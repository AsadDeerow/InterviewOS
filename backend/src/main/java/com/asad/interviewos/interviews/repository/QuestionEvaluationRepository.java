package com.asad.interviewos.interviews.repository;

import com.asad.interviewos.interviews.domain.QuestionEvaluation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuestionEvaluationRepository extends JpaRepository<QuestionEvaluation, Long> {

    List<QuestionEvaluation> findBySessionIdOrderByQuestionIdAsc(Long sessionId);
}
