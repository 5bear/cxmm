package com.springapp.dao;

import com.springapp.entity.Train;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/10.
 */
@Repository
public class TrainDao extends BaseDao {
    public List<Train>getList(){
        return this.findAll("from Train",Train.class);
    }
}
