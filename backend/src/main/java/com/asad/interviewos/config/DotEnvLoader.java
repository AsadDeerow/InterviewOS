package com.asad.interviewos.config;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

public final class DotEnvLoader {

    private static final List<Path> CANDIDATE_PATHS = List.of(
            Path.of(".env"),
            Path.of("backend", ".env")
    );

    private DotEnvLoader() {
    }

    public static void load() {
        for (Path candidate : CANDIDATE_PATHS) {
            if (!Files.isRegularFile(candidate)) {
                continue;
            }

            loadFile(candidate);
            return;
        }
    }

    private static void loadFile(Path path) {
        try {
            for (String rawLine : Files.readAllLines(path, StandardCharsets.UTF_8)) {
                String line = rawLine.trim();
                if (line.isEmpty() || line.startsWith("#")) {
                    continue;
                }

                if (line.startsWith("export ")) {
                    line = line.substring("export ".length()).trim();
                }

                int separatorIndex = line.indexOf('=');
                if (separatorIndex <= 0) {
                    continue;
                }

                String key = line.substring(0, separatorIndex).trim();
                String value = stripMatchingQuotes(line.substring(separatorIndex + 1).trim());
                if (key.isEmpty()) {
                    continue;
                }

                // Real environment variables should win over local .env defaults.
                if (System.getenv(key) == null && System.getProperty(key) == null) {
                    System.setProperty(key, value);
                }
            }
        } catch (IOException ex) {
            throw new IllegalStateException("Failed to load .env file from " + path.toAbsolutePath(), ex);
        }
    }

    private static String stripMatchingQuotes(String value) {
        if (value.length() < 2) {
            return value;
        }

        char first = value.charAt(0);
        char last = value.charAt(value.length() - 1);
        if ((first == '"' && last == '"') || (first == '\'' && last == '\'')) {
            return value.substring(1, value.length() - 1);
        }

        return value;
    }
}
