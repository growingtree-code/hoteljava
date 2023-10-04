package com.example.demo.room;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoomMapper {
	
	void insert(Room r);
	
	Room selectByNum(int num);
	List selectByHotelNum(int num);
	List selectAll();
	
	void update(Room r);
	void delete(int num);
	
	int getNum();
}
