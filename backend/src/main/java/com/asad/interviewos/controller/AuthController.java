package com.asad.interviewos.controller;

import com.asad.interviewos.dto.LoginRequest;
import com.asad.interviewos.dto.RegisterRequest;
import com.asad.interviewos.entity.User;
import com.asad.interviewos.repository.UserRepository;
import com.asad.interviewos.security.JwtService;

import jakarta.validation.Valid;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    public AuthController(UserRepository userRepository,
                          PasswordEncoder passwordEncoder,
                          JwtService jwtService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtService = jwtService;
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@Valid @RequestBody RegisterRequest request) {

        if (userRepository.findByEmail(request.getEmail()).isPresent()) {
            return ResponseEntity
                    .status(409)
                    .body(Map.of("message", "Email already exists"));
        }

        String hashedPassword = passwordEncoder.encode(request.getPassword());

        User user = new User(request.getEmail(), hashedPassword);

        try {
            userRepository.save(user);
        } catch (DataIntegrityViolationException ex) {
            return ResponseEntity
                    .status(409)
                    .body(Map.of("message", "Email already exists"));
        }

        return ResponseEntity
                .status(201)
                .body(Map.of("message", "User registered successfully"));
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@Valid @RequestBody LoginRequest request) {

        User user = userRepository.findByEmail(request.getEmail())
                .orElse(null);

        if (user == null) {
            return ResponseEntity
                    .status(401)
                    .body(Map.of("message", "Invalid email or password"));
        }

        if (!passwordEncoder.matches(request.getPassword(), user.getPasswordHash())) {
            return ResponseEntity
                    .status(401)
                    .body(Map.of("message", "Invalid email or password"));
        }

        String token = jwtService.generateToken(user.getEmail());

        return ResponseEntity.ok(
                Map.of("token", token)
        );
    }

}
