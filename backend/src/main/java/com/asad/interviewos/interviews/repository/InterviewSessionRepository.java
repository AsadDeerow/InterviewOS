package com.asad.interviewos.interviews.repository;

import com.asad.interviewos.interviews.domain.InterviewSession;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InterviewSessionRepository extends JpaRepository<InterviewSession, Long> {

}