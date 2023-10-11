package com.example.demo.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.demo.hotel.Hotel;
import com.example.demo.hotel.HotelService;
import com.example.demo.room.Room;
import com.example.demo.room.RoomService;
import com.example.demo.users.Users;
import com.example.demo.users.UsersService;
import org.apache.naming.factory.SendMailFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private UsersService usersService;
    @Autowired
    private RoomService roomService;
    @Autowired
    private HotelService hotelservice;
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
//        loginUser.getEmail();
//
//        return "";
//    }
    @RequestMapping(value = "/reservation")
    public String reservation(HttpServletRequest request, @RequestParam("room_id2") int room_id2){
        Room room = roomService.getRoomByNum(room_id2);
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        Hotel hotel = hotelservice.getHotelByNum(room.getHotel_id());
        System.out.println(email);
        Users user = usersService.getUsers(email);

        request.setAttribute("R_room",room);
        request.setAttribute("R_user",user);
        request.setAttribute("R_hotel",hotel);
        return "/order/MakeReservation";
    }
    @RequestMapping(value = "/order/myCart")
    public String myCart(HttpServletRequest request, @ModelAttribute Order order){

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
