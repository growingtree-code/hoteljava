package com.example.demo.comment;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentsMapper {

    void insert(Comments c);

    List selectByRoom(int room_id2);

    List selectAll();

    List joinUserName(int room_id2);


}
