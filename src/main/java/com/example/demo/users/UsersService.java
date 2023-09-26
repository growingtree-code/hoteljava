package com.example.demo.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsersService {
	
	@Autowired
	private UsersMapper mapper;
	
	public void addUsers(Users u) {
		mapper.insert(u);
	}

	public Users getUsers(String id) {
		return mapper.select(id);
	}

	public void editUsers(Users u) {
		mapper.update(u);
	}

	public void delUsers(String id) {
		mapper.delete(id);
	}
}
