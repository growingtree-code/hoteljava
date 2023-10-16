package com.example.demo.ohr;

import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface OhrMapper {
    ArrayList<OHR> selectAllOHRByUserId(int user_Id);

    ArrayList<OHR> selectCartAllOHRByUserId(int user_id);
}
