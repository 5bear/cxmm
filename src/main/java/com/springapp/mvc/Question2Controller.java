package com.springapp.mvc;

import com.springapp.entity.Answer2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "**")
public class Question2Controller extends BaseController {
    @RequestMapping(value = "/Question2/Test")
    public ModelAndView test0(String evaluationId) {
        List statistics = answer1Dao.getStatistics(evaluationId);
        String whereClause = "1=0";
        for (Object item : statistics) {
            Object[] array = (Object[]) item;
            Integer answer = (Integer) array[0];
            whereClause += " OR type = '" + answer + "'";
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/Question2/Test");
        modelAndView.addObject("Question2List", question2Dao.getList(whereClause));
        modelAndView.addObject("EvaluationId", evaluationId);
        return modelAndView;
    }

    @RequestMapping(value = "/Question2/Test", method = RequestMethod.POST)
    public String test1(@RequestParam(value = "answers") String answers, @RequestParam(value = "evaluationId") String evaluationId) {
        String[] split = answers.split(",");
        List<Answer2> answersList = new ArrayList<Answer2>();
        for (String s : split) {
            Answer2 answer2 = new Answer2();
            answer2.setQuestion2Id(Integer.parseInt(s));
            answer2.setEvaluationId(evaluationId);
            answersList.add(answer2);
        }
        answer2Dao.save(answersList);
//        try {
//            List<InputStream> pdfs = new ArrayList<InputStream>();
//            pdfs.add(new FileInputStream("C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\cxmm1\\uploadFile\\ph1.pdf"));
//            pdfs.add(new FileInputStream("C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\cxmm1\\uploadFile\\ph2.pdf"));
//            pdfs.add(new FileInputStream("C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\cxmm1\\uploadFile\\ph3.pdf"));
//            pdfs.add(new FileInputStream("C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\cxmm1\\uploadFile\\ph4.pdf"));
//            OutputStream output = new FileOutputStream("C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\cxmm1\\WEB-INF\\pages\\create\\ph.pdf");
//            MergePDF.concatPDFs(pdfs, output, true);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return "redirect:/Question2/Result?evaluationId=" + evaluationId;
    }

    @RequestMapping(value = "/Question2/Result")
    public ModelAndView result(String evaluationId) {
        List statistics = answer2Dao.getStatistics(evaluationId);
        int index = 0;
        String bodyCondition = "";
        for (Object item : statistics) {
            Object[] array = (Object[]) item;
            String name = (String) array[0];
            BigInteger count = (BigInteger) array[1];
            if (index == 0) {
                index++;
                bodyCondition += name;
            } else if (index == 1) {
                index++;
                bodyCondition += "兼" + name;
            } else {
                break;
            }
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/Question2/Result");
        modelAndView.addObject("BodyCondition", bodyCondition);
        return modelAndView;
    }

    @RequestMapping(value = "/Question2/Clear")
    public String clear(String evaluationId) {
        answer2Dao.clear(evaluationId);
        return "redirect:/Question2/Test?evaluationId=" + evaluationId;
    }
}
