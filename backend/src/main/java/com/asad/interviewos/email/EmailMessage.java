package com.asad.interviewos.email;

public record EmailMessage(String to, String subject, String html, String text) {

    public EmailMessage {
        to = requireText(to, "Email recipient");
        subject = requireText(subject, "Email subject");
        html = normalizeBody(html);
        text = normalizeBody(text);

        if (html.isBlank() && text.isBlank()) {
            throw new IllegalArgumentException("Email content is required");
        }
    }

    private static String requireText(String value, String label) {
        if (value == null || value.isBlank()) {
            throw new IllegalArgumentException(label + " is required");
        }
        return value.trim();
    }

    private static String normalizeBody(String value) {
        return value == null ? "" : value.trim();
    }
}
