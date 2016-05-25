package com.springapp.mvc;

import com.springapp.entity.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class MainController extends BaseController{
	@RequestMapping(method = RequestMethod.GET,value = "/index")
	public ModelAndView index() {
		ModelAndView modelAndView=new ModelAndView("Web/Upload/index");
		return modelAndView;
	}
	@RequestMapping(method = RequestMethod.GET,value = "/NavigationBar")
	public ModelAndView NavigationBar() {
		ModelAndView modelAndView=new ModelAndView("Web/Backstage/NavigationBar");
		return modelAndView;
	}
	@RequestMapping(method = RequestMethod.GET,value = "/clubNavi")
	public ModelAndView clubNavi() {
		ModelAndView modelAndView=new ModelAndView("Web/Backstage/clubNavi");
		return modelAndView;
	}
	@RequestMapping(value = "changePassword",method = RequestMethod.GET)
	public ModelAndView changePassword() {
		ModelAndView modelAndView = new ModelAndView("Web/Upload/bchangepassword");
		return modelAndView;
	}

	@RequestMapping(value = "changePassword",method = RequestMethod.POST)
	@ResponseBody
	public String changePassword(@RequestParam(value = "oldPwd")String oldPwd,@RequestParam(value = "newPwd")String newPwd,HttpSession session) {
		Admin admin= (Admin) session.getAttribute("admin");
		if(admin.getPassword().equals(oldPwd)) {
			admin.setPassword(newPwd);
			baseDao.update(admin);
			return "success";
		}
		return "fail";
	}

}