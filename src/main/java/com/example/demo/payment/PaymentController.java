package com.example.demo.payment;

import com.siot.IamportRestClient.IamportClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class PaymentController {

    @Autowired
    private PaymentService service;
    private IamportClient api;

    @RequestMapping(value = "/payment/payTest")
    public String payTest(){


        return "payment/PaymentTest";
    }
    @RequestMapping(value = "/payment")
    public String pay(){


        return "payment/Payment";
    }


    @PostMapping(value ="/payment/complete")
    public void paymentComplete(HttpServletRequest request , @RequestBody Payment payment){
        HttpSession session = request.getSession();
        session.setAttribute("payment",payment);
        Payment payment1 = (Payment)session.getAttribute("payment");
        System.out.println(payment1);
        service.addPayment(payment);

    }
}
