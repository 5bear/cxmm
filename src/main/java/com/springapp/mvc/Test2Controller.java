package com.springapp.mvc;

import com.springapp.entity.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by xj on 2016/5/10.
 */
@Controller
@RequestMapping(value = "/WeiXin")
public class Test2Controller extends BaseController{
    public ModelAndView home(){
        ModelAndView modelAndView=new ModelAndView("WeiXin/index");
        return modelAndView;
    }
    @RequestMapping(value = "/test5")
    public ModelAndView test5(HttpSession session,HttpServletResponse response,HttpServletRequest request) throws IOException {
        ModelAndView modelAndView=new ModelAndView("WeiXin/test5");

        String openid = (String) session.getAttribute("openid");
        if (openid == null) {
            response.sendRedirect(request.getContextPath() + "/Wx/GetOpenId?returnUrl=" + URLEncoder.encode(request.getRequestURI(), "utf-8"));
        }
        List<Question2> question2=test2Dao.getList();//得到对应的多选题
        modelAndView.addObject("Question2List", question2);
        modelAndView.addObject("openID", openid);//微信用户账号
        return modelAndView;
    }
    @RequestMapping(value = "/test5", method = RequestMethod.POST)
    public String test1(@RequestParam(value = "answers") String answers, @RequestParam(value = "openID") String openID) {
        String[] split = answers.split(",");
        List<LChoice> answersList = new ArrayList<LChoice>();
        for (String s : split) {
            LChoice answer2 = new LChoice();
            answer2.setTid(Integer.parseInt(s));
            WxUser user=userDao.getByOpenid(openID);//获取当前用户
            answer2.setUid(user);
            answersList.add(answer2);
        }
        test2Dao.save(answersList);//存多选题已选项
        WxEvaluation wxEvaluation=wxEvaluationDao.get(openID);
        EvaluationStatus evaluationStatus=test1Dao.getEvaluationStatus(4);
        wxEvaluation.setEvaluation_status(evaluationStatus);
        test2Dao.update(wxEvaluation);//将当前状态设置为4：已做完5分钟评测

        return "redirect:/WeiXin/contact";
    }
}
