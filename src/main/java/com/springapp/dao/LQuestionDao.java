package com.springapp.dao;

import com.springapp.entity.SQuestion;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/8.
 */
@Repository
public class LQuestionDao extends BaseDao {
    public List<SQuestion>getList(int id){
        return this.findAll("from LQuestion where CID=?",SQuestion.class,new Object[]{id});
    }
}
