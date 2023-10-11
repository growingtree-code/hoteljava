package com.example.demo.users;

public class Users {
	private int user_id;
	private String email;
	private String pwd;
	private String name;
	private int point;
	private int type;//판매자, 관리자 종류

	public Users() {
	}

	public Users(int user_id,String email, String pwd, String name, int point, int type) {
		this.user_id = user_id;
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.point = point;
		this.type = type;
	}

	public int getUser_id() {return user_id; }

	public void setUser_id(int user_id) {this.user_id = user_id;}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Users{" +
				"user_id=" + user_id +
				", email='" + email + '\'' +
				", pwd='" + pwd + '\'' +
				", name='" + name + '\'' +
				", point=" + point +
				", type=" + type +
				'}';
	}
}
