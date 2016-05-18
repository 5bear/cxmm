package com.springapp.dao;

import com.springapp.entity.Question1;
import org.hibernate.SQLQuery;
import org.hibernate.engine.transaction.internal.jdbc.JdbcTransaction;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Answer1Dao extends BaseDao {
    public List getStatistics(String evaluationId) {
        String queryString = "SELECT `a`.`answer`, COUNT(`a`.`answer`) `answercount`, `b`.`name` FROM `answer1` `a`, `bodycondition` `b` WHERE `a`.`evaluation_id` = '" + evaluationId + "' AND `a`.`answer` = `b`.`BCid` GROUP BY `a`.`answer` ORDER BY `answercount` DESC";
        SQLQuery queryObject = getSession().createSQLQuery(queryString);
        return queryObject.list();
    }

    public void clear(String evaluationId) {
        String queryString = "DELETE FROM `answer1` WHERE `evaluation_id` = '" + evaluationId + "'";
        SQLQuery queryObject = getSession().createSQLQuery(queryString);
        queryObject.executeUpdate();
    }
}
