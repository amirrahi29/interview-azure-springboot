package com.interview.app;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class MyDemoController {

    @GetMapping("/test")
    public String data(){
        return "my test data controller amir rahiiiii after rollback";
    }
}
