package com.springapp.dao;

import com.springapp.entity.Question2;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Question2Dao extends BaseDao {
    public List<Question2> getList(String whereClause) {
        return this.findAll("from Question2 WHERE " + whereClause, Question2.class);
    }

}
