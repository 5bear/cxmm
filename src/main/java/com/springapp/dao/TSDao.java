package com.springapp.dao;

import com.springapp.entity.TrainSchool;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 11369 on 2016/6/12.
 */
@Repository
public class TSDao extends BaseDao {
    public List<TrainSchool>getList(){
        return findAll("from TrainSchool",TrainSchool.class);
    }
}
