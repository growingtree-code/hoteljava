package com.example.demo.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentsService {

    @Autowired
    private CommentsMapper mapper;

    public void addComment(Comments c){mapper.insert(c);}

    public List getComments(int room_id2){return mapper.selectByRoom(room_id2);}

    public List getCmtUser(int room_id2){return mapper.joinUserName(room_id2);}

    public List getCommentAll() {
        return mapper.selectAll();
    }
}
