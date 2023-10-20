package com.example.demo.comment;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentsMapper {

    void insert(Comments c);

}
