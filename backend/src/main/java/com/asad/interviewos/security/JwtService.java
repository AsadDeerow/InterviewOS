package com.asad.interviewos.security;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import com.asad.interviewos.entity.User;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Date;

@Component
public class JwtService {

    private static final String TOKEN_VERSION_CLAIM = "tokenVersion";
    private final SecretKey secretKey;
    private static final long EXPIRATION_TIME = 1000 * 60 * 60; // 1 hour

    public JwtService(@Value("${jwt.secret}") String secret) {
        this.secretKey =
                Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));
    }

    public String generateToken(String email, int tokenVersion) {
        return Jwts.builder()
                .setSubject(email)
                .claim(TOKEN_VERSION_CLAIM, tokenVersion)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .signWith(secretKey, SignatureAlgorithm.HS256)
                .compact();
    }

    public boolean isTokenValid(String token) {
        try {
            parseClaims(token);
            return true;
        } catch (JwtException | IllegalArgumentException e) {
            return false;
        }
    }

    public String extractEmail(String token) {
        return parseClaims(token).getSubject();
    }

    public boolean isTokenValid(String token, User user) {
        try {
            Claims claims = parseClaims(token);
            Integer tokenVersion = claims.get(TOKEN_VERSION_CLAIM, Integer.class);

            return claims.getSubject().equals(user.getEmail())
                    && tokenVersion != null
                    && tokenVersion == user.getTokenVersion()
                    && claims.getExpiration().after(new Date());
        } catch (JwtException | IllegalArgumentException e) {
            return false;
        }
    }

    public long getExpirationSeconds() {
        return EXPIRATION_TIME / 1000;
    }

    private Claims parseClaims(String token) {
        return Jwts.parserBuilder()
                .setSigningKey(secretKey)
                .build()
                .parseClaimsJws(token)
                .getBody();
    }
}
