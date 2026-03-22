package com.asad.interviewos.interviews.repository;

import com.asad.interviewos.interviews.domain.QuestionBank;
import com.asad.interviewos.interviews.domain.QuestionTopic;
import com.asad.interviewos.interviews.domain.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface QuestionBankRepository extends JpaRepository<QuestionBank, Long> {

    List<QuestionBank> findByRole(Role role);

    List<QuestionBank> findByRoleAndTopic(Role role, QuestionTopic topic);

}