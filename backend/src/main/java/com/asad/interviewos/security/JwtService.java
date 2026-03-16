package com.asad.interviewos.security;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Date;

@Component
public class JwtService {

    private static final Logger log = LoggerFactory.getLogger(JwtService.class);

    private final SecretKey secretKey;
    private final long expirationMillis;

    public JwtService(@Value("${jwt.secret}") String secret,
                      @Value("${app.auth.token.expiration-seconds:3600}") long expirationSeconds) {
        log.info("JWT secret present: {}", secret != null);
        log.info("JWT secret length: {}", secret != null ? secret.length() : 0);
        this.secretKey =
                Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));
        this.expirationMillis = expirationSeconds * 1000;
    }

    public String generateToken(String email) {
        return Jwts.builder()
                .setSubject(email)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + expirationMillis))
                .signWith(secretKey, SignatureAlgorithm.HS256)
                .compact();
    }

    public boolean isTokenValid(String token) {
        try {
            String username = extractUsername(token);
            Date expiration = parseClaims(token).getExpiration();
            boolean expired = expiration.before(new Date());
            log.info("JWT expired: {}", expired);
            return !expired && username != null;
        } catch (JwtException | IllegalArgumentException e) {
            log.error("isTokenValid failed", e);
            return false;
        }
    }

    public String extractUsername(String token) {
        try {
            String subject = parseClaims(token).getSubject();
            log.info("Extracted JWT subject: {}", subject);
            return subject;
        } catch (JwtException | IllegalArgumentException e) {
            log.error("extractUsername failed", e);
            throw e;
        }
    }

    public String extractEmail(String token) {
        return extractUsername(token);
    }

    private Claims parseClaims(String token) {
        return Jwts.parserBuilder()
                .setSigningKey(secretKey)
                .build()
                .parseClaimsJws(token)
                .getBody();
    }
}
