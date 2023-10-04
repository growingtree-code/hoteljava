package com.example.demo.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.example.demo.users.Users;
import com.example.demo.users.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.seller.Product;
import com.example.demo.seller.SellerService;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private UsersService usersService;

//    @RequestMapping(value = "/order/reservation")
//    public String reservation(HttpServletRequest request){
//        HttpSession session = request.getSession();
//        String loginEmail = (String)session.getAttribute("email");
//
//        if (loginEmail == null){
//            return "users/loginForm";
//        }
//
//        Users loginUser = usersService.getUsers(loginEmail);
//
//        loginUser.getEmail()
//
//        return "";
//    }
    @RequestMapping(value = "/order/myCart")
    public String reservation(HttpServletRequest request, @ModelAttribute Order order){

        HttpSession session = request.getSession();
        String loginEmail = (String)session.getAttribute("email");
        int user_id = usersService.searchUserIdByEmail(loginEmail);

        if (loginEmail == null){
            return "users/loginForm";
        }
        order.setUser_id(user_id);
        orderService.addOrder(order);
        // 내 예약페이지로 가기
        return "/order/myCart";
    }

}
