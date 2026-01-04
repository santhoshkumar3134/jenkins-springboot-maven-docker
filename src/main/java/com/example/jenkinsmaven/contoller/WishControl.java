package com.example.jenkinsmaven.contoller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WishControl {

    @RequestMapping(value = "/", method = RequestMethod.GET)

    public String wishMessage() {
        return "Hello, Welcome to Jenkins with SpringBoot Integration!";
    }
}
