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
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

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

    @ResponseBody
    @PostMapping(value = "/saveReservation")
    public String saveReservation(@RequestParam Object order_start_date,
                                  @RequestParam Object order_end_date,
                                  @RequestParam int order_period,
                                  @RequestParam int order_price,
                                  @RequestParam int room_id2,
                                  @RequestParam int user_id) throws ParseException {
        Date orderStartDate = new SimpleDateFormat("yyyy-MM-dd").parse(String.valueOf(order_start_date));
        Date orderEndDate = new SimpleDateFormat("yyyy-MM-dd").parse(String.valueOf(order_end_date));

        Order order = new Order();
        order.setOrder_period(order_period);
        order.setOrder_price(order_price);
        order.setOrder_end_date(orderStartDate);
        order.setOrder_start_date(orderEndDate);
        order.setRoom_id2(room_id2);
        order.setUser_id(user_id);
        //결제 완료
        order.setOrder_state(1);
        System.out.println(order);



        orderService.addOrder(order);
        return "/order/MyReservation";
    }

}
