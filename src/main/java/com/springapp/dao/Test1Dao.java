package com.springapp.dao;

import com.springapp.entity.EvaluationStatus;
import com.springapp.entity.Question1;
import com.springapp.entity.WxUser;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by xj on 2016/5/8.
 */
@Repository
public class Test1Dao extends BaseDao {

    public Question1 getList(int id) {
        return this.find("from Question1 where id=?",Question1.class,new Object[]{id});
    }
    public WxUser getUser(int uid) {
        return this.find("from WxUser where uid=?",WxUser.class,new Object[]{uid});
    }

    public EvaluationStatus getEvaluationStatus(int id) {
        return this.find("from EvaluationStatus where id=?",EvaluationStatus.class,new Object[]{id});
    }

    public List<Map> getStatistics(int uid) {
        //降序得到1分钟评测的结果
       /* String queryString = "select BodyCondition.BCid,BodyCondition.name,BodyCondition.tendency,count(cid) as countNum from SChoice,BodyCondition where SChoice.uid="+uid+" and SChoice.cid=BodyCondition.BCid " +
                "group by SChoice.cid order by count(cid) desc;";
        SQLQuery queryObject = getSession().createSQLQuery(queryString);
        return queryObject.list();*/
        return this.findAll("select new Map(b.BCid as BCid,b.name as name,b.tendency as tendency,count(s.cid) as countNum) from BodyCondition as b,SChoice as s where s.uid.uid=? and s.cid=b.BCid group by s.cid order by count(s.cid) desc",new Object[]{uid});
    }
}