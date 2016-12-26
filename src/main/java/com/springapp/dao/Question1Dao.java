package com.springapp.dao;

import com.springapp.entity.Question1;
import com.springapp.entity.clubQuestion;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Question1Dao extends BaseDao {
    public List<clubQuestion> getList() {
        return this.findAll("from clubQuestion", clubQuestion.class);
    }

}
