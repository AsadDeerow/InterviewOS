package com.asad.interviewos.security;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseCookie;
import org.springframework.stereotype.Component;

@Component
public class AuthCookieService {

    private final String cookieName;
    private final boolean secure;
    private final String sameSite;
    private final long maxAgeSeconds;

    public AuthCookieService(@Value("${app.auth.cookie.name:access_token}") String cookieName,
                             @Value("${app.auth.cookie.secure:false}") boolean secure,
                             @Value("${app.auth.cookie.same-site:Lax}") String sameSite,
                             @Value("${app.auth.cookie.max-age-seconds:3600}") long maxAgeSeconds) {
        this.cookieName = cookieName;
        this.secure = secure;
        this.sameSite = sameSite;
        this.maxAgeSeconds = maxAgeSeconds;
    }

    public ResponseCookie createAuthCookie(String token, boolean rememberMe) {
        ResponseCookie.ResponseCookieBuilder builder = ResponseCookie.from(cookieName, token)
                .httpOnly(true)
                .secure(secure)
                .sameSite(sameSite)
                .path("/");

        if (rememberMe) {
            builder.maxAge(maxAgeSeconds);
        }

        return builder.build();
    }

    public ResponseCookie clearAuthCookie() {
        return ResponseCookie.from(cookieName, "")
                .httpOnly(true)
                .secure(secure)
                .sameSite(sameSite)
                .path("/")
                .maxAge(0)
                .build();
    }

    public String getCookieName() {
        return cookieName;
    }
}
