package com.springapp.mvc;

import com.springapp.entity.Admin;
import com.springapp.entity.Agent;
import com.springapp.entity.Club;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/13.
 */
@Controller
@RequestMapping(value = "")
public class LoginController extends BaseController {
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public ModelAndView login(HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/login");
        String error=request.getParameter("error");
        if(error==null)
            return modelAndView;
        if(error.equals("pwd_error"))
            error="密码错误";
        else
            error="账号不存在";
        modelAndView.addObject("error",error);
        return modelAndView;
    }
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(Admin admin,HttpSession session){
        List<Admin>adminList=adminDao.getList();
        for(Admin temp:adminList){
            if(temp.getAccount().equals(admin.getAccount())){
                if(temp.getPassword().equals(admin.getPassword())){
                    session.setAttribute("admin",temp);
                    return "redirect:/Agency";
                }
                return "redirect:/login?error=pwd_error";
            }
        }
        return "redirect:/login?error=account_error";
    }
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public ModelAndView logout(@RequestParam(value = "role")String role,HttpSession session){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/index");
        if(role.equals("admin"))
            session.removeAttribute("admin");
        else if(role.equals("agent"))
            session.removeAttribute("agent");
        else
            session.removeAttribute("club");
        return modelAndView;
    }
    @RequestMapping(value = "/clubLogin",method = RequestMethod.GET)
    public ModelAndView clubLogin(HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/clubLogin");
        String error=request.getParameter("error");
        if(error==null)
            return modelAndView;
        if(error.equals("pwd_error"))
            error="密码错误";
        else
            error="账号不存在";
        modelAndView.addObject("error",error);
        return modelAndView;
    }
    @RequestMapping(value = "/clubLogin",method = RequestMethod.POST)
    public String clubLogin(Club club,HttpSession session){
        List<Club>clubList=clubDao.getList();
        for(Club temp:clubList){
            if(temp.getAccount().equals(club.getAccount())){
                if(temp.getPassword().equals(club.getPassword())){
                    session.setAttribute("club",temp);
                    return "redirect:/Club/clubIndex";
                }
                return "redirect:/clubLogin?error=pwd_error";
            }
        }
        return "redirect:/clubLogin?error=account_error";
    }

    @RequestMapping(value = "/agentLogin",method = RequestMethod.GET)
    public ModelAndView agentLogin(HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/agentLogin");
        String error=request.getParameter("error");
        if(error==null)
            return modelAndView;
        if(error.equals("pwd_error"))
            error="密码错误";
        else
            error="账号不存在";
        modelAndView.addObject("error",error);
        return modelAndView;
    }
    @RequestMapping(value = "/agentLogin",method = RequestMethod.POST)
    public String agentLogin(Agent agent,HttpSession session){
        List<Agent>agentList=agentDao.getList();
        for(Agent temp:agentList){
            if(temp.getAgent().equals(agent.getAccount())&&temp.getRecommend().equals("禅心妈妈")){
                if(temp.getPassword().equals(agent.getPassword())){
                    session.setAttribute("agent",temp);
                    return "redirect:/Agency/joinerm";
                }
                return "redirect:/login?error=pwd_error";
            }
        }
        return "redirect:/login?error=account_error";
    }

}
