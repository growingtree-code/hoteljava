package com.example.demo.room;

import org.springframework.web.multipart.MultipartFile;

public class Room {
	
	private int room_id;
	private int hotel_id;
	private int room_type;
	private String room_info;
	private int price;
	private String room_img;
	private String room_name;
	private MultipartFile room_imgfile;
	
	public Room() {
		super();
	}

	public Room(int room_id, int hotel_id, int room_type, String room_info, int price, String room_img,
			String room_name) {
		super();
		this.room_id = room_id;
		this.hotel_id = hotel_id;
		this.room_type = room_type;
		this.room_info = room_info;
		this.price = price;
		this.room_name = room_name;
	}

	public Room(int room_id, int hotel_id, int room_type, String room_info, int price, String room_img,
			String room_name, MultipartFile room_imgfile) {
		super();
		this.room_id = room_id;
		this.hotel_id = hotel_id;
		this.room_type = room_type;
		this.room_info = room_info;
		this.price = price;
		this.room_img = room_img;
		this.room_name = room_name;
		this.room_imgfile = room_imgfile;
	}

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public int getHotel_id() {
		return hotel_id;
	}

	public void setHotel_id(int hotel_id) {
		this.hotel_id = hotel_id;
	}

	public int getRoom_type() {
		return room_type;
	}

	public void setRoom_type(int room_type) {
		this.room_type = room_type;
	}

	public String getRoom_info() {
		return room_info;
	}

	public void setRoom_info(String room_info) {
		this.room_info = room_info;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getRoom_img() {
		return room_img;
	}

	public void setRoom_img(String room_img) {
		this.room_img = room_img;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public MultipartFile getRoom_imgfile() {
		return room_imgfile;
	}

	public void setRoom_imgfile(MultipartFile room_imgfile) {
		this.room_imgfile = room_imgfile;
	}

	@Override
	public String toString() {
		return "Room [room_id=" + room_id + ", hotel_id=" + hotel_id + ", room_type=" + room_type + ", room_info="
				+ room_info + ", price=" + price + ", room_img=" + room_img + ", room_name=" + room_name
				+ ", room_imgfile=" + room_imgfile + "]";
	}
	
	
	
}
