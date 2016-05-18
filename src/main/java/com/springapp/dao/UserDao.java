package com.springapp.dao;

import com.springapp.entity.WxOrderinfo;
import com.springapp.entity.WxUser;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/10.
 */
@Repository
public class UserDao extends BaseDao {
    public WxUser getByOpenid(String openid){
        return this.find("from WxUser where openid=?",WxUser.class,new Object[]{openid});
    }
    public List<WxOrderinfo>getOpenList(String openid){
        return this.findAll("from WxOrderinfo where uid.openid=?",WxOrderinfo.class,new Object[]{openid});
    }
}
