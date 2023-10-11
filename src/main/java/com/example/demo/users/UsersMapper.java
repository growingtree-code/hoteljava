package com.example.demo.users;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UsersMapper {

	void insert(Users u);

	Users select(String id);

	List userlist();

	void update(Users u);

	void delete(String id);

	//이재혁
	int selectUserIdByEmail(String id);
}
