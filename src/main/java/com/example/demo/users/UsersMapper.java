package com.example.demo.users;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UsersMapper {

	void insert(Users u);

	Users select(String email);

	Users selectUserById(int user_id);

	public List<Users> getListPaging(Page p);

	public int getTotal();

	void update(Users u);

	void delete(String id);

	//이재혁
	int selectUserIdByEmail(String id);
}
