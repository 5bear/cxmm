package com.springapp.dao;

import com.springapp.entity.Agent;
import com.springapp.entity.WxOrderinfo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ZhanShaoxiong on 2016/5/8.
 */
@Repository
public class AgentDao extends BaseDao {
    public List<Agent> getList() {
        return this.findAll("from Agent", Agent.class);
    }

    public Map getAsMap(Long id,float canheRate,float canceRate){
        Agent agent=this.get(Agent.class,id);
        List<WxOrderinfo>wxOrderinfoList=this.findAll("from WxOrderinfo where uid.openid =?",WxOrderinfo.class,agent.getOpenid());
        int canheNum=0,canceNum=0;
        for(WxOrderinfo wxOrderinfo:wxOrderinfoList){
            canceNum+=wxOrderinfo.getCanceNum();
            canheNum+=wxOrderinfo.getCanheNum();
        }
        Map map=new HashMap();
        map.put("name",agent.getAgent());
        map.put("recommend",agent.getRecommend());
        map.put("phoneNum",agent.getPhoneNum());
        map.put("canheNum",canheNum);
        map.put("canceNum",canceNum);
        map.put("canheRate",canheRate);
        map.put("canceRate",canceRate);
        return map;
    }
    public List<Agent> getList(Long agent) {
        return this.findAll("from Agent where fromAgent=?", Agent.class, new Object[]{agent});
    }

    public List<Agent> getByPage(int start, int end) {
        return this.findByPage("from Agent", Agent.class, start, end);
    }

    public List<Map>getByRecommend(String recommend,float canheRate,float canceRate){
        List<Map>mapList=new ArrayList<Map>();
        List<Agent>agentList =this.findAll("from Agent where recommend=?",new Object[]{recommend});
        for(Agent agent:agentList){
            List<WxOrderinfo>wxOrderinfoList=this.findAll("from WxOrderinfo where uid.openid =?",WxOrderinfo.class,agent.getOpenid());
            int canheNum=0,canceNum=0;
            for(WxOrderinfo wxOrderinfo:wxOrderinfoList){
                canceNum+=wxOrderinfo.getCanceNum();
                canheNum+=wxOrderinfo.getCanheNum();
            }
            Map map=new HashMap();
            map.put("name",agent.getAgent());
            map.put("recommend",agent.getRecommend());
            map.put("phoneNum",agent.getPhoneNum());
            map.put("canheNum",canheNum);
            map.put("canceNum",canceNum);
            map.put("canheRate",canheRate);
            map.put("canceRate",canceRate);
            mapList.add(map);
        }
        return mapList;
    }

    public List<Agent> findByCondition(String club, String status) {
        String hql = "from Agent ";
        String condition1 = null, condition2 = null;
        int count = 0;
        if (club != null && !club.equals("")) {
            condition1 = " agent like " + "'%" + club + "%'";
            count++;
        }
        if (status != null && !status.equals("")) {
            condition2 = " status=" + "'" + status + "'";
            count++;
        }
        if (count == 0)
            return this.findAll(hql, Agent.class);
        if (condition1 != null && condition2 != null)
            hql += " where " + condition1 + "and" + condition2;
        else if (condition1 != null && condition2 == null)
            hql += " where" + condition1;
        else
            hql += " where" + condition2;
        return this.findAll(hql, Agent.class);
    }

    public Agent isAgent(String openId) throws Exception {
        String hql = "from Agent where openid='" + openId + "'";
        List<Agent> agents = findAll(hql, Agent.class);
        if (agents.size() == 1) {
            return agents.get(0);
        } else if (agents.size() > 1) {
            throw new Exception("一个人申请了两次。");
        }
        return null;
    }
}
