package com.asad.interviewos;

import com.asad.interviewos.config.DotEnvLoader;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.asad.interviewos")
public class InterviewosApplication {

    public static void main(String[] args) {
        DotEnvLoader.load();
        SpringApplication.run(InterviewosApplication.class, args);
    }
}
