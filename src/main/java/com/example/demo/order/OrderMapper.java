package com.example.demo.order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {

    void insertOrder(Order order);

    Order selectByOrderId(int order_id);
    Order selectByUserId(int user_id);
    ArrayList<Order> selectAllByUserId(int user_id);

    void deleteOrder(int order_id);

}
