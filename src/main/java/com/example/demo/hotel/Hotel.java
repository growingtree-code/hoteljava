package com.example.demo.hotel;

import org.springframework.web.multipart.MultipartFile;

public class Hotel {
	
	private int hotel_id;
	private String hotel_name;
	private String hotel_addres;
	private String hotel_phone;
	private String hotel_img;
	private String hotel_category;
	private MultipartFile hotel_imgfile;

	public Hotel() {
		super();
	}
	
	public Hotel(int hotel_id, String hotel_name, String hotel_addres, String hotel_phone, String hotel_img, String hotel_category) {
		super();
		this.hotel_id = hotel_id;
		this.hotel_name = hotel_name;
		this.hotel_addres = hotel_addres;
		this.hotel_phone = hotel_phone;
		this.hotel_category = hotel_category;
	}

	public Hotel(int hotel_id, String hotel_name, String hotel_addres, String hotel_phone, String hotel_img,
			String hotel_category, MultipartFile hotel_imgfile) {
		super();
		this.hotel_id = hotel_id;
		this.hotel_name = hotel_name;
		this.hotel_addres = hotel_addres;
		this.hotel_phone = hotel_phone;
		this.hotel_img = hotel_img;
		this.hotel_category = hotel_category;
		this.hotel_imgfile = hotel_imgfile;
	}

	public int getHotel_id() {
		return hotel_id;
	}

	public void setHotel_id(int hotel_id) {
		this.hotel_id = hotel_id;
	}

	public String getHotel_name() {
		return hotel_name;
	}

	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}

	public String getHotel_addres() {
		return hotel_addres;
	}

	public void setHotel_addres(String hotel_addres) {
		this.hotel_addres = hotel_addres;
	}

	public String getHotel_phone() {
		return hotel_phone;
	}

	public void setHotel_phone(String hotel_phone) {
		this.hotel_phone = hotel_phone;
	}

	public String getHotel_img() {
		return hotel_img;
	}

	public void setHotel_img(String hotel_img) {
		this.hotel_img = hotel_img;
	}

	public MultipartFile getHotel_imgfile() {
		return hotel_imgfile;
	}

	public void setHotel_imgfile(MultipartFile hotel_imgfile) {
		this.hotel_imgfile = hotel_imgfile;
	}
	
	public String getHotel_category() {
		return hotel_category;
	}

	public void setHotel_category(String hotel_category) {
		this.hotel_category = hotel_category;
	}

	@Override
	public String toString() {
		return "Hotel [hotel_id=" + hotel_id + ", hotel_name=" + hotel_name + ", hotel_addres=" + hotel_addres
				+ ", hotel_phone=" + hotel_phone + ", hotel_img=" + hotel_img + ", hotel_category=" + hotel_category
				+ ", hotel_imgfile=" + hotel_imgfile + "]";
	}
	
	
	
	
}
