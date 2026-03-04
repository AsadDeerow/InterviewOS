package com.asad.interviewos;

import org.springframework.context.annotation.Profile;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Profile("dev")
@RestController
public class TestController {

    @GetMapping("/ping")
    public String ping() {
        return "pong";
    }
}
