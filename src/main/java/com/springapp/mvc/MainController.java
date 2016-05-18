package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class MainController {
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
}