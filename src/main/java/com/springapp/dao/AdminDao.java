package com.springapp.dao;

import com.springapp.entity.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/13.
 */
@Repository
public class AdminDao extends BaseDao {
    public List<Admin> getList(){
        return this.findAll("from Admin",Admin.class);
    }
}
