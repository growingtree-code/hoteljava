package com.example.demo.ohr;


import com.example.demo.users.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class OhrController {
    @Autowired
    private UsersService usersService;

    @Autowired
    private  OhrService ohrService;
    @RequestMapping("/myOrder")
    public String myOrderList(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("email");
        int userId = usersService.searchUserIdByEmail(email);
        ArrayList<OHR> ohrs = ohrService.searchAllOHRByUserId(userId);
        session.setAttribute("ohr",ohrs);
        return "/order/MyOrderList";
    }
    @RequestMapping("/MyCart")
    public String myCartList(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("email");
        int userId = usersService.searchUserIdByEmail(email);
        ArrayList<OHR> ohrs = ohrService.searchCartAllOHRByUserId(userId);
        session.setAttribute("ohr",ohrs);
        return "/order/MyCart";
    }
}
