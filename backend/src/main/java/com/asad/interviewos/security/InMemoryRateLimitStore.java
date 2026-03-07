package com.asad.interviewos.security;

import io.github.bucket4j.Bandwidth;
import io.github.bucket4j.Bucket;
import io.github.bucket4j.Refill;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Component
public class InMemoryRateLimitStore implements RateLimitStore {

    private final Map<String, Bucket> buckets = new ConcurrentHashMap<>();

    @Override
    public boolean allow(String namespace, String key, int capacity, Duration window) {
        String bucketKey = namespace + ":" + key;
        Bucket bucket = buckets.computeIfAbsent(bucketKey, ignored -> newBucket(capacity, window));
        return bucket.tryConsume(1);
    }

    @Override
    public void clearAll() {
        buckets.clear();
    }

    private Bucket newBucket(int capacity, Duration window) {
        return Bucket.builder()
                .addLimit(Bandwidth.classic(capacity, Refill.greedy(capacity, window)))
                .build();
    }
}
