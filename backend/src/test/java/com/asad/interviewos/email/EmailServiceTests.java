package com.asad.interviewos.email;

import com.asad.interviewos.entity.User;
import com.asad.interviewos.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.util.ReflectionTestUtils;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.lenient;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class EmailServiceTests {

    @Mock
    private EmailProvider emailProvider;

    @Mock
    private EmailTemplateService emailTemplateService;

    @Mock
    private EmailDeliveryRepository emailDeliveryRepository;

    @Mock
    private UserRepository userRepository;

    private EmailService emailService;

    @BeforeEach
    void setUp() {
        emailService = new EmailService(
                emailProvider,
                emailTemplateService,
                emailDeliveryRepository,
                userRepository,
                true
        );

        lenient().when(emailDeliveryRepository.saveAndFlush(any(EmailDelivery.class)))
                .thenAnswer(invocation -> invocation.getArgument(0));
        lenient().when(emailDeliveryRepository.save(any(EmailDelivery.class)))
                .thenAnswer(invocation -> invocation.getArgument(0));
    }

    @Test
    void sendPaymentConfirmationEmailSkipsDuplicateStripeEventWhenDeliveryAlreadySent() {
        User user = new User("paid@example.com", "hashed-password");
        user.setSubscriptionPlan("PRO");
        user.setSubscriptionInterval("MONTHLY");
        ReflectionTestUtils.setField(user, "id", 42L);

        EmailDelivery existingDelivery = new EmailDelivery(42L, EmailType.PAYMENT_CONFIRMATION, "evt_duplicate");
        existingDelivery.markSent("email_existing_123");

        when(userRepository.findById(42L)).thenReturn(Optional.of(user));
        when(emailDeliveryRepository.findByEmailTypeAndExternalEventId(EmailType.PAYMENT_CONFIRMATION, "evt_duplicate"))
                .thenReturn(Optional.of(existingDelivery));

        emailService.sendPaymentConfirmationEmail(42L, "evt_duplicate", "PRO", "MONTHLY");

        verify(emailTemplateService, never()).buildPaymentConfirmationEmail(any(User.class), any(), any());
        verify(emailProvider, never()).send(any(EmailMessage.class));
    }

    @Test
    void sendPaymentConfirmationEmailRecordsProviderMessageId() {
        User user = new User("paid@example.com", "hashed-password");
        ReflectionTestUtils.setField(user, "id", 7L);
        EmailMessage emailMessage = new EmailMessage(
                "paid@example.com",
                "Your InterviewOS subscription is active",
                "<p>Active</p>",
                "Active"
        );

        when(userRepository.findById(7L)).thenReturn(Optional.of(user));
        when(emailDeliveryRepository.findByEmailTypeAndExternalEventId(EmailType.PAYMENT_CONFIRMATION, "evt_payment"))
                .thenReturn(Optional.empty());
        when(emailTemplateService.buildPaymentConfirmationEmail(user, "PRO", "YEARLY")).thenReturn(emailMessage);
        when(emailProvider.send(emailMessage)).thenReturn("email_msg_123");

        emailService.sendPaymentConfirmationEmail(7L, "evt_payment", "PRO", "YEARLY");

        verify(emailProvider).send(emailMessage);
        verify(emailDeliveryRepository).saveAndFlush(any(EmailDelivery.class));
        verify(emailDeliveryRepository).save(any(EmailDelivery.class));
    }
}
