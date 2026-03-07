package com.asad.interviewos.security;

import java.time.Duration;

public interface RateLimitStore {

    boolean allow(String namespace, String key, int capacity, Duration window);

    default void clearAll() {
    }
}
