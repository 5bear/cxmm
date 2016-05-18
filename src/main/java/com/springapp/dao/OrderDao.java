package com.springapp.dao;

import com.springapp.entity.WxOrderinfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/15.
 */
@Repository
public class OrderDao extends BaseDao{
    public List<WxOrderinfo> getByOpenid(String openid){
        return this.findAll("from WxOrderinfo where uid.openid=?",WxOrderinfo.class,new Object[]{openid});
    }
}
