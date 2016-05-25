package com.springapp.dao;

import com.springapp.entity.WxOrderinfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/15.
 */
@Repository
public class OrderDao extends BaseDao {
    public List<WxOrderinfo>getList(){
        return this.findAll("from WxOrderinfo",WxOrderinfo.class);
    }

    public List<WxOrderinfo>getByPage(int start,int end,String name,String express){
        String hql="from WxOrderinfo ";
        String condition1 = null,condition2=null;
        int count=0;
        if(name!=null&&!name.equals("")) {
            condition1 = " name like " + "'%"+name+"%'";
            count++;
        }
        if(express!=null&&!express.equals("")) {
            condition2 = " express=" + "'"+express+"'";
            count++;
        }
        if(count==0)
            return this.findByPage("from WxOrderinfo", WxOrderinfo.class, start, end);
        if(condition1!=null&&condition2!=null)
            hql+=" where "+condition1+"and"+condition2;
        else if(condition1!=null&&condition2==null)
            hql+=" where"+condition1;
        else
            hql+=" where"+condition2;
        return this.findByPage(hql,WxOrderinfo.class,start,end);
    }
    public List<WxOrderinfo> getByOpenid(String openid) {
        return this.findAll("from WxOrderinfo where uid.openid=?", WxOrderinfo.class, new Object[]{openid});
    }

    public List<WxOrderinfo> getByAgentid(Long agentid) {
        return this.findAll("from WxOrderinfo where uid.aid=?", WxOrderinfo.class, agentid);
    }
}

