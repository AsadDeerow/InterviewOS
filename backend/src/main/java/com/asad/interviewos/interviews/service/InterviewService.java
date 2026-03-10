package com.asad.interviewos.interviews.service;

import com.asad.interviewos.entity.User;
import com.asad.interviewos.interviews.domain.InterviewSession;
import com.asad.interviewos.interviews.domain.QuestionBank;
import com.asad.interviewos.interviews.domain.Role;
import com.asad.interviewos.interviews.domain.SessionQuestion;
import com.asad.interviewos.interviews.dto.QuestionDTO;
import com.asad.interviewos.interviews.dto.StartInterviewRequest;
import com.asad.interviewos.interviews.dto.StartInterviewResponse;
import com.asad.interviewos.interviews.repository.InterviewSessionRepository;
import com.asad.interviewos.interviews.repository.QuestionBankRepository;
import com.asad.interviewos.interviews.repository.SessionQuestionRepository;
import com.asad.interviewos.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class InterviewService {

    private final UserRepository userRepository;
    private final InterviewSessionRepository interviewSessionRepository;
    private final QuestionBankRepository questionBankRepository;
    private final SessionQuestionRepository sessionQuestionRepository;

    public InterviewService(UserRepository userRepository,
                            InterviewSessionRepository interviewSessionRepository,
                            QuestionBankRepository questionBankRepository,
                            SessionQuestionRepository sessionQuestionRepository) {
        this.userRepository = userRepository;
        this.interviewSessionRepository = interviewSessionRepository;
        this.questionBankRepository = questionBankRepository;
        this.sessionQuestionRepository = sessionQuestionRepository;
    }

    @Transactional
    public StartInterviewResponse startInterview(String userEmail, StartInterviewRequest request) {
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new IllegalArgumentException("Authenticated user not found"));

        Role role = request.getRole();
        List<QuestionBank> availableQuestions = new ArrayList<>(questionBankRepository.findByRole(role));

        if (availableQuestions.size() < 3) {
            throw new IllegalArgumentException("Not enough questions available for role " + role);
        }

        Collections.shuffle(availableQuestions);
        List<QuestionBank> selectedQuestions = availableQuestions.subList(0, 3);

        InterviewSession session = new InterviewSession();
        session.setUserId(user.getId());
        session.setRole(role);
        InterviewSession savedSession = interviewSessionRepository.save(session);

        for (int index = 0; index < selectedQuestions.size(); index++) {
            QuestionBank question = selectedQuestions.get(index);

            SessionQuestion sessionQuestion = new SessionQuestion();
            sessionQuestion.setSessionId(savedSession.getId());
            sessionQuestion.setQuestionId(question.getId());
            sessionQuestion.setOrderIndex(index + 1);
            sessionQuestionRepository.save(sessionQuestion);
        }

        List<QuestionDTO> questionDtos = selectedQuestions.stream()
                .map(question -> new QuestionDTO(question.getId(), question.getQuestionText()))
                .toList();

        return new StartInterviewResponse(savedSession.getId(), role, questionDtos);
    }
}
