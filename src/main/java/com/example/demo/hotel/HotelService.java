package com.example.demo.hotel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HotelService {
	
	@Autowired
	private HotelMapper mapper;
	
	public void addHotel(Hotel h) {
		mapper.insert(h);
	}
	
	public Hotel getHotelByNum(int num) {
		return mapper.selectByNum(num);
	}
	
	public List getHotelByName(String name) {
		return mapper.selectByName(name);
	}
	
	public List getHotelByCategory(int cate) {
		return mapper.selectByCategory(cate);
	}
	
	public List getHotelByKeyword(String keyword) {
		return mapper.selectByKeyword(keyword);
	}
	
	public List getHotelBySeller(int user_id) {
		return mapper.selectBySeller(user_id);
	}
	
	public List getHotelAll() {
		return mapper.selectAll();
	}
	
	public void editHotel(Hotel h) {
		mapper.update(h);
	}
	
	public void delHotel(int num) {
		mapper.delete(num);
	}
	
	public int getNum() {
		return mapper.getNum();
	}
	
}
