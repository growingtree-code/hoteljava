package com.example.demo.payment;

import lombok.*;

import java.util.Date;

@Data
public class Payment {
    private int payment_id;
    private int payment_method;
    private int payment_total_price;
    private int payment_flag;
    private Date payment_time;
    private String payment_uid;
}
