package com.springapp.mvc;

import com.springapp.entity.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;

@Controller
@RequestMapping("/")
public class MainController extends BaseController{
	@RequestMapping(method = RequestMethod.GET,value = "/index")
	public ModelAndView index() {
		ModelAndView modelAndView=new ModelAndView("Web/Upload/index");
		return modelAndView;
	}
	@RequestMapping(method = RequestMethod.GET,value = "/imgManagement")
	public ModelAndView imgManagement() {
		ModelAndView modelAndView=new ModelAndView("Web/Upload/imgManagement");
		return modelAndView;
	}
	@RequestMapping(value = "/imgManagement", method = RequestMethod.POST)
	@ResponseBody
	public String imgManagement(HttpServletRequest request,@RequestParam("file") MultipartFile file,@RequestParam("fileName") String fileName, HttpSession session) {
		String realPath = session.getServletContext().getRealPath("/WEB-INF/pages/Web/Upload/images/");
		File mainFile=new File(realPath);
		//文件保存目录URL
		String newFileName="";
		if(!mainFile.exists())
			mainFile.mkdirs();
		// 获取文件类型
		//System.out.println(file.getContentType());
		// 获取文件大小
		//System.out.println(file.getSize());
		// 获取文件名称
		//System.out.println(file.getOriginalFilename());

		// 判断文件是否存在
		if (!file.isEmpty() && file.getContentType().equals("image/jpeg")) {
			newFileName=fileName + "."+"jpg";
			String path = realPath + "/" + newFileName;
			File localFile = new File(path);
			try {
				file.transferTo(localFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			return "fail";
		}
		return newFileName;
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