package com.interview.app;

import org.springframework.web.bind.annotation.*;

@RestController
public class MyDemoController {

    // Root endpoint
    @GetMapping("/")
    public String home() {
        return "Welcome to Interview App 🚀";
    }

    // API base
    @GetMapping("/api")
    public String apiRoot() {
        return "API Root working";
    }

    // Specific API
    @GetMapping("/api/test")
    public String test() {
        return "my test data controller amir rahi production branch";
    }

    // Another example
    @GetMapping("/hello")
    public String hello() {
        return "Hello endpoint working";
    }
}