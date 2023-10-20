package com.example.demo.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.example.demo.hotel.Hotel;
import com.example.demo.hotel.HotelService;
import com.example.demo.payment.Payment;
import com.example.demo.payment.PaymentService;
import com.example.demo.room.Room;
import com.example.demo.room.RoomService;
import com.example.demo.users.Users;
import com.example.demo.users.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class OrderController {
    @Autowired
    private PaymentService paymentService;
    @Autowired
    private RoomService roomService;
    @Autowired
    private UsersService usersService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private HotelService hotelservice;



    @PostMapping(value = "/Reservation")
    public String reservation(HttpServletRequest request, @RequestParam("room_id2") int room_id2){
        HttpSession session = request.getSession();

        Room room = roomService.getRoomByNum(room_id2);
        System.out.println(room);
        String email = (String) session.getAttribute("email");
        Hotel hotel = hotelservice.getHotelByNum(room.getHotel_id());
        Users user = usersService.getUsers(email);

        request.setAttribute("R_room",room);
        request.setAttribute("R_user",user);
        request.setAttribute("R_hotel",hotel);

        return "order/DoReserveForm";
    }
    @RequestMapping(value = "/CartToMakeReservation")
    public String goToMakeReservation(HttpServletRequest request,
                                      @RequestParam int order_id,
                                      @RequestParam int hotel_id,
                                      @RequestParam int room_id2
                                      ){
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        Order order = orderService.selectOrderByOrderId(order_id);
        Users user = usersService.getUsers(email);

        Hotel hotel = hotelservice.getHotelByNum(hotel_id);
        Room room = roomService.getRoomByNum(room_id2);
        request.setAttribute("c_order",order);
        request.setAttribute("c_user", user);
        request.setAttribute("c_hotel",hotel);
        request.setAttribute("c_room",room);

        return "/order/CartToReservation";
    }



    @RequestMapping(value = "/saveToMyCart")
    public String myCart(HttpServletRequest request,
                         Order order) throws ParseException {

        //결제 필요
        order.setOrder_state(0);
        System.out.println(order);
        orderService.addOrder(order);
        // 내 예약페이지로 가기
        return "redirect:/MyCart";
    }



    @PostMapping(value = "/ReservationUpdate")
    public String ReservationUpdate(HttpServletRequest request,
                                 Order order) throws ParseException {

        HttpSession session = request.getSession();
        Payment payment = (Payment) session.getAttribute("payment");
        int paymentId = paymentService.searchPaymentIdByPaymentUid(payment.getPayment_uid());
        order.setPayment_id(paymentId);

        //결제 완료 1
        order.setOrder_state(1);
        orderService.updateByOrderId(order);

        return "redirect:/myOrder";
    }
    @RequestMapping(value = "/DoSave")
    public String saveReservation(HttpServletRequest request, Order order) throws ParseException {
        HttpSession session = request.getSession();
        Payment payment = (Payment) session.getAttribute("payment");
        int paymentId = paymentService.searchPaymentIdByPaymentUid(payment.getPayment_uid());
        order.setPayment_id(paymentId);

        //결제 완료
        order.setOrder_state(1);
        System.out.println(order);

        orderService.addOrder(order);
        return "redirect:/myOrder";
    }

    @RequestMapping(value = "/deleteFromCart")
    public String deleteFromCart(@RequestParam int order_id){
        orderService.deleteFromCart(order_id);
        return "redirect:/MyCart";
    }

}
