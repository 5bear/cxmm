package com.springapp.dao;

import com.springapp.entity.HsOrder;
import com.springapp.entity.WxOrderinfo;
import com.springapp.entity.WxUser;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/15.
 */
@Repository
public class OrderDao extends BaseDao {
    public List<WxOrderinfo>getList(){
        return this.findAll("from WxOrderinfo where result='success' order by dateTime desc", WxOrderinfo.class);
    }
    public List<WxOrderinfo>getList(String name,String express){
        String hql="from WxOrderinfo where result='success'";
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
            return this.findAll("from WxOrderinfo where result='success' order by dateTime desc", WxOrderinfo.class);
        if(condition1!=null&&condition2!=null)
            hql+=" and "+condition1+"and"+condition2;
        else if(condition1!=null&&condition2==null)
            hql+=" and"+condition1;
        else
            hql+=" and"+condition2;
        hql+="order by dateTime desc";
        return this.findAll(hql, WxOrderinfo.class);
    }
    public List<HsOrder>getHsList(String name,String express){
        String hql="from HsOrder ";
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
            return this.findAll("from HsOrder order by dateTime desc", HsOrder.class);
        if(condition1!=null&&condition2!=null)
            hql+=" where "+condition1+"and"+condition2;
        else if(condition1!=null&&condition2==null)
            hql+=" where"+condition1;
        else
            hql+=" where"+condition2;
        hql+="order by dateTime desc";
        return this.findAll(hql, HsOrder.class);
    }
    public List<WxOrderinfo>getByPage(int start,int end,String name,String express){
        String hql="from WxOrderinfo where result='success'";
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
            return this.findByPage("from WxOrderinfo where result='success' order by dateTime desc", WxOrderinfo.class, start, end);
        if(condition1!=null&&condition2!=null)
            hql+=" and "+condition1+"and"+condition2;
        else if(condition1!=null&&condition2==null)
            hql+=" and"+condition1;
        else
            hql+=" and"+condition2;
        hql+="order by dateTime desc";
        return this.findByPage(hql,WxOrderinfo.class,start,end);
    }
    public List<HsOrder>getHsByPage(int start,int end,String name,String express){
        String hql="from HsOrder ";
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
            return this.findByPage("from HsOrder order by dateTime desc", HsOrder.class, start, end);
        if(condition1!=null&&condition2!=null)
            hql+=" where "+condition1+"and"+condition2;
        else if(condition1!=null&&condition2==null)
            hql+=" where"+condition1;
        else
            hql+=" where"+condition2;
        hql+="order by dateTime desc";
        return this.findByPage(hql,HsOrder.class,start,end);
    }
    public List<WxOrderinfo> getByOpenid(String openid) {
        return this.findAll("from WxOrderinfo where uid.openid=? and result='success' order by dateTime desc", WxOrderinfo.class, new Object[]{openid});
    }

    public List<WxOrderinfo> getByWxUser(String openid) {
        return this.findAll("from WxOrderinfo where uid.openid=? and result='fail' order by dateTime desc", WxOrderinfo.class, new Object[]{openid});
    }

    public List<WxOrderinfo> getByAgentid(Long agentid) {
        return this.findAll("from WxOrderinfo where result='success' and uid.aid=? order by dateTime desc", WxOrderinfo.class, agentid);
    }
}

