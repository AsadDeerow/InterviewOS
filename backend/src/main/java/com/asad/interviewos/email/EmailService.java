package com.asad.interviewos.email;

import com.asad.interviewos.entity.User;
import com.asad.interviewos.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.function.Supplier;

@Service
public class EmailService {

    private static final Logger log = LoggerFactory.getLogger(EmailService.class);

    private final EmailProvider emailProvider;
    private final EmailTemplateService emailTemplateService;
    private final EmailDeliveryRepository emailDeliveryRepository;
    private final UserRepository userRepository;
    private final boolean emailEnabled;

    public EmailService(EmailProvider emailProvider,
                        EmailTemplateService emailTemplateService,
                        EmailDeliveryRepository emailDeliveryRepository,
                        UserRepository userRepository,
                        @Value("${email.enabled:true}") boolean emailEnabled) {
        this.emailProvider = emailProvider;
        this.emailTemplateService = emailTemplateService;
        this.emailDeliveryRepository = emailDeliveryRepository;
        this.userRepository = userRepository;
        this.emailEnabled = emailEnabled;
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void sendWelcomeEmail(Long userId) {
        if (!emailEnabled) {
            log.debug("Skipping welcome email because email delivery is disabled");
            return;
        }

        Optional<User> user = userRepository.findById(userId);
        if (user.isEmpty()) {
            log.warn("Skipping welcome email because user {} no longer exists", userId);
            return;
        }

        sendEmail(user.get(), EmailType.WELCOME, null, () -> emailTemplateService.buildWelcomeEmail(user.get()));
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void sendPaymentConfirmationEmail(Long userId, String externalEventId, String plan, String interval) {
        if (!emailEnabled) {
            log.debug("Skipping payment confirmation email because email delivery is disabled");
            return;
        }

        Optional<User> user = userRepository.findById(userId);
        if (user.isEmpty()) {
            log.warn("Skipping payment confirmation email because user {} no longer exists", userId);
            return;
        }

        sendEmail(
                user.get(),
                EmailType.PAYMENT_CONFIRMATION,
                externalEventId,
                () -> emailTemplateService.buildPaymentConfirmationEmail(user.get(), plan, interval)
        );
    }

    private void sendEmail(User user, EmailType emailType, String externalEventId, Supplier<EmailMessage> emailMessageSupplier) {
        EmailDelivery delivery = reserveDelivery(user.getId(), emailType, externalEventId);
        if (delivery == null) {
            return;
        }

        try {
            EmailMessage message = emailMessageSupplier.get();
            String providerMessageId = emailProvider.send(message);
            delivery.markSent(providerMessageId);
            log.info("Email {} sent to {} with provider id {}", emailType, message.to(), providerMessageId);
        } catch (Exception ex) {
            delivery.markFailed(ex.getMessage());
            log.error("Failed to send {} email to {}", emailType, user.getEmail(), ex);
        }

        emailDeliveryRepository.save(delivery);
    }

    private EmailDelivery reserveDelivery(Long userId, EmailType emailType, String externalEventId) {
        String normalizedEventId = normalizeEventId(externalEventId);
        if (normalizedEventId != null) {
            Optional<EmailDelivery> existingDelivery = emailDeliveryRepository.findByEmailTypeAndExternalEventId(emailType, normalizedEventId);
            if (existingDelivery.isPresent()) {
                return prepareExistingDelivery(existingDelivery.get());
            }
        }

        EmailDelivery newDelivery = new EmailDelivery(userId, emailType, normalizedEventId);
        try {
            return emailDeliveryRepository.saveAndFlush(newDelivery);
        } catch (DataIntegrityViolationException ex) {
            if (normalizedEventId == null) {
                throw ex;
            }

            Optional<EmailDelivery> concurrentDelivery = emailDeliveryRepository.findByEmailTypeAndExternalEventId(emailType, normalizedEventId);
            if (concurrentDelivery.isEmpty()) {
                throw ex;
            }
            return prepareExistingDelivery(concurrentDelivery.get());
        }
    }

    private EmailDelivery prepareExistingDelivery(EmailDelivery delivery) {
        if (delivery.isSent() || delivery.isPending()) {
            log.info("Skipping duplicate {} email for external event {}", delivery.getEmailType(), delivery.getExternalEventId());
            return null;
        }

        delivery.markPending();
        return emailDeliveryRepository.saveAndFlush(delivery);
    }

    private String normalizeEventId(String value) {
        if (value == null) {
            return null;
        }
        String trimmed = value.trim();
        return trimmed.isEmpty() ? null : trimmed;
    }
}
