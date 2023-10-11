package com.example.demo.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomService {
	
	@Autowired
	private RoomMapper mapper;
	
	public void addRoom(Room r) {
		mapper.insert(r);
	}
	
	public Room getRoomByNum(int num) {
		return mapper.selectByNum(num);
	}
	
	public List getRoomByHotelNum(int num) {
		return mapper.selectByHotelNum(num);
	}
	
	public List getRoomAll() {
		return mapper.selectAll();
	}
	
	public void editRoom(Room r) {
		mapper.update(r);
	}
	
	public void delRoom(int num) {
		mapper.delete(num);
	}
	
	public int getNum() {
		return mapper.getNum();
	}
	
}
