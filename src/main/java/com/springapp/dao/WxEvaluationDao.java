package com.springapp.dao;

import com.springapp.entity.SResult;
import com.springapp.entity.WxEvaluation;
import com.springapp.entity.WxOrderinfo;
import org.springframework.stereotype.Repository;

/**
 * Created by ZhanShaoxiong on 2016/5/10.
 */
@Repository
public class WxEvaluationDao extends BaseDao {
    public WxEvaluation get(String uid){
        return this.find("from WxEvaluation where uid.openid=?",WxEvaluation.class,new Object[]{uid});
    }
    public SResult getSResult(String uid){
        return this.find("from SResult where uid.openid=?",SResult.class,new Object[]{uid});
    }
    public WxOrderinfo getWxOrderinfo(String uid){
        return this.find("from WxOrderinfo where uid.openid=?",WxOrderinfo.class,new Object[]{uid});
    }
}
