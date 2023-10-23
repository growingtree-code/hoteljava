package com.example.demo.comment;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class JoinCmtUser {

    private String name;
    private int comment_id;
    private int user_id;
    private int room_id2;
    private String content;
    private Date comment_date;

    public JoinCmtUser() {
    }

    public JoinCmtUser(String name, int comment_id, int user_id, int room_id2, String content, Date comment_date) {
        this.name = name;
        this.comment_id = comment_id;
        this.user_id = user_id;
        this.room_id2 = room_id2;
        this.content = content;
        this.comment_date = comment_date;
    }
}
