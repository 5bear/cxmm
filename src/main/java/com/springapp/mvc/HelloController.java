package com.springapp.mvc;

import com.springapp.classes.ExcelHelp;
import com.springapp.entity.ClubQuestion;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class HelloController extends BaseController{
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView printWelcome() {
		ModelAndView modelAndView=new ModelAndView("hello");
       /* String path = "d://excel.xls";
        List<Map<String, String>> maps = ExcelHelp.analysisfile(path);
        for (Map<String, String> map : maps){
            String body = map.get("体质");
            String[] bodys = body.split("、");
            int type =0;
            int count = 1;
            for(String str:bodys){
                int t = getId(str);
                type += t*count;
                count*=10;
            }
            String content = map.get("选项");
            ClubQuestion clubQuestion = new ClubQuestion();
            clubQuestion.setQuestion(content);
            clubQuestion.setType(type);
            baseDao.save(clubQuestion);
        }*/
		modelAndView.addObject("message", "Hello world!");
		return modelAndView;
	}

	public Integer getId(String body){
	    /*
	    气虚质  1
    阳虚质  2
    阴虚质  3
    痰湿质  4
    特禀质  5
    平和质  6
    血瘀质  7
    湿热质  8
    气郁质  9
	     */
	    if(body.equals("气虚")||body.equals("气虚质"))
	        return 1;
        if(body.equals("阳虚")||body.equals("阳虚质"))
            return 2;
        if(body.equals("阴虚")||body.equals("阴虚质"))
            return 3;
        if(body.equals("痰湿")||body.equals("痰湿质"))
            return 4;
        if(body.equals("特禀")||body.equals("特禀质"))
            return 5;
        if(body.equals("平和")||body.equals("平和质"))
            return 6;
        if(body.equals("血瘀")||body.equals("血瘀质"))
            return 7;
        if(body.equals("湿热")||body.equals("湿热质"))
            return 8;
        if(body.equals("气郁")||body.equals("气郁质"))
            return 9;
        return null;
    }
}