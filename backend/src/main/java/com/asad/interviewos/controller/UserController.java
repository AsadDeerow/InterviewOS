package com.asad.interviewos.controller;

import com.asad.interviewos.dto.UpdateRoleRequest;
import com.asad.interviewos.dto.UserProfileResponse;
import com.asad.interviewos.entity.User;
import com.asad.interviewos.repository.UserRepository;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/user")
public class UserController {

    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/profile")
    public ResponseEntity<?> getProfile(Authentication authentication) {
        User user = userRepository.findByEmail(authentication.getName()).orElse(null);
        if (user == null) {
            return ResponseEntity.status(401).body(Map.of("message", "User not found"));
        }
        return ResponseEntity.ok(toProfileResponse(user));
    }

    @PutMapping("/role")
    public ResponseEntity<?> updateRole(@Valid @RequestBody UpdateRoleRequest request,
                                         Authentication authentication) {
        User user = userRepository.findByEmail(authentication.getName()).orElse(null);
        if (user == null) {
            return ResponseEntity.status(401).body(Map.of("message", "User not found"));
        }
        user.setRole(request.getRole().name());
        userRepository.save(user);
        return ResponseEntity.ok(toProfileResponse(user));
    }

    private UserProfileResponse toProfileResponse(User user) {
        return new UserProfileResponse(
                user.getEmail(),
                user.getRole(),
                user.getSubscriptionStatus(),
                user.getSubscriptionPlan(),
                user.getSubscriptionInterval()
        );
    }
}
