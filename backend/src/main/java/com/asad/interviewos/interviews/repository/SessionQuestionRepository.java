package com.asad.interviewos.interviews.repository;

import com.asad.interviewos.interviews.domain.SessionQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface SessionQuestionRepository extends JpaRepository<SessionQuestion, Long> {

    List<SessionQuestion> findBySessionIdOrderByOrderIndexAsc(Long sessionId);

}