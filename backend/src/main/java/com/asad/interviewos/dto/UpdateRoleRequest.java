package com.asad.interviewos.dto;

import com.asad.interviewos.interviews.domain.Role;
import jakarta.validation.constraints.NotNull;

public class UpdateRoleRequest {

    @NotNull(message = "Role is required")
    private Role role;

    public Role getRole() { return role; }

    public void setRole(Role role) { this.role = role; }
}
