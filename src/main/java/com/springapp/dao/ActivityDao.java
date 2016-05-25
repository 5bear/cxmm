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
    public List<Activity>getList(String title,String status){
        String hql="from Activity ";
        String condition1 = null,condition2=null;
        int count=0;
        if(title!=null&&!title.equals("")) {
            condition1 = " title like " + "'%"+title+"%'";
            count++;
        }
        if(status!=null&&!status.equals("")) {
            condition2 = " newsStatusE=" + "'"+status+"'";
            count++;
        }
        if(count==0)
            return this.findAll("from Activity", Activity.class);
        if(condition1!=null&&condition2!=null)
            hql+=" where "+condition1+"and"+condition2;
        else if(condition1!=null&&condition2==null)
            hql+=" where"+condition1;
        else
            hql+=" where"+condition2;
        return this.findAll(hql,Activity.class);
    }
    public List<Activity>getList(String status){
        return this.findAll("from Activity where newsStatusE='可用'",Activity.class);
    }
    public List<Activity>getByPage(int start,int end,String title,String status){
        String hql="from Activity ";
        String condition1 = null,condition2=null;
        int count=0;
        if(title!=null&&!title.equals("")) {
            condition1 = " title like " + "'%"+title+"%'";
            count++;
        }
        if(status!=null&&!status.equals("")) {
            condition2 = " newsStatusE=" + "'"+status+"'";
            count++;
        }
        if(count==0)
            return this.findByPage("from Activity", Activity.class, start, end);
        if(condition1!=null&&condition2!=null)
            hql+=" where "+condition1+"and"+condition2;
        else if(condition1!=null&&condition2==null)
            hql+=" where"+condition1;
        else
            hql+=" where"+condition2;
        return this.findByPage(hql,Activity.class,start,end);
    }
}
