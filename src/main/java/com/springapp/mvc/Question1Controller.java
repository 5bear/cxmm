package com.springapp.mvc;

import com.springapp.entity.*;
import com.springapp.form.Answer1s;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.*;


@Controller
@RequestMapping(value = "**")
public class Question1Controller extends BaseController {
    private static Map<String, String> bodyConditionToDetails = new HashMap<String, String>();
    private static String models = "您的体质偏向 %s，%n在产后有 %s 风险，%n坐月子是女人改变体质的黄金期，也是极易让妇科，内分泌等慢性疾病埋下隐患的敏感期，建议您依据体质，合理规划好产后饮食调理，选择由专家为您量身定制的食疗调理方案，降低敏感期风险，让您和宝宝更加健康！";

    static {
        bodyConditionToDetails.put("气虚", "子宫下垂、产后露恶不绝");
        bodyConditionToDetails.put("阳虚", "腹泻、产后脱发");
        bodyConditionToDetails.put("阴虚", "便秘、产后露恶不绝");
        bodyConditionToDetails.put("气郁", "产后抑郁症、产后缺乳");
        bodyConditionToDetails.put("血瘀", "产后出血量大、产后排尿不良");
        bodyConditionToDetails.put("痰湿", "产后肥胖症");
        bodyConditionToDetails.put("湿热", "乳腺炎、泌尿道感染");
        bodyConditionToDetails.put("特禀", "过敏、湿疹");
        bodyConditionToDetails.put("平和", "");
    }

    @RequestMapping(value = "/Question1/Test")
    public ModelAndView test0() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/Question1/Test");
        modelAndView.addObject("Question1List", question1Dao.getClubQuestion());
        return modelAndView;
    }

    @RequestMapping(value = "/Question1/Test", method = RequestMethod.POST)
    @ResponseBody
    public String test1(Integer[] score, HttpSession session) {
        Map<String,String> returnMap = new HashMap<String, String>();
        try {
            UUID uuid = UUID.randomUUID();
            String guid = uuid.toString().replaceAll("-", "");
            session.setAttribute("guid", guid);
            Evaluation evaluation = new Evaluation();
            evaluation.setGuid(guid);
            EvaluationStatus evaluationStatus = test1Dao.getEvaluationStatus(1);
            evaluation.setEvaluationStatus(evaluationStatus);
            Club club = (Club) session.getAttribute("club");
            evaluation.setClub(club);
            evaluation.setTime(new Timestamp(System.currentTimeMillis()));
            evaluationDao.save(evaluation);
            for (int i = 1; i <= 9; i++) {
                ClubResult clubResult = new ClubResult();
                clubResult.setBid(i);
                clubResult.setEvaluationId(evaluation.getGuid());
                clubResult.setScore(score[i]);
                baseDao.save(clubResult);
            }
            returnMap.put("status", "success");
            returnMap.put("guid", guid);
            return JSONObject.fromObject(returnMap).toString();
        }catch (Exception e){
            returnMap.put("status", "fail");
            return JSONObject.fromObject(returnMap).toString();
        }
    }

    @RequestMapping(value = "/Question1/Result")
    public ModelAndView result(String evaluationId) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/Question1/Result");
        modelAndView.addObject("EvaluationId", evaluationId);
        return modelAndView;
    }

    @RequestMapping(value = "getClubResult",method = RequestMethod.POST)
    @ResponseBody
    public String getClubResult(String EvaluationId){
        List<ClubResult> clubResultList = question1Dao.getClubResult(EvaluationId);
        return JSONArray.fromObject(clubResultList).toString();
    }
    @RequestMapping(value = "/Question1/Clear")
    public String clear(String evaluationId) {
        evaluationDao.delete(Evaluation.class, Long.parseLong(evaluationId));
        return "redirect:/Question1/Test";
    }
}
