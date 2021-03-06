package com.springapp.dao;

import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Answer2Dao extends BaseDao {
    public List getStatistics(String evaluationId){
        String queryString = "SELECT `b`.`name`,COUNT(`q`.`type`) `typecount` FROM `answer2` `a` INNER JOIN `question2` `q` ON `a`.`question2_id` = `q`.`id` INNER JOIN `bodycondition` `b` ON `q`.`type` = `b`.`BCid` WHERE `a`.`evaluation_id` = '" + evaluationId + "' GROUP BY `q`.`type` ORDER BY `typecount` DESC";
        return this.findAllBySql(queryString);
    }

    public void clear(String evaluationId) {
            String queryString = "DELETE FROM `answer2` WHERE `evaluation_id` = '" + evaluationId + "'";
        executeSQL(queryString);
    }
}
