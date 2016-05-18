package com.springapp.mvc;

import com.springapp.entity.Answer1;
import com.springapp.entity.Evaluation;
import com.springapp.form.Answer1s;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigInteger;
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
        modelAndView.addObject("Question1List", question1Dao.getList());
        return modelAndView;
    }

    @RequestMapping(value = "/Question1/Test", method = RequestMethod.POST)
    public String test1(Answer1s answersModel) {
        UUID uuid = UUID.randomUUID();
        String guid = uuid.toString().replaceAll("-", "");
        Evaluation evaluation = new Evaluation();
        evaluation.setGuid(guid);
        evaluation.setEvaluationStatus(1);
        evaluationDao.save(evaluation);
        List<Answer1> answers = answersModel.getAnswers();
        for (Answer1 answer1 : answers) {
            answer1.setEvaluationId(guid);
        }
        answer1Dao.save(answers);
        return "redirect:/Question1/Result?evaluationId=" + guid;
    }

    @RequestMapping(value = "/Question1/Result")
    public ModelAndView result(String evaluationId) throws Exception {
        List statistics = answer1Dao.getStatistics(evaluationId);
        String bodyCondition = "";
        String risk = "";
        int index = 0;
        for (Object item : statistics) {
            Object[] array = (Object[]) item;
            Integer answer = (Integer) array[0];
            BigInteger count = (BigInteger) array[1];
            String name = (String) array[2];
            if (index == 0) {
                index++;
                if (count.intValue() > 1) {
                    bodyCondition += name;
                    risk += bodyConditionToDetails.get(name);
                } else {
                    throw new Exception("遇到1+1+……的极端情况了。");
                }
            } else if (index == 1) {
                index++;
                if (count.intValue() > 1) {
                    bodyCondition += "，" + name;
                    if (!risk.equals("")) {
                        risk += "、";
                    }
                    risk += bodyConditionToDetails.get(name);
                }
            }
        }
        String details;
        if (bodyCondition.equals("平和")) {
            details = "您的体质偏向平和质，是最为平衡，健康的身体状态。\r\n坐月子是女人改变体质的黄金期，也是极易让妇科，内分泌等慢性疾病埋下隐患的敏感期，为了保持您健康状态，建议您依据体质，合理规划好产后饮食调理，选择由专家为您量身定制的食疗调理方案，降低敏感期风险，让您和宝宝更加健康！";
        } else {
            details = String.format(models, bodyCondition, risk);
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/Question1/Result");
        modelAndView.addObject("Details", details);
        modelAndView.addObject("EvaluationId", evaluationId);
        return modelAndView;
    }

    @RequestMapping(value = "/Question1/Clear")
    public String clear(String evaluationId) {
        evaluationDao.delete(Evaluation.class, evaluationId);
        return "redirect:/Question1/Test";
    }
}
