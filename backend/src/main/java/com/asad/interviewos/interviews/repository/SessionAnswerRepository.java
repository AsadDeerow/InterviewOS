package com.asad.interviewos.interviews.repository;

import com.asad.interviewos.interviews.domain.SessionAnswer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SessionAnswerRepository extends JpaRepository<SessionAnswer, Long> {

    boolean existsBySessionId(Long sessionId);

    List<SessionAnswer> findBySessionIdOrderByQuestionIdAsc(Long sessionId);
}
