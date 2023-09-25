package com.example.demo.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping(value ="/browse")
    public String browse(){
        return "browse";
    }

    @GetMapping(value ="/details")
    public String details(){
        return "details";
    }
    @GetMapping(value ="/streams")
    public String streams(){
        return "streams";
    }
    @GetMapping(value ="/index")
    public String index(){
        return "index";
    }
    @GetMapping(value ="/profile")
    public String profile(){
        return "profile";
    }
}
