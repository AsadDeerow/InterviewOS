package com.asad.interviewos;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.env.Environment;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@ActiveProfiles("test")
class InterviewosApplicationTests {

	@Autowired
	private Environment environment;

	@Test
	void contextLoads() {
	}

	@Test
	void emailConfigurationLoadsFromProperties() {
		assertThat(environment.getProperty("app.base-url")).isEqualTo("http://localhost:3000");
		assertThat(environment.getProperty("email.enabled")).isEqualTo("true");
		assertThat(environment.getProperty("email.provider")).isEqualTo("resend");
		assertThat(environment.getProperty("email.from")).isEqualTo("no-reply@test.interviewos.dev");
		assertThat(environment.getProperty("email.reply-to")).isEqualTo("support@test.interviewos.dev");
		assertThat(environment.getProperty("email.resend.api-key")).isEqualTo("re_test_dummy");
	}

}
