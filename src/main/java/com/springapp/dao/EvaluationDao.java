package com.springapp.dao;

import com.springapp.entity.Evaluation;
import com.springapp.entity.WxEvaluation;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@Repository
public class EvaluationDao extends BaseDao {
    /*无代理用户*/
    public List<WxEvaluation>cxList(String name,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="select new Map(e.id as id,e.uid as uid,e.name as name,e.time as time,e.phone as phone,e.address as address,e.evaluation_status as evaluation_status) from WxEvaluation as e,WxUser as w where e.uid.id=w.id and w.aid=0";
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
            hql+=" and evaluation_status="+Integer.parseInt(status);
        return this.findAll(hql,WxEvaluation.class);
    }
    public List<WxEvaluation>getCxByPage(int start,int end,String name,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="select new Map(e.id as id,e.uid as uid,e.name as name,e.time as time,e.phone as phone,e.address as address,e.evaluation_status as evaluation_status) from WxEvaluation as e,WxUser as w where e.uid.id=w.id and w.aid=0";
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
            hql+=" and e.evaluation_status="+Integer.parseInt(status);
        return this.findByPage(hql, WxEvaluation.class, start, end);
    }
    /*代理用户*/
    public List<WxEvaluation>dlList(String name,String agent,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="select new Map(e.id as id,e.uid as uid,e.name as name,e.time as time,e.phone as phone,e.address as address,e.evaluation_status as evaluation_status) from WxEvaluation as e,WxUser as w where e.uid.id=w.id and w.aid>0";
        if(name!=null&&!name.equals(""))
            hql+=" and name like "+"'%"+name+"%'";
        if(agent!=null&&!agent.equals(""))
            hql+=" and uid.agent like "+"'%"+agent+"%'";
        if(fromDatetime!=null&&!fromDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(fromDatetime).getTime();
            hql+=" and timestamp>="+timestamp;
        }
        if(toDatetime!=null&&!toDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(toDatetime).getTime();
            hql+=" and timestamp<="+timestamp;
        }
        if(status!=null&&!status.equals(""))
            hql+=" and evaluation_status.id="+Integer.parseInt(status);
        return this.findAll(hql,WxEvaluation.class);    }
    public List<WxEvaluation>getDlByPage(int start,int end,String name,String agent,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="select new Map(e.id as id,e.uid as uid,e.name as name,e.time as time,e.phone as phone,e.address as address,e.evaluation_status as evaluation_status) from WxEvaluation as e,WxUser as w where e.uid.id=w.id and w.aid>0";
        if(name!=null&&!name.equals(""))
            hql+=" and name like "+"'%"+name+"%'";
        if(agent!=null&&!agent.equals(""))
            hql+=" and uid.agent like "+"'%"+agent+"%'";
        if(fromDatetime!=null&&!fromDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(fromDatetime).getTime();
            hql+=" and timestamp>="+timestamp;
        }
        if(toDatetime!=null&&!toDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(toDatetime).getTime();
            hql+=" and timestamp<="+timestamp;
        }
        if(status!=null&&!status.equals(""))
            hql+=" and evaluation_status.id="+Integer.parseInt(status);
        return this.findByPage(hql, WxEvaluation.class, start, end);        }
    public List<WxEvaluation>getListByAgent(Long agent){
        return this.findAll("select new Map(e.id as id,e.uid as uid,e.name as name,e.time as time,e.phone as phone,e.address as address,e.evaluation_status as evaluation_status) from WxEvaluation as e,WxUser as w where e.uid.id=w.id and w.aid=?",WxEvaluation.class,new Object[]{agent});
    }
    /*会所用户*/
    public List<Evaluation>hsList(String name,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="from Evaluation";
        if(name!=null&&!name.equals(""))
            hql+=" and name like "+"'%"+name+"%'";
        if(fromDatetime!=null&&!fromDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(fromDatetime).getTime();
            Timestamp timestamp1=new Timestamp(timestamp);
            hql+=" and time>="+timestamp1;
        }
        if(toDatetime!=null&&!toDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(toDatetime).getTime();
            Timestamp timestamp1=new Timestamp(timestamp);
            hql+=" and time<="+timestamp1;
        }
        if(status!=null&&!status.equals(""))
            hql+=" and evaluation_status.id="+Integer.parseInt(status);
        return this.findAll(hql,Evaluation.class);
    }
    public List<Evaluation>getHsByPage(int start,int end,String name,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="from Evaluation";
        if(name!=null&&!name.equals(""))
            hql+=" and name like "+"'%"+name+"%'";
        if(fromDatetime!=null&&!fromDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(fromDatetime).getTime();
            Timestamp timestamp1=new Timestamp(timestamp);
            hql+=" and time>="+timestamp1;
        }
        if(toDatetime!=null&&!toDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(toDatetime).getTime();
            Timestamp timestamp1=new Timestamp(timestamp);
            hql+=" and time<="+timestamp1;
        }
        if(status!=null&&!status.equals(""))
            hql+= " and evaluation_status.id=" + Integer.parseInt(status);
        return this.findByPage(hql, Evaluation.class,start,end);
    }
    public List<Evaluation>getListByClub(Long club){
        return this.findAll("from Evaluation where club.id=?",Evaluation.class,new Object[]{club});
    }
}
