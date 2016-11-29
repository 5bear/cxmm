package com.springapp.dao;

import com.springapp.entity.Activity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/11.
 */
@Repository
public class ActivityDao extends BaseDao {
    //企业动态
    public List<Activity>getList(){
        return this.findAll("from Activity where type=0 order by id desc",Activity.class);
    }
    //禅心分享
    public List<Activity>getShareList(){
        return this.findAll("from Activity where type=1 order by id desc",Activity.class);
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
            return this.findAll("from Activity where type=0 order by id desc", Activity.class);
        if(condition1!=null&&condition2!=null)
            hql+=" where type=0 "+condition1+"and"+condition2;
        else if(condition1!=null&&condition2==null)
            hql+=" where type=0 "+condition1;
        else
            hql+=" where type=0 "+condition2;
        hql+=" order by id desc";
        return this.findAll(hql,Activity.class);
    }
    public List<Activity>getShareList(String title,String status){
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
            return this.findAll("from Activity where type=1 order by id desc", Activity.class);
        if(condition1!=null&&condition2!=null)
            hql+=" where type=1 "+condition1+"and"+condition2;
        else if(condition1!=null&&condition2==null)
            hql+=" where type=1 "+condition1;
        else
            hql+=" where type=1 "+condition2;
        hql+=" order by id desc";
        return this.findAll(hql,Activity.class);
    }
    public List<Activity>getList(String status){
        return this.findAll("from Activity where type=0 and newsStatusE='可用' order by id desc",Activity.class);
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
            return this.findByPage("from Activity where type=0 order by id desc", Activity.class, start, end);
        if(condition1!=null&&condition2!=null)
            hql+=" where type=0 "+condition1+"and"+condition2;
        else if(condition1!=null&&condition2==null)
            hql+=" where type=0 "+condition1;
        else
            hql+=" where type=0 "+condition2;
        hql+=" order by id desc";
        return this.findByPage(hql,Activity.class,start,end);
    }
    public List<Activity>getShareByPage(int start,int end,String title,String status){
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
            return this.findByPage("from Activity where type=1 order by id desc", Activity.class, start, end);
        if(condition1!=null&&condition2!=null)
            hql+=" where type=1 "+condition1+"and"+condition2;
        else if(condition1!=null&&condition2==null)
            hql+=" where type=1 "+condition1;
        else
            hql+=" where type=1 "+condition2;
        hql+=" order by id desc";
        return this.findByPage(hql,Activity.class,start,end);
    }
}
