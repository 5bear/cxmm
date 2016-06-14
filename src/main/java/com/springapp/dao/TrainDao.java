package com.springapp.dao;

import com.springapp.entity.Train;
import org.springframework.stereotype.Repository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/10.
 */
@Repository
public class TrainDao extends BaseDao {
    public List<Train>getList(){
        return this.findAll("from Train");
    }
    public List<Train>getList(String name,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="from Train where id>0";
        if(name!=null&&!name.equals(""))
            hql+=" and name like "+"'%"+name+"%'";
        if(fromDatetime!=null&&!fromDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(fromDatetime).getTime();
            hql+=" and timestamp>="+timestamp;
        }
        if(toDatetime!=null&&!toDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(toDatetime).getTime();
            hql+=" and timestamp<="+timestamp;
        }
        if(status!=null&&!status.equals(""))
            hql+=" and status="+"'"+status+"'";
        return this.findAll(hql,Train.class);
    }
    public List<Train>getListByPage(int start,int end,String name,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="from Train where id>0";
        if(name!=null&&!name.equals(""))
            hql+=" and name like "+"'%"+name+"%'";
        if(fromDatetime!=null&&!fromDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(fromDatetime).getTime();
            hql+=" and timestamp>="+timestamp;
        }
        if(toDatetime!=null&&!toDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(toDatetime).getTime();
            hql+=" and timestamp<="+timestamp;
        }
        if(status!=null&&!status.equals(""))
            hql+=" and status="+"'"+status+"'";
        return this.findByPage(hql, Train.class, start, end);
    }
    public Train getTrain(String name){
        return find("from Train where name=?",Train.class,new Object[]{name});
    }
}
