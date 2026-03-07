package com.asad.interviewos.controller;

import com.asad.interviewos.dto.LoginRequest;
import com.asad.interviewos.dto.RegisterRequest;
import com.asad.interviewos.entity.User;
import com.asad.interviewos.repository.UserRepository;
import com.asad.interviewos.security.AuthCookieService;
import com.asad.interviewos.security.AuthRateLimitService;
import com.asad.interviewos.security.JwtService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthCookieService authCookieService;
    private final AuthRateLimitService authRateLimitService;

    public AuthController(UserRepository userRepository,
                          PasswordEncoder passwordEncoder,
                          JwtService jwtService,
                          AuthCookieService authCookieService,
                          AuthRateLimitService authRateLimitService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtService = jwtService;
        this.authCookieService = authCookieService;
        this.authRateLimitService = authRateLimitService;
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@Valid @RequestBody RegisterRequest request,
                                      HttpServletRequest servletRequest) {
        if (!authRateLimitService.allowRegister(resolveClientIp(servletRequest))) {
            return ResponseEntity
                    .status(429)
                    .body(Map.of("message", "Too many registration attempts. Try again later."));
        }

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
    public ResponseEntity<?> login(@Valid @RequestBody LoginRequest request,
                                   HttpServletRequest servletRequest,
                                   HttpServletResponse response) {
        if (!authRateLimitService.allowLogin(resolveClientIp(servletRequest))) {
            return ResponseEntity
                    .status(429)
                    .body(Map.of("message", "Too many login attempts. Try again later."));
        }

        User user = userRepository.findByEmail(request.getEmail()).orElse(null);

        if (user == null || !user.isEnabled()) {
            return ResponseEntity
                    .status(401)
                    .body(Map.of("message", "Invalid email or password"));
        }

        if (!passwordEncoder.matches(request.getPassword(), user.getPasswordHash())) {
            return ResponseEntity
                    .status(401)
                    .body(Map.of("message", "Invalid email or password"));
        }

        String token = jwtService.generateToken(user.getEmail(), user.getTokenVersion());
        response.addHeader(
                HttpHeaders.SET_COOKIE,
                authCookieService.createAuthCookie(token, request.isRememberMe()).toString()
        );

        return ResponseEntity.ok(Map.of("message", "Login successful"));
    }

    @GetMapping("/csrf")
    public ResponseEntity<?> csrf(CsrfToken csrfToken) {
        return ResponseEntity.ok(Map.of("token", csrfToken.getToken()));
    }

    @PostMapping("/logout")
    public ResponseEntity<?> logout(Authentication authentication,
                                    HttpServletResponse response) {
        if (authentication != null && authentication.getName() != null) {
            userRepository.findByEmail(authentication.getName()).ifPresent(user -> {
                user.setTokenVersion(user.getTokenVersion() + 1);
                userRepository.save(user);
            });
        }

        response.addHeader(HttpHeaders.SET_COOKIE, authCookieService.clearAuthCookie().toString());
        return ResponseEntity.ok(Map.of("message", "Logged out"));
    }

    private String resolveClientIp(HttpServletRequest request) {
        String forwardedFor = request.getHeader("X-Forwarded-For");
        if (forwardedFor != null && !forwardedFor.isBlank()) {
            return forwardedFor.split(",")[0].trim();
        }
        return request.getRemoteAddr();
    }
}
