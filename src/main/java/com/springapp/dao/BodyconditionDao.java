package com.springapp.dao;

/**
 * Created by xr on 2016/5/9.
 */
import com.springapp.entity.BodyCondition;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BodyconditionDao extends BaseDao{
    public List<BodyCondition> getList(){
        return this.findAll("from BodyCondition",BodyCondition.class);
    }
}
