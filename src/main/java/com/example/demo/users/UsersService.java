package com.example.demo.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersService {
	
	@Autowired
	private UsersMapper mapper;
	
	public void addUsers(Users u) {
		mapper.insert(u);
	}

	public Users getUsers(String email) {return mapper.select(email);}

	public List<Users> getListPaging(Page p){ return mapper.getListPaging(p);}

	public int getTotal() {return mapper.getTotal();}

	public void editUsers(Users u) {
		mapper.update(u);
	}

	public void delUsers(String id) {
		mapper.delete(id);
	}

	public int searchUserIdByEmail(String id) {
		return mapper.selectUserIdByEmail(id);
	}
}
