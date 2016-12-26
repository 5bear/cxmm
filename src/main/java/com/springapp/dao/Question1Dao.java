package com.springapp.dao;

import com.springapp.entity.ClubResult;
import com.springapp.entity.Question1;
import com.springapp.entity.ClubQuestion;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Question1Dao extends BaseDao {
    public List<Question1> getList() {
        return this.findAll("from Question1", Question1.class);
    }

    public List<ClubQuestion> getClubQuestion() {
        return this.findAll("from ClubQuestion", ClubQuestion.class);
    }

    public List<ClubResult> getClubResult(String EvaluationId){
        return this.findAll("from ClubResult where evaluationId='" + EvaluationId + "'", ClubResult.class);
    }

    public List<ClubResult> getClubResult1(String EvaluationId){
        return this.findAll("from ClubResult where evaluationId='" + EvaluationId + "' order by score desc", ClubResult.class);
    }
}
