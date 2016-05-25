package com.springapp.mvc;

import com.springapp.entity.*;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ZhanShaoxiong on 2016/5/10.
 */
@Controller
@RequestMapping(value = "/Evaluate")
public class EvaluateController extends BaseController {
    @RequestMapping
    public ModelAndView home(){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/test");
        return modelAndView;
    }
    @RequestMapping(value = "evaluate1")
    public ModelAndView evaluate1(HttpServletRequest request) throws ParseException {
        ModelAndView modelAndView=new ModelAndView("Web/Upload/evaluate1");
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
        end=start+10;
        List<WxEvaluation> wxEvaluationList = evaluationDao.cxList(name,fromDatetime,toDatetime,status);
        int totalPage;
        if(wxEvaluationList.size()%10==0)
            totalPage=wxEvaluationList.size()/10;
        else
            totalPage=wxEvaluationList.size()/10+1;
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("totalPage",totalPage);
        List<WxEvaluation>myList=evaluationDao.getCxByPage(start, end,name,fromDatetime,toDatetime,status);
        modelAndView.addObject("list", myList);
        List<EvaluationStatus>evaluationStatuses=baseDao.findAll("from EvaluationStatus",EvaluationStatus.class);
        modelAndView.addObject("evaluationStatuses",evaluationStatuses);
        return modelAndView;
    }
    @RequestMapping(value = "evaluate2")
    public ModelAndView evaluate2(HttpServletRequest request) throws ParseException {
        ModelAndView modelAndView=new ModelAndView("Web/Upload/evaluate2");
        String name=request.getParameter("name");
        request.setAttribute("name",name);
        String agent=request.getParameter("agent");
        request.setAttribute("agent",agent);
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
        end=start+10;
        List<WxEvaluation> wxEvaluationList = evaluationDao.dlList(name,agent,fromDatetime,toDatetime,status);
        int totalPage;
        if(wxEvaluationList.size()%10==0)
            totalPage=wxEvaluationList.size()/10;
        else
            totalPage=wxEvaluationList.size()/10+1;
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("totalPage",totalPage);
        List<WxEvaluation>myList=evaluationDao.getDlByPage(start, end,name,agent,fromDatetime,toDatetime,status);
        modelAndView.addObject("list", myList);
        List<EvaluationStatus>evaluationStatuses=baseDao.findAll("from EvaluationStatus",EvaluationStatus.class);
        modelAndView.addObject("evaluationStatuses",evaluationStatuses);
        return modelAndView;
    }
    @RequestMapping(value = "evaluate3")
    public ModelAndView evaluate3(HttpServletRequest request) throws ParseException {
        ModelAndView modelAndView=new ModelAndView("Web/Upload/evaluate3");
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
        end=start+10;
        List<Evaluation> wxEvaluationList = evaluationDao.hsList(name,fromDatetime,toDatetime,status);
        int totalPage;
        if(wxEvaluationList.size()%10==0)
            totalPage=wxEvaluationList.size()/10;
        else
            totalPage=wxEvaluationList.size()/10+1;
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("totalPage",totalPage);
        List<Evaluation>myList=evaluationDao.getHsByPage(start, end,name,fromDatetime,toDatetime,status);
        modelAndView.addObject("list", myList);
        List<EvaluationStatus>evaluationStatuses=baseDao.findAll("from EvaluationStatus",EvaluationStatus.class);
        modelAndView.addObject("evaluationStatuses",evaluationStatuses);
        return modelAndView;
    }
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "infoList") String infoList) {
        String[] evaluationIds = infoList.split(",");
        for (String id : evaluationIds) {
            WxEvaluation wxEvaluation = evaluationDao.get(WxEvaluation.class, Long.parseLong(id));
            baseDao.delete(wxEvaluation);
            List<SChoice>sChoiceList=baseDao.findAll("from SChoice where uid.uid=?",SChoice.class,new Object[]{wxEvaluation.getUid().getUid()});
            for(SChoice sChoice:sChoiceList){
                baseDao.delete(sChoice);
            }
            List<LChoice>lChoiceList=baseDao.findAll("from LChoice where uid.uid=?",LChoice.class,new Object[]{wxEvaluation.getUid().getUid()});
            for(LChoice lChoice:lChoiceList){
                baseDao.delete(lChoice);
            }
            List<LResult>lResultList=baseDao.findAll("from LResult where uid.uid=?",LResult.class,new Object[]{wxEvaluation.getUid().getUid()});
            for(LResult lResult:lResultList){
                baseDao.delete(lResult);
            }
        }
        return "success";
    }
    @RequestMapping(value = "getResult",method = RequestMethod.POST)
    @ResponseBody
    public String getResult(@RequestParam(value = "type")int type,@RequestParam(value = "uid")int uid) {
        List<Map> resultList = new ArrayList();
        Map resultMap = new HashMap();
        String result = "";
        if (type == 1) {
            resultList = test1Dao.getStatistics(uid);//降序得到1分钟评测的体质结果，未筛选出得分>=2的
            {
                //result为最终结果
                int count = 0;
                for (Map map : resultList) {
                    if (Integer.parseInt(map.get("countNum").toString()) >= 2) {
                        if (count == 0) {
                            result += map.get("name");
                        } else {
                            result += "," + map.get("name");
                        }
                        count++;
                    }
                }
            }
            resultMap.put("result",result);
            resultMap.put("resultList",resultList);
        }else{
            List<LResult>lResultList=test2Dao.getResult(uid);
            if(lResultList.size()<=1)
                result="无法判断出您的体质类型...";
            else{
                result+=lResultList.get(0).getBCid().getName()+","+lResultList.get(1).getBCid().getName();
            }
            resultMap.put("result",result);
            resultMap.put("resultList",lResultList);
        }
        return JSONObject.fromObject(resultMap).toString();
    }
}
