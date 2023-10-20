package com.example.demo.order;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
@ToString
@Data
public class Order {
	private int order_id;
	private int payment_id;
	private int hotel_id;
	private int user_id;
	private int room_id2;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date order_start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date order_end_date;
	private int order_period;
	private int order_price;
	private int order_state;

}
