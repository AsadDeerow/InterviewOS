package com.asad.interviewos.security;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import java.time.Duration;

@Component
@Primary
@ConditionalOnProperty(name = "app.rate-limit.redis.enabled", havingValue = "true")
public class RedisRateLimitStore implements RateLimitStore {

    private final StringRedisTemplate redisTemplate;

    public RedisRateLimitStore(StringRedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    @Override
    public boolean allow(String namespace, String key, int capacity, Duration window) {
        String redisKey = "rate_limit:" + namespace + ":" + key;
        Long currentCount = redisTemplate.opsForValue().increment(redisKey);

        if (currentCount == null) {
            return false;
        }

        if (currentCount == 1L) {
            redisTemplate.expire(redisKey, window);
        }

        return currentCount <= capacity;
    }
}
