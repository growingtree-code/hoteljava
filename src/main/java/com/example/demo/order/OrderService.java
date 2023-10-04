package com.example.demo.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {

    @Autowired
    private OrderMapper mapper;

    public void addOrder(Order order){
        mapper.insertOrder(order);
    }

    public Order searchByOrderId(int order_id){
        return mapper.selectByOrderId(order_id);
    }

    public Order searchByUserId(int user_id){
        return mapper.selectByUserId(user_id);
    }

    public ArrayList<Order> searchAllByUserId(int user_id) {
        return mapper.selectAllByUserId(user_id);
    }

    public void deleteOrder(int order_id) {
        mapper.deleteOrder(order_id);
    }

}
