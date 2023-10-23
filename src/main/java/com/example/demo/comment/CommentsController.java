package com.example.demo.comment;

import com.example.demo.room.Room;
import com.example.demo.room.RoomService;
import com.example.demo.users.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class CommentsController {
    @Autowired
    private  CommentsService service;
    @Autowired
    private RoomService r_service;

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
        Room r = r_service.getRoomByNum(room_id);
        session.setAttribute("r",r);

        return "comments/cmtForm";
    }

    @RequestMapping(value = "/comments/cmtList")
    public ModelAndView cmtList(HttpServletRequest req,@RequestParam int room_id2) {

        ModelAndView mav = new ModelAndView("/comments/cmtList");
        HttpSession session = req.getSession(false);
        ArrayList<Comments> comments = (ArrayList<Comments>)service.getCmtUser(room_id2);

        System.out.println(comments);
        mav.addObject("comments",comments);

        return mav;
    }

}
