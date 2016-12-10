package com.springapp.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Answer1Dao extends BaseDao {
    public List getStatistics(String evaluationId) {
        String queryString = "SELECT `a`.`answer`, COUNT(`a`.`answer`) `answercount`, `b`.`name` FROM `answer1` `a`, `bodycondition` `b` WHERE `a`.`evaluation_id` = '" + evaluationId + "' AND `a`.`answer` = `b`.`BCid` GROUP BY `a`.`answer` ORDER BY `answercount` DESC";
        return this.findAllBySql(queryString);
    }

    public void clear(String evaluationId) {
        String queryString = "DELETE FROM `answer1` WHERE `evaluation_id` = '" + evaluationId + "'";
        this.executeSQL(queryString);
    }
}
