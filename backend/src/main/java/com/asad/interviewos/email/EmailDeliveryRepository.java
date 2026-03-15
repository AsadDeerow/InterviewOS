package com.asad.interviewos.email;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface EmailDeliveryRepository extends JpaRepository<EmailDelivery, Long> {
    Optional<EmailDelivery> findByEmailTypeAndExternalEventId(EmailType emailType, String externalEventId);
}
