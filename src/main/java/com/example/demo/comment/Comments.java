package com.example.demo.comment;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class Comments {
	private int comment_id;
	private int user_id;
	private int room_id2;
	private String content;
	private Date comment_date;

	public Comments() {
	}

	public Comments(int comment_id, int user_id, int room_id, String content, Date comment_date) {
		this.comment_id = comment_id;
		this.user_id = user_id;
		this.room_id2 = room_id;
		this.content = content;
		this.comment_date = comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
}
