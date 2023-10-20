package com.example.demo.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

@Controller
public class CommentsController {
    @Autowired
    private  CommentsService service;

    @RequestMapping(value = "/comments/add")
    public String addCmt(Comments c) throws ParseException {
        Date date = (Date) c.getComment_date();
//        Date comment_date = new SimpleDateFormat("yyyy-MM-dd").parse(String.valueOf(date));
        c.setComment_date(date);
        service.addComment(c);

        return "redirect:/myOrder";
    }
}
