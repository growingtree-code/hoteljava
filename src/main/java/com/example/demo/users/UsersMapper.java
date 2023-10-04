package com.example.demo.users;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UsersMapper {

	void insert(Users u);

	Users select(String id);

	void update(Users u);

	void delete(String id);

	//이재혁
	int selectUserIdByEmail(String id);
}
