package com.example.demo.hotel;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HotelMapper {
	
	void insert(Hotel h);
	
	Hotel selectByNum(int num);
	List selectByName(String name);
	List selectBySeller(int user_id);
	List selectAll();
	
	void update(Hotel h);
	void delete(int num);
	
	int getNum();
	
	int getTotal(PageVO vo);
	List getHotelPaging(PageVO vo);
}
