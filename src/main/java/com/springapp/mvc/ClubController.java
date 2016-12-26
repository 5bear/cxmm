package com.springapp.mvc;

import com.springapp.entity.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ZhanShaoxiong on 2016/5/8.
 */
@Controller
@RequestMapping(value = "/Club")
public class ClubController extends BaseController {
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView home(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("Web/Upload/club");
        /*分页，每页十项*/
        String pn=request.getParameter("pn");
        int pageNum=1,start=0,end=0;
        if(pn!=null&&!pn.equals(""))
            pageNum=Integer.parseInt(pn);
        start = (pageNum - 1) * 10;
        end=10;
        List<Club> clubList = clubDao.getList();
        int totalPage;
        if(clubList.size()%10==0)
            totalPage=clubList.size()/10;
        else
            totalPage=clubList.size()/10+1;
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("totalPage",totalPage);
        List<Club>myList=clubDao.getByPage(start,end);
        modelAndView.addObject("list", myList);
        return modelAndView;
    }

    @RequestMapping(value = "clubIndex",method = RequestMethod.GET)
    public ModelAndView clubIndex() {
        ModelAndView modelAndView = new ModelAndView("Web/Upload/backindex");
        return modelAndView;
    }
    @RequestMapping(value = "clubOrder",method = RequestMethod.GET)
    public ModelAndView clubOrder(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("Web/Upload/clubOrder");
        String name=request.getParameter("name");
        String express=request.getParameter("express");
         /*分页，每页十项*/
        String pn=request.getParameter("pn");
        int pageNum=1,start=0,end=0;
        if(pn!=null&&!pn.equals(""))
            pageNum=Integer.parseInt(pn);
        start = (pageNum - 1) * 10;
        end=10;
        List<HsOrder> hsOrderList = orderDao.getHsList(name, express);
        int totalPage;
        if(hsOrderList.size()%10==0)
            totalPage=hsOrderList.size()/10;
        else
            totalPage=hsOrderList.size()/10+1;
        request.setAttribute("name",name);
        request.setAttribute("express",express);
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("totalPage",totalPage);
        List<HsOrder>myList=orderDao.getHsByPage(start,end,name,express);
        modelAndView.addObject("list", myList);
        return modelAndView;
    }
    @RequestMapping(value = "pointRecord",method = RequestMethod.GET)
    public ModelAndView pointRecord(HttpSession session,HttpServletRequest request) throws ParseException {
        ModelAndView modelAndView = new ModelAndView("Web/Upload/pointrecord");
        Club club= (Club) session.getAttribute("club");
        String name=request.getParameter("name");
        request.setAttribute("name",name);
        String fromDatetime=request.getParameter("fromDatetime");
        request.setAttribute("fromDatetime",fromDatetime);
        String toDatetime=request.getParameter("toDatetime");
        request.setAttribute("toDatetime",toDatetime);
        String status=request.getParameter("status");
        request.setAttribute("status",status);
          /*分页，每页十项*/
        String pn=request.getParameter("pn");
        int pageNum=1,start=0,end=0;
        if(pn!=null&&!pn.equals(""))
            pageNum=Integer.parseInt(pn);
        start = (pageNum - 1) * 10;
        end=10;
        List<Evaluation> wxEvaluationList = evaluationDao.hsList(club.getId(),name,fromDatetime,toDatetime,status);
        int totalPage;
        if(wxEvaluationList.size()%10==0)
            totalPage=wxEvaluationList.size()/10;
        else
            totalPage=wxEvaluationList.size()/10+1;
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("totalPage",totalPage);
        List<Evaluation>myList=evaluationDao.getHsByPage(club.getId(),start, end,name,fromDatetime,toDatetime,status);
        modelAndView.addObject("list", myList);
        List<EvaluationStatus>evaluationStatuses=baseDao.findAll("from EvaluationStatus",EvaluationStatus.class);
        modelAndView.addObject("evaluationStatuses",evaluationStatuses);
        return modelAndView;
    }

    @RequestMapping(value = "changePassword",method = RequestMethod.GET)
    public ModelAndView changePassword() {
        ModelAndView modelAndView = new ModelAndView("Web/Upload/changepassword");
        return modelAndView;
    }
    @RequestMapping(value = "changePassword",method = RequestMethod.POST)
    @ResponseBody
    public String changePassword(@RequestParam(value = "oldPwd")String oldPwd,@RequestParam(value = "newPwd")String newPwd,HttpSession session) {
        Club club= (Club) session.getAttribute("club");
        if(club.getPassword().equals(oldPwd)) {
            club.setPassword(newPwd);
            baseDao.update(club);
            return "success";
        }
        return "fail";
    }
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Club club) {
        clubDao.save(club);
        return "redirect:/Club";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(Club club) {
        clubDao.update(club);
        return "redirect:/Club";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "infoList") String infoList) {
        String[] clubIds = infoList.split(",");
        for (String id : clubIds) {
            Club club = clubDao.get(Club.class, Long.parseLong(id));
            clubDao.delete(club);
        }
        return "success";
    }
    @RequestMapping(value = "/find", method = RequestMethod.POST)
    @ResponseBody
    public String find(@RequestParam(value = "club") String club,@RequestParam(value = "status")String status) {
        List<Club>clubList=clubDao.findByCondition(club,status);
        return JSONArray.fromObject(clubList).toString();
    }

    @RequestMapping(value = "/changeStatus", method = RequestMethod.POST)
    @ResponseBody
    public String changeStatus(@RequestParam(value = "infoList") String infoList, @RequestParam(value = "type") int type) {
        String[] clubIds = infoList.split(",");
        for (String id : clubIds) {
            Club club = clubDao.get(Club.class, Long.parseLong(id));
            if (type == 0)
                club.setStatus("可用");
            else
                club.setStatus("失效");
            clubDao.update(club);
        }
        return "success";
    }
    @RequestMapping(value = "getResult1",method = RequestMethod.POST)
    @ResponseBody
    public String getResult1(@RequestParam(value = "evaluationId")String evaluationId) {
        Map resultMap = new HashMap();
        String result = "";
        List<ClubResult> clubResultList = question1Dao.getClubResult1(evaluationId);
        int index = 0;
        ClubResult firstItem = clubResultList.get(0);
        int maxScore = firstItem.getScore();
        for (ClubResult clubResult : clubResultList) {
            if(clubResult.getScore()==maxScore) {
                if (index == 0) {
                    index++;
                    result += clubResult.getBodyCondition();
                } else {
                    index++;
                    result += "兼" + clubResult.getBodyCondition();
                }
            }
        }
        resultMap.put("result",result);
        resultMap.put("resultList",clubResultList);
        return JSONObject.fromObject(resultMap).toString();
    }
}
