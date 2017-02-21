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
    public Evaluation getHsEvaluate(String uid){
        return find("from Evaluation where guid=?",Evaluation.class,new Object[]{uid});
    }
    /*无代理用户*/
    public List<WxEvaluation>cxList(String name,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
/*
        String hql="select new Map(e.id as id,e.uid as uid,e.name as name,e.time as time,e.phone as phone,e.address as address,e.evaluation_status as evaluation_status) from WxEvaluation as e,WxUser as w where e.uid.id=w.id and w.aid=0";
*/
        String hql="select e  from WxEvaluation  e,WxUser w where e.uid.id=w.id and w.aid=0";
        if(name!=null&&!name.equals(""))
            hql+=" and w.nickname like "+"'%"+name+"%'";
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
        hql+=" order by timestamp desc";
        return this.findAll(hql,WxEvaluation.class);
    }
    public List<WxEvaluation>getCxByPage(int start,int end,String name,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="select e  from WxEvaluation  e,WxUser w where e.uid.id=w.id and w.aid=0";
        if(name!=null&&!name.equals(""))
            hql+=" and w.nickname like "+"'%"+name+"%'";
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
        hql+=" order by timestamp desc";
        return this.findByPage(hql, WxEvaluation.class, start, end);
    }
    /*代理用户*/
    public List<WxEvaluation>dlList(String name,String agent,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="select e  from WxEvaluation  e,WxUser w where e.uid.id=w.id and w.aid>0";
        if(name!=null&&!name.equals(""))
            hql+=" and w.nickname like "+"'%"+name+"%'";
        if(agent!=null&&!agent.equals(""))
            hql+=" and e.uid.agent = '" +agent + "'";
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
        hql+=" order by timestamp desc";
        return this.findAll(hql,WxEvaluation.class);    }
    public List<WxEvaluation>dlList(Long aid,String name,String agent,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="select e  from WxEvaluation  e,WxUser w where e.uid.id=w.id and w.aid>0";
        if(name!=null&&!name.equals(""))
            hql+=" and w.nickname like "+"'%"+name+"%'";
        if(agent!=null&&!agent.equals(""))
            hql+=" and e.uid.agent = "+"'"+agent+"'";
        if(fromDatetime!=null&&!fromDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(fromDatetime).getTime();
            hql+=" and e.timestamp>="+timestamp;
        }
        if(toDatetime!=null&&!toDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(toDatetime).getTime();
            hql+=" and timestamp<="+timestamp;
        }
        if(status!=null&&!status.equals(""))
            hql+=" and evaluation_status="+Integer.parseInt(status);
        hql+=" order by timestamp desc";
        return this.findAll(hql,WxEvaluation.class);    }
    public List<WxEvaluation>getDlByPage(int start,int end,String name,String agent,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="select e  from WxEvaluation  e,WxUser w where e.uid.id=w.id and w.aid>0";
        if(name!=null&&!name.equals(""))
            hql+=" and w.nickname like "+"'%"+name+"%'";
        if(agent!=null&&!agent.equals(""))
            hql+=" and e.uid.agent = "+"'"+agent+"'";
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
        hql+=" order by timestamp desc";
        return this.findByPage(hql, WxEvaluation.class, start, end);        }
    public List<WxEvaluation>getDlByPage(Long aid,int start,int end,String name,String agent,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="select e  from WxEvaluation  e,WxUser w where e.uid.id=w.id and w.aid>0";
        if(name!=null&&!name.equals(""))
            hql+=" and w.nickname like "+"'%"+name+"%'";
        if(agent!=null&&!agent.equals(""))
            hql+=" and e.uid.agent = "+"'"+agent+"'";
        if(fromDatetime!=null&&!fromDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(fromDatetime).getTime();
            hql+=" and e.timestamp>="+timestamp;
        }
        if(toDatetime!=null&&!toDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(toDatetime).getTime();
            hql+=" and e.timestamp<="+timestamp;
        }
        if(status!=null&&!status.equals(""))
            hql+=" and e.evaluation_status="+Integer.parseInt(status);
        hql+=" order by timestamp desc";
        return this.findByPage(hql, WxEvaluation.class, start, end);        }
    public List<WxEvaluation>getListByAgent(Long agent){
        return this.findAll("select new Map(e.id as id,e.uid as uid,e.name as name,e.time as time,e.phone as phone,e.address as address,e.evaluation_status as evaluation_status) from WxEvaluation as e,WxUser as w where e.uid.id=w.id and w.aid=?",WxEvaluation.class,new Object[]{agent});
    }
    /*会所用户*/
    public List<Evaluation>hsList(String name,String fromDatetime,String toDatetime,String status,String clubName) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="from Evaluation";
        String condition1="",condition2="",condition3="",condition4="",condition5="",condition="";
        int count=0;
        if(name!=null&&!name.equals("")) {
            condition1 += " name like " + "'%" + name + "%'";
            count++;
        }
        if(fromDatetime!=null&&!fromDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(fromDatetime).getTime();
            condition2+=" timestamp>="+timestamp;
            count++;
        }
        if(toDatetime!=null&&!toDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(toDatetime).getTime();
            condition3+=" timestamp<="+timestamp;
            count++;
        }
        if(status!=null&&!status.equals("")) {
            condition4 += " evaluationStatus.id=" + Integer.parseInt(status);
            count++;
        }
        if(clubName!=null&&!clubName.equals("")) {
            condition5 += " club.club like " + "'%" + clubName + "%'";
            count++;
        }
        if(count>0)
            hql+=" where ";
        if(!condition1.equals(""))
            condition+=condition1;
        if(!condition2.equals("")){
            if(condition.equals(""))
                condition+=condition2;
            else
                condition+=" and "+condition2;
        }
        if(!condition3.equals("")){
            if(condition.equals(""))
                condition+=condition3;
            else
                condition+=" and "+condition3;
        }
        if(!condition4.equals("")){
            if(condition.equals(""))
                condition+=condition4;
            else
                condition+=" and "+condition4;
        }
        if(!condition5.equals("")){
            if(condition.equals(""))
                condition+=condition5;
            else
                condition+=" and "+condition5;
        }
        hql+=condition;
        return this.findAll(hql,Evaluation.class);
    }
    public List<Evaluation>hsList(Long clubid,String name,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="from Evaluation where club.id="+clubid;
        String condition="";
        if(name!=null&&!name.equals("")) {
            condition += " and name like " + "'%" + name + "%'";
        }
        if(fromDatetime!=null&&!fromDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(fromDatetime).getTime();
            condition+=" and timestamp>="+timestamp;
        }
        if(toDatetime!=null&&!toDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(toDatetime).getTime();
            condition+=" and timestamp<="+timestamp;
        }
        if(status!=null&&!status.equals("")) {
            condition += " and evaluationStatus.id=" + Integer.parseInt(status);
        }
       /* if(count>0)
            hql+=" where ";*/
        hql += condition + " order by timestamp desc";
        return this.findAll(hql,Evaluation.class);
    }
    public List<Evaluation>getHsByPage(int start,int end,String name,String fromDatetime,String toDatetime,String status,String clubName) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="from Evaluation";
        String condition1="",condition2="",condition3="",condition4="",condition5="",condition="";
        int count=0;
        if(name!=null&&!name.equals("")) {
            condition1 += " name like " + "'%" + name + "%'";
            count++;
        }
        if(fromDatetime!=null&&!fromDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(fromDatetime).getTime();
            condition2+=" timestamp>="+timestamp;
            count++;
        }
        if(toDatetime!=null&&!toDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(toDatetime).getTime();
            condition3+=" timestamp<="+timestamp;
            count++;
        }
        if(status!=null&&!status.equals("")) {
            condition4 += " evaluationStatus.id=" + Integer.parseInt(status);
            count++;
        }
        if(clubName!=null&&!clubName.equals("")) {
            condition5 += " club.club like " + "'%" + clubName + "%'";
            count++;
        }
        if(count>0)
            hql+=" where ";
        if(!condition1.equals(""))
            condition+=condition1;
        if(!condition2.equals("")){
            if(condition.equals(""))
                condition+=condition2;
            else
                condition+=" and "+condition2;
        }
        if(!condition3.equals("")){
            if(condition.equals(""))
                condition+=condition3;
            else
                condition+=" and "+condition3;
        }
        if(!condition4.equals("")){
            if(condition.equals(""))
                condition+=condition4;
            else
                condition+=" and "+condition4;
        }
        if(!condition5.equals("")){
            if(condition.equals(""))
                condition+=condition5;
            else
                condition+=" and "+condition5;
        }
        hql += condition + " order by timestamp desc";
        return this.findByPage(hql, Evaluation.class,start,end);
    }
    public List<Evaluation>getHsByPage(Long id,int start,int end,String name,String fromDatetime,String toDatetime,String status) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
        String hql="from Evaluation where club.id="+id;
        String condition1="",condition2="",condition3="",condition4="",condition="";
        if(name!=null&&!name.equals("")) {
            condition += " and name like " + "'%" + name + "%'";
        }
        if(fromDatetime!=null&&!fromDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(fromDatetime).getTime();
            condition+=" and timestamp>="+timestamp;

        }
        if(toDatetime!=null&&!toDatetime.equals("")){
            Long timestamp=simpleDateFormat.parse(toDatetime).getTime();
            condition+=" and timestamp<="+timestamp;

        }
        if(status!=null&&!status.equals("")) {
            condition += " and evaluationStatus.id=" + Integer.parseInt(status);
        }
        hql += condition + " order by timestamp desc";
        return this.findByPage(hql, Evaluation.class,start,end);
    }
    public List<Evaluation>getListByClub(Long club){
        return this.findAll("from Evaluation where club.id=?",Evaluation.class,new Object[]{club});
    }
}
