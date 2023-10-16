package com.example.demo.order;

import java.util.ArrayList;

import com.example.demo.ohr.OHR;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {

    void insertOrder(Order order);

    Order selectByOrderId(int order_id);
    Order selectByUserId(int user_id);
    ArrayList<Order> selectAllByUserId(int user_id);

    void deleteOrder(int order_id);

    void updateByOrderId(Order order);

    void deleteFromCart(int order_id);


}
