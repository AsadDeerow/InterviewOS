package com.asad.interviewos.security;

import org.springframework.stereotype.Service;

import java.time.Duration;

@Service
public class AuthRateLimitService {

    private static final Duration LOGIN_WINDOW = Duration.ofMinutes(1);
    private static final Duration REGISTER_WINDOW = Duration.ofMinutes(10);

    private final RateLimitStore rateLimitStore;

    public AuthRateLimitService(RateLimitStore rateLimitStore) {
        this.rateLimitStore = rateLimitStore;
    }

    public boolean allowLogin(String key) {
        return rateLimitStore.allow("login", key, 5, LOGIN_WINDOW);
    }

    public boolean allowRegister(String key) {
        return rateLimitStore.allow("register", key, 3, REGISTER_WINDOW);
    }

    public void clearAll() {
        rateLimitStore.clearAll();
    }
}
