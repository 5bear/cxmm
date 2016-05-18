package com.springapp.dao;

import com.springapp.entity.Evaluation;
import com.springapp.entity.WxEvaluation;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EvaluationDao extends BaseDao {
    /*无代理用户*/
    public List<WxEvaluation>cxList(){
        return this.findAll("select new Map(e.id as id,e.uid as uid,e.name as name,e.phone as phone,e.address as address,e.evaluation_status as evaluation_status) from WxEvaluation as e,WxUser as w where e.uid.id=w.id and w.aid=0",WxEvaluation.class);
    }
    /*代理用户*/
    public List<WxEvaluation>dlList(){
        return this.findAll("select new Map(e.id as id,e.uid as uid,e.name as name,e.phone as phone,e.address as address,e.evaluation_status as evaluation_status) from WxEvaluation as e,WxUser as w where e.uid.id=w.id and w.aid>0",WxEvaluation.class);
    }
    public List<WxEvaluation>getListByAgent(Long agent){
        return this.findAll("select new Map(e.id as id,e.uid as uid,e.name as name,e.phone as phone,e.address as address,e.evaluation_status as evaluation_status) from WxEvaluation as e,WxUser as w where e.uid.id=w.id and w.aid=?",WxEvaluation.class,new Object[]{agent});
    }
    /*会所用户*/
    public List<Evaluation>hsList(){
        return this.findAll("from Evaluation",Evaluation.class);
    }
    public List<Evaluation>getListByClub(Long club){
        return this.findAll("from Evaluation where club.id=?",Evaluation.class,new Object[]{club});
    }
}
