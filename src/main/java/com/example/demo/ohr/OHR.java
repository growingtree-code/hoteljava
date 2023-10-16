package com.example.demo.ohr;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Data
public class OHR {
    private  int order_id;
    private int payment_id;
    private int hotel_id;
    private int user_id;
    private int room_id2;
    private Date order_start_date;
    private Date order_end_date;
    private int order_period;
    private int order_price;
    private int order_state;
    private String hotel_name;
    private String hotel_addres;
    private String hotel_phone;
    private String hotel_img;
    private String hotel_category;
    private int room_id;
    private int room_type;
    private String room_info;
    private int price;
    private String room_img;
    private String room_name;


}
