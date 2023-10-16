package com.example.demo.order;

import lombok.*;

import java.util.Date;
@ToString
@Data
public class Order {
	private int order_id;
	private int payment_id;
	private int hotel_id;
	private int user_id;
	private int room_id2;
	private Date order_start_date;
	private Date order_end_date;
	private int order_period;
	private int order_price;
	private int order_state;

}
