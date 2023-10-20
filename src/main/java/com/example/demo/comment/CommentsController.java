package com.example.demo.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;

@Controller
public class CommentsController {
    @Autowired
    private  CommentsService service;

    @RequestMapping(value = "/comments/add")
    public String addCmt(Comments c){
        service.addComment(c);
        return "redirect:/myOrder";
    }

    @RequestMapping(value = "/comments/cmtForm")
    public String cmtForm(HttpServletRequest req,@RequestParam int user_id,@RequestParam int room_id){

        HttpSession session = req.getSession();
        session.setAttribute("ui",user_id);
        session.setAttribute("ri",room_id);

        System.out.println(user_id);
        System.out.println(room_id);
        return "comments/cmtForm";
    }
}
