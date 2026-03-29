package com.interview.app;

import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;

@RestController
public class MyDemoController {

    private final Environment environment;

    public MyDemoController(Environment environment) {
        this.environment = environment;
    }

    // Root endpoint
    @GetMapping("/")
    public String home() {

        String[] profiles = environment.getActiveProfiles();
        String env = profiles.length > 0 ? profiles[0] : "LOCAL";

        return "Welcome to Interview "+env+" App";
    }

    // API base
    @GetMapping("/api")
    public String apiRoot() {
        String[] profiles = environment.getActiveProfiles();
        String env = profiles.length > 0 ? profiles[0] : "LOCAL";
        return "API Root working: "+env;
    }

    // Specific API
    @GetMapping("/api/test")
    public String test() {

        String[] profiles = environment.getActiveProfiles();
        String env = profiles.length > 0 ? profiles[0] : "LOCAL";

        return "my test data controller amir rahi "+env+" branch";
    }

    // Another example
    @GetMapping("/hello")
    public String hello() {

        String[] profiles = environment.getActiveProfiles();
        String env = profiles.length > 0 ? profiles[0] : "LOCAL";

        return "Hello endpoint working: "+env;
    }
}