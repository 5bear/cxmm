package com.springapp.mvc;

import com.springapp.entity.WxEvaluation;
import com.springapp.entity.WxOrderinfo;
import com.springapp.entity.WxUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ZhanShaoxiong on 2016/5/9.
 */
@Controller
@RequestMapping(value = "/Wx")
public class UserController extends BaseController {
    @RequestMapping(value = "/info")
    public ModelAndView info(HttpServletRequest request) throws UnsupportedEncodingException {
        ModelAndView modelAndView = new ModelAndView("Wx/info");
        HttpSession session = request.getSession();
        String openid = (String) session.getAttribute("openid");
        System.out.print("openid:"+session.getAttribute("openid"));
        if (openid == null) {
            return new ModelAndView("redirect:" + "/Wx/GetOpenId?returnUrl=" + URLEncoder.encode(request.getRequestURI(), "utf-8"));
        }
        WxUser wxUser = userDao.getByOpenid(openid);
        modelAndView.addObject("wxuser", wxUser);
        List<WxOrderinfo> wxOrderinfoList=orderDao.getByOpenid(openid);
        List<Map>mapList=new ArrayList<Map>();
        for(WxOrderinfo wxOrderinfo:wxOrderinfoList){
            Map map=new HashMap();
            map.put("id",wxOrderinfo.getId());
            map.put("orderNum",wxOrderinfo.getOrderNum());
            map.put("dateTime",wxOrderinfo.getDate());
            int cc=0,ch=0;
            if(!wxOrderinfo.getCanceNum().equals(""))
                cc=wxOrderinfo.getCanceNum().split(",").length;
            if(!wxOrderinfo.getCanheNum().equals(""))
                ch=wxOrderinfo.getCanheNum().split(",").length;
            map.put("cance",wxOrderinfo.getCanceNum());
            map.put("canhe",wxOrderinfo.getCanheNum());
            map.put("price",cc*98+ch*2980);
            map.put("name",wxOrderinfo.getName());
            map.put("address",wxOrderinfo.getAddress());
            map.put("phoneNum",wxOrderinfo.getPhoneNum());
            map.put("deliverStatus",wxOrderinfo.getDeliverStatus());
            map.put("express",wxOrderinfo.getExpress());
            map.put("expressNum",wxOrderinfo.getExpressNum());
            mapList.add(map);
        }
        modelAndView.addObject("list",mapList);
        WxEvaluation wxEvaluation=wxEvaluationDao.get(openid);
        modelAndView.addObject("wxEvaluation",wxEvaluation);
        return modelAndView;
    }

    @RequestMapping(value = "/getReceipt")
    public void getReceipt(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
        Map<String,Integer> mapUser = wxUsers();
        for(String key:mapUser.keySet()){
            if(mapUser.get(key)>1)
                System.out.print(key+"\n");
        }
    }
    public Map<String,Integer>  wxUsers(){
        List<WxUser> users = userDao.findAll("from WxUser",WxUser.class);
        Map<String,Integer> mapUser = new HashMap<String, Integer>();
        for(WxUser wxUser:users){
            Integer count = mapUser.get(wxUser.getOpenid());
            if(count==null)
                mapUser.put(wxUser.getOpenid(),1);
            else{
                mapUser.put(wxUser.getOpenid(),count+1);
            }
        }
        return mapUser;
    }
}
