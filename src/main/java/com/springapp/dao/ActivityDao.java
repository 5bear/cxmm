package com.springapp.dao;

import com.springapp.entity.Activity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/11.
 */
@Repository
public class ActivityDao extends BaseDao {
    public List<Activity>getList(){
        return this.findAll("from Activity",Activity.class);
    }
    public List<Activity>getList(String status){
        return this.findAll("from Activity where newsStatusE='可用'",Activity.class);
    }
    public List<Activity>getByPage(int start,int end){
        return this.findByPage("from Activity",Activity.class,start,end);
    }
}
