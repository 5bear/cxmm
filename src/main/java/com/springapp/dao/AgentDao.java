package com.springapp.dao;

import com.springapp.entity.Agent;
import com.springapp.entity.WxOrderinfo;
import com.springapp.entity.WxUser;
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
        return this.findAll("from Agent order by id desc", Agent.class);
    }
    public List<Agent>getList(String agent,String status,String recommend){
        String hql="from Agent where id>0";
        String condition="";
        if(agent!=null&&!agent.equals("")) {
            condition+= " and agent like " + "'%"+agent+"%'";

        }
        if(status!=null&&!status.equals("")) {
            condition+= " and status=" + "'"+status+"'";

        }
        if(recommend!=null&&!recommend.equals("")) {
            condition+= " and recommend like " + "'%"+recommend+"%'";

        }
        if(!condition.equals(""))
            hql+=condition;
        hql+=" order by id desc";
        return this.findAll(hql,Agent.class);
    }
    public Map getAsMap(Long id,float canheRate,float canceRate,Long startDate,Long endDate){
        Agent agent=this.get(Agent.class,id);
        WxUser wxUser=this.find("from WxUser where openid=?",WxUser.class,new Object[]{agent.getOpenid()});
        List<WxOrderinfo>wxOrderinfoList=this.findAll("from WxOrderinfo where uid.openid =? and dateTime>=? and dateTime<=?",WxOrderinfo.class,new Object[]{agent.getOpenid(),startDate,endDate});
        int canheNum=0,canceNum=0;
        for(WxOrderinfo wxOrderinfo:wxOrderinfoList){
            if(!wxOrderinfo.getCanceNum().equals("")){
                String[]canceNums=wxOrderinfo.getCanceNum().split(",");
                canceNum+=canceNums.length;
            }
            if(!wxOrderinfo.getCanheNum().equals("")) {
                String[] canheNums = wxOrderinfo.getCanheNum().split(",");
                canheNum += canheNums.length;
            }
        }
        Map map=new HashMap();
        map.put("name",agent.getAgent());
        map.put("agent",wxUser.getAgent());
        map.put("recommend",agent.getRecommend());
        map.put("phoneNum",agent.getPhoneNum());
        map.put("canheNum",canheNum);
        map.put("canceNum",canceNum);
        map.put("canheRate",canheRate);
        map.put("canceRate",canceRate);
        return map;
    }
    public List<Agent> getList(String recommend) {
        return this.findAll("from Agent where recommend=?", Agent.class, new Object[]{recommend});
    }
    public List<Agent> getListByStatus() {
        return this.findAll("from Agent where status=?", Agent.class, new Object[]{"可用"});
    }

    public List<Agent> getByPage(String agent1,String status,String recommend,int start, int end) {
        String hql="from Agent where id>0";
        String condition="";
        if(agent1!=null&&!agent1.equals("")) {
            condition+= " and agent like " + "'%"+agent1+"%'";
        }
        if(status!=null&&!status.equals("")) {
            condition+= " and  status=" + "'"+status+"'";
        }
        if(recommend!=null&&!recommend.equals("")) {
            condition+= " and  recommend like " + "'%"+recommend+"%'";
        }
        if(!condition.equals(""))
            hql+=condition;
        List<Agent>agentList= this.findByPage(hql, Agent.class, start, end);
        List<Agent>myList=new ArrayList<Agent>();
        for(Agent agent:agentList){
            List<WxUser>wxUserList=this.findAll("from WxUser where aid=?",WxUser.class,new Object[]{agent.getId()});
            agent.setUserNum(wxUserList.size());
            int canceNum=0,canheNum=0;
            for(WxUser wxUser:wxUserList){
                List<WxOrderinfo>wxOrderinfoList=this.findAll("from WxOrderinfo where uid.uid=?",WxOrderinfo.class,new Object[]{wxUser.getUid()});
                for(WxOrderinfo wxOrderinfo:wxOrderinfoList){
                    if(!wxOrderinfo.getCanceNum().equals("")){
                        String[]canceNums=wxOrderinfo.getCanceNum().split(",");
                        canceNum+=canceNums.length;
                    }
                    if(!wxOrderinfo.getCanheNum().equals("")) {
                        String[] canheNums = wxOrderinfo.getCanheNum().split(",");
                        canheNum += canheNums.length;
                    }
                }
            }
            agent.setCanceNum(canceNum);
            agent.setCanheNum(canheNum);
            myList.add(agent);
        }
        return myList;
    }

    public List<Map>getByAgent(Agent fromAgent,float canheRate,float canceRate,Long startDate,Long endDate){
        List<Map>mapList1=new ArrayList<Map>();
        List<Map>mapList2=new ArrayList<Map>();
        List<Map>mapList=new ArrayList<Map>();
        List<Agent>agentList =this.findAll("from Agent where recommend=?",new Object[]{fromAgent.getAgent()});
        List<WxUser>wxUserList=this.findAll("from WxUser where aid=?",WxUser.class,new Object[]{fromAgent.getId()});
        for(Agent agent:agentList){
            List<WxOrderinfo>wxOrderinfoList=this.findAll("from WxOrderinfo where uid.openid =? and dateTime>=? and dateTime<=?",WxOrderinfo.class,new Object[]{agent.getOpenid(),startDate,endDate});
            WxUser wxUser=this.find("from WxUser where openid=?",WxUser.class,new Object[]{agent.getOpenid()});
            int canheNum=0,canceNum=0;
            for(WxOrderinfo wxOrderinfo:wxOrderinfoList){
                String[]canceNums=wxOrderinfo.getCanceNum().split(",");
                String[]canheNums=wxOrderinfo.getCanheNum().split(",");
                canceNum+=canceNums.length;
                canheNum+=canheNums.length;
            }
            Map map=new HashMap();
            map.put("name",agent.getAgent());
            map.put("recommend",agent.getRecommend());
            map.put("agent",wxUser.getAgent());
            map.put("phoneNum",agent.getPhoneNum());
            map.put("canheNum",canheNum);
            map.put("canceNum",canceNum);
            map.put("canheRate",canheRate);
            map.put("canceRate",canceRate);
            mapList1.add(map);
        }
        for(WxUser wxUser:wxUserList){
            Agent agent=this.find("from Agent where openid=?",Agent.class,new Object[]{wxUser.getOpenid()});
            if(agent!=null&&agent.getRecommend().equals(fromAgent.getAgent()))
                continue;
            List<WxOrderinfo>wxOrderinfoList=this.findAll("from WxOrderinfo where uid.openid =? and dateTime>=? and dateTime<=?",WxOrderinfo.class,new Object[]{wxUser.getOpenid(),startDate,endDate});
            int canheNum=0,canceNum=0;
            for(WxOrderinfo wxOrderinfo:wxOrderinfoList){
                String[]canceNums=wxOrderinfo.getCanceNum().split(",");
                String[]canheNums=wxOrderinfo.getCanheNum().split(",");
                canceNum+=canceNums.length;
                canheNum+=canheNums.length;
            }
            Map map=new HashMap();
            map.put("name",wxUser.getNickname());
            map.put("agent",wxUser.getAgent());
            map.put("recommend",agent==null||agent.getRecommend()==null?"无":agent.getRecommend());
            map.put("phoneNum",wxUser.getPhone());
            map.put("canheNum",canheNum);
            map.put("canceNum",canceNum);
            map.put("canheRate",canheRate);
            map.put("canceRate",canceRate);
            mapList2.add(map);
        }
        mapList1.addAll(mapList2);
        return mapList1;
    }

    public List<Map>getByRecommend(String recommend,float canheRate,float canceRate,Long startDate,Long endDate){
        List<Map>mapList=new ArrayList<Map>();
        List<Agent>agentList =this.findAll("from Agent where recommend=?",new Object[]{recommend});
        for(Agent agent:agentList){

            List<WxOrderinfo>wxOrderinfoList=this.findAll("from WxOrderinfo where uid.openid =? and dateTime>=? and dateTime<=?",WxOrderinfo.class,new Object[]{agent.getOpenid(),startDate,endDate});
            int canheNum=0,canceNum=0;
            for(WxOrderinfo wxOrderinfo:wxOrderinfoList){
                String[]canceNums=wxOrderinfo.getCanceNum().split(",");
                String[]canheNums=wxOrderinfo.getCanheNum().split(",");
                canceNum+=canceNums.length;
                canheNum+=canheNums.length;
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
        String hql = "from Agent where isDelete=0";
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
            hql += " and" + condition1 + "and" + condition2;
        else if (condition1 != null && condition2 == null)
            hql += " and" + condition1;
        else
            hql += " and" + condition2;
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
    public Agent isIn(String agent) throws Exception {
        String hql = "from Agent where agent='" + agent + "'";
        List<Agent> agents = findAll(hql, Agent.class);
        if (agents.size() == 1) {
            return agents.get(0);
        } else if (agents.size() > 1) {
            throw new Exception("一个人申请了两次。");
        }
        return null;
    }
}
