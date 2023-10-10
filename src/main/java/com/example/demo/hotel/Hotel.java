package com.example.demo.hotel;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Hotel {
	
	private int hotel_id;
	private String hotel_name;
	private String hotel_addres;
	private String hotel_phone;
	private String hotel_img;
	private String hotel_category;
	private int user_id;
	private MultipartFile hotel_imgfile;
	
	public Hotel(int hotel_id, String hotel_name, String hotel_addres, String hotel_phone, String hotel_img, String hotel_category, int user_id) {
		super();
		this.hotel_id = hotel_id;
		this.hotel_name = hotel_name;
		this.hotel_addres = hotel_addres;
		this.hotel_phone = hotel_phone;
		this.hotel_category = hotel_category;
		this.user_id = user_id;
	}

	
}
