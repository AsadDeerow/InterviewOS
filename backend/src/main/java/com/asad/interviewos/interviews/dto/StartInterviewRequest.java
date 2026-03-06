package com.asad.interviewos.interviews.dto;

import com.asad.interviewos.interviews.domain.Role;
import jakarta.validation.constraints.NotNull;

public class StartInterviewRequest {

    @NotNull
    private Role role;

    public Role getRole() { return role; }

    public void setRole(Role role) { this.role = role; }
}
