package com.example.demo.payment;

import com.siot.IamportRestClient.IamportClient;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentController {
    private IamportClient api;

    @RequestMapping(value = "/payment/payTest")
    public String payTest(){


        return "payment/PaymentTest";
    }
    @RequestMapping(value = "/payment")
    public String pay(){


        return "payment/Payment";
    }
    @RequestMapping(value ="payment/complete")
    public String paymentComplete(){
        return "내 예약";
    }


}
