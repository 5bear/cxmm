package com.springapp.dao;

import com.springapp.entity.Club;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/8.
 */
@Repository
public class ClubDao extends BaseDao {
    public List<Club>getList(){
        return this.findAll("from Club",Club.class);
    }
    public List<Club>getByPage(int start,int end){
        return this.findByPage("from Club",Club.class,start,end);
    }
    public List<Club>findByCondition(String club,String status){
        String hql="from Club ";
        String condition1 = null,condition2=null;
        int count=0;
        if(club!=null&&!club.equals("")) {
            condition1 = " club like " + "'%"+club+"%'";
            count++;
        }
        if(status!=null&&!status.equals("")) {
            condition2 = " status=" + "'"+status+"'";
            count++;
        }
        if(count==0)
            return this.findAll(hql,Club.class);
        if(condition1!=null&&condition2!=null)
            hql+=" where "+condition1+"and"+condition2;
        else if(condition1!=null&&condition2==null)
            hql+=" where"+condition1;
        else
            hql+=" where"+condition2;
        return this.findAll(hql,Club.class);
    }
}
