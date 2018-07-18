package com.imooc.hello.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class HelloController {

    @GetMapping("/")
    public String index (){
        return "hello";
    }

    @GetMapping("/hello")
    @ResponseBody
    public String hello (){
        return "hello, Jack Chan!";
    }

}
