package com.example.demo.payment;

import lombok.*;

import java.util.Date;

@ToString
@Data
public class Payment {
    private String payment_method;
    private int payment_total_price;
    private int payment_flag;
    private Date payment_time;
    private String payment_uid;
}
