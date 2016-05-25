package com.springapp.mvc;

import com.springapp.entity.Club;
import com.springapp.entity.Evaluation;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

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
        end=start+10;
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
    @RequestMapping(value = "pointRecord",method = RequestMethod.GET)
      public ModelAndView pointRecord(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("Web/Upload/pointrecord");
        Club club= (Club) session.getAttribute("club");
        List<Evaluation>evaluations=evaluationDao.getListByClub(club.getId());
        modelAndView.addObject("list",evaluations);
        return modelAndView;
    }

    @RequestMapping(value = "changePassword",method = RequestMethod.GET)
    public ModelAndView changePassword() {
        ModelAndView modelAndView = new ModelAndView("Web/Upload/changePassword");
        return modelAndView;
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
}
