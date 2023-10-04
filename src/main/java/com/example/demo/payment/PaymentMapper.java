package com.example.demo.payment;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {
    void insertPayment(Payment payment);

    Payment selectByPaymentId(int payment_id);

    void deletePayment(int payment_id);

}
