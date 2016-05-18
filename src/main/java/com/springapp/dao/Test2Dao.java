package com.springapp.dao;

import com.springapp.entity.LResult;
import com.springapp.entity.Question2;
import com.springapp.entity.WxUser;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by xj on 2016/5/8.
 */
@Repository
public class Test2Dao extends BaseDao {

    public WxUser getUser(int uid) {
        return this.find("from WxUser where uid=?",WxUser.class,new Object[]{uid});
    }

    public List<Question2> getList(String uid) {//获取多选题
        return this.findAll("select new Map(q.id as id,q.type as type,q.question as question) from Question2 as q,SResult as s where s.uid.openid=? and s.BCid=q.type and s.count>=2", Question2.class, new Object[]{uid});

        /*version2:如果上面的sql没办法join两张表，就用下面这个。但是需要把结果以question2的格式存进List
        String queryString = "SELECT question2.id,question2.type,question2.question from question2,sresult where sresult.uid="+uid+" and sresult.BCid=question2.type and sresult.count>=2;";
        SQLQuery queryObject = getSession().createSQLQuery(queryString);
        return queryObject.list();//未将结果以question2的格式存进List
        */
    }
    public List<Question2> getList() {//获取多选题
     return this.findAll("from Question2");
    }
    public List<LResult> getResult(String openID){
        //由lchoice表计算5分钟测试的得分，并存入lresult表中
        String queryString = "insert into LResult(BCid,uid,score)(select Question2.type,LChoice.uid,count(LChoice.tid) from Question2,LChoice where uid="+openID+" and Question2.id=LChoice.tid group by Question2.type);";
        SQLQuery queryObject = getSession().createSQLQuery(queryString);
        queryObject.executeUpdate();

        //从lresult表中查询取出，上句存入的测试得分。uid=openID
        return this.findAll("from LResult where uid.openid=?", LResult.class, new Object[]{openID});
    }
/*
将WxEvaluation中用户状态设为4：已做完5分钟评测
 */
    public void setStatus(String openID){
        String queryString = "update WxEvaluation set evaluation_status=4 where uid="+openID+";";
        SQLQuery queryObject = getSession().createSQLQuery(queryString);
        queryObject.executeUpdate();
    }
}