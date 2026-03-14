package com.asad.interviewos.interviews.repository;

import com.asad.interviewos.interviews.domain.InterviewSession;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface InterviewSessionRepository extends JpaRepository<InterviewSession, Long> {

    List<InterviewSession> findByUserIdOrderByCreatedAtDesc(Long userId);

    long countByUserIdAndCreatedAtGreaterThanEqual(Long userId, LocalDateTime startOfMonth);

    Optional<InterviewSession> findByIdAndUserId(Long id, Long userId);
}
