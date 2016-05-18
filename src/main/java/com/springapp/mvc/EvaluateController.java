package com.springapp.mvc;

import com.springapp.entity.Evaluation;
import com.springapp.entity.EvaluationStatus;
import com.springapp.entity.WxEvaluation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

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
    public ModelAndView evaluate1(){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/evaluate1");
        List<WxEvaluation> evaluationList=evaluationDao.cxList();
        modelAndView.addObject("list",evaluationList);
        List<EvaluationStatus>evaluationStatuses=baseDao.findAll("from EvaluationStatus",EvaluationStatus.class);
        modelAndView.addObject("evaluationStatuses",evaluationStatuses);
        return modelAndView;
    }
    @RequestMapping(value = "evaluate2")
    public ModelAndView evaluate2(){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/evaluate2");
        List<WxEvaluation> evaluationList=evaluationDao.dlList();
        modelAndView.addObject("list",evaluationList);
        List<EvaluationStatus>evaluationStatuses=baseDao.findAll("from EvaluationStatus",EvaluationStatus.class);
        modelAndView.addObject("evaluationStatuses",evaluationStatuses);
        return modelAndView;
    }
    @RequestMapping(value = "evaluate3")
    public ModelAndView evaluate3(){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/evaluate3");
        List<Evaluation>evaluations=evaluationDao.hsList();
        modelAndView.addObject("list",evaluations);
        List<EvaluationStatus>evaluationStatuses=baseDao.findAll("from EvaluationStatus",EvaluationStatus.class);
        modelAndView.addObject("evaluationStatuses",evaluationStatuses);
        return modelAndView;
    }
}
