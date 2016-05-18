package com.springapp.dao;

import com.springapp.entity.Question1;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Question1Dao extends BaseDao {
    public List<Question1> getList() {
        return this.findAll("from Question1", Question1.class);
    }

}
