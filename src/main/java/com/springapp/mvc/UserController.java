package com.springapp.mvc;

import com.springapp.entity.WxOrderinfo;
import com.springapp.entity.WxUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/9.
 */
@Controller
@RequestMapping(value = "/WeiXin")
public class UserController extends BaseController {
    @RequestMapping(value = "/info")
    public ModelAndView info(HttpServletRequest request) throws UnsupportedEncodingException {
        ModelAndView modelAndView = new ModelAndView("WeiXin/info");
        HttpSession session = request.getSession();
        String openid = (String) session.getAttribute("openid");
        if (openid == null) {
            return new ModelAndView("redirect:" + request.getContextPath() + "/Wx/GetOpenId?returnUrl=" + URLEncoder.encode(request.getRequestURI(), "utf-8"));
        }
        WxUser wxUser = userDao.getByOpenid(openid);
        modelAndView.addObject("wxuser", wxUser);
        List<WxOrderinfo> wxOrderinfoList=orderDao.getByOpenid(openid);
        modelAndView.addObject("list",wxOrderinfoList);
        return modelAndView;
    }

    @RequestMapping(value = "/getReceipt")
    public void getReceipt(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
        String openid = (String) session.getAttribute("openid");
        if (openid == null) {
            response.sendRedirect(request.getContextPath() + "/Wx/GetOpenId?returnUrl=" + URLEncoder.encode(request.getRequestURI(), "utf-8"));
        }
        String return_code = request.getParameter("return_code");
        String return_msg = request.getParameter("return_msg");
        List<WxOrderinfo> wxOrderinfoList=orderDao.getByOpenid(openid);
        /*wxOrderinfo.setResult(return_code);
        orderDao.update(wxOrderinfo);*/
    }
}
