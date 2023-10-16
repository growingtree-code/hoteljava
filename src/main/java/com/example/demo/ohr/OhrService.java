package com.example.demo.ohr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class OhrService {
    @Autowired
    private OhrMapper mapper;
    public ArrayList<OHR> searchAllOHRByUserId(int user_id){
        return  mapper.selectAllOHRByUserId(user_id);
    }

    public ArrayList<OHR>searchCartAllOHRByUserId(int user_id){
        return mapper.selectCartAllOHRByUserId(user_id);
    }
}
