package com.example.demo.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {
    @Autowired
    private PaymentMapper mapper;

    void addPayment(Payment payment) {
        mapper.insertPayment(payment);
    }

    Payment searchByPaymentId(int payment_id) {
     return mapper.selectByPaymentId(payment_id);
    }

    void deletePayment(int payment_id) {
        mapper.deletePayment(payment_id);
    }
}
