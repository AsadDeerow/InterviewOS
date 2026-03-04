package com.asad.interviewos;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.asad.interviewos")
public class InterviewosApplication {

    public static void main(String[] args) {
		System.out.println("APPLICATION CLASS LOADED");
        SpringApplication.run(InterviewosApplication.class, args);
    }
}