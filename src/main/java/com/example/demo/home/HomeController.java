package com.example.demo.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping(value ="/browse")
    public String browse(){
        return "browse";
    }
    /* 내 예약 내역 */
    @GetMapping(value ="/myReservation")
    public String myReservation(){
        return "order/MyReservation";
    }
    /* 내 장바구니 */
    @GetMapping(value ="/myCart")
    public String myCart(){
        return "order/MyCart";
    }
    /* 결제 페이지 */
    @GetMapping(value ="/payment")
    public String payment(){
        return "payment/Payment";
    }
    @GetMapping(value ="/paymentTest")
    public String paymentTest(){
        return "payment/PaymentTest";
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
