package com.springapp.mvc;


import com.springapp.entity.Train;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.text.ParseException;
import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/10.
 */
@Controller
@RequestMapping(value = "/Train")
public class TrainController extends BaseController{
    @RequestMapping()
    public ModelAndView training(){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/training");
        List<Train> trainList=trainDao.getList();
        modelAndView.addObject("trainList",trainList);
        return modelAndView;
    }
    @RequestMapping(value = "/certi")
    public ModelAndView certi(HttpServletRequest request) throws ParseException {
        ModelAndView modelAndView=new ModelAndView("Web/Upload/certi");
        String name=request.getParameter("name");
        request.setAttribute("name",name);
        String fromDatetime=request.getParameter("fromDatetime");
        request.setAttribute("fromDatetime",fromDatetime);
        String toDatetime=request.getParameter("toDatetime");
        request.setAttribute("toDatetime",toDatetime);
        String status=request.getParameter("status");
        request.setAttribute("status",status);
        /*分页，每页十项*/
        String pn=request.getParameter("pn");
        int pageNum=1,start=0,end=0;
        if(pn!=null&&!pn.equals(""))
            pageNum=Integer.parseInt(pn);
        start = (pageNum - 1) * 10;
        end=10;
        List<Train> trainList = trainDao.getList(name, fromDatetime, toDatetime, status);
        int totalPage;
        if(trainList.size()%10==0)
            totalPage=trainList.size()/10;
        else
            totalPage=trainList.size()/10+1;
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("totalPage",totalPage);
        List<Train>myList=trainDao.getListByPage(start, end, name, fromDatetime, toDatetime, status);
        modelAndView.addObject("list", myList);
        return modelAndView;
    }
    @RequestMapping(value = "/sign")
    public ModelAndView sign(){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/sign");
        List<Train> trainList=trainDao.getList();
        modelAndView.addObject("trainList",trainList);
        return modelAndView;
    }
    @RequestMapping(value = "/license")
    public ModelAndView license(){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/license");
        List<Train> trainList=trainDao.getList();
        modelAndView.addObject("trainList",trainList);
        return modelAndView;
    }
    @RequestMapping(value = "/certinfo")
    public ModelAndView certinfo(HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/certinfo");
        String id=request.getParameter("id");
        if(id!=null&&!id.equals("")){
            Train train=baseDao.get(Train.class,Long.parseLong(id));
            modelAndView.addObject("train",train);
        }
        return modelAndView;
    }
    @RequestMapping(value = "/sign",method = RequestMethod.POST)
    public String sign(Train train){
        try {
            train.setStatus("已报名");
            train.setTimestamp(System.currentTimeMillis());
            trainDao.save(train);
        }catch (Exception e){
            return "redirect:sign";
        }
        return "redirect:sign";
    }
    @RequestMapping(value = "/changeStatus",method = RequestMethod.POST)
    @ResponseBody
    public String changeStatus(@RequestParam(value = "infoList") String infoList,@RequestParam(value = "status") String status){
        String[]trains=infoList.split(",");
        for(String id:trains){
            Train train=trainDao.get(Train.class, Long.parseLong(id));
            train.setStatus(status);
            agentDao.update(train);
        }
        return "success";
    }
    @RequestMapping(value = "/addCertiInfo",method = RequestMethod.POST)
    @ResponseBody
    public String addCertiInfo(@RequestParam(value = "id") Long id,@RequestParam(value = "sex") String sex, @RequestParam(value = "trainTime") String trainTime,
                               @RequestParam(value = "licenseTime") String licenseTime,@RequestParam(value = "licenseNum") String licenseNum) throws ParseException {
        Train train=trainDao.get(Train.class,id);
        train.setSex(sex);
        try {
            train.setTrainTime(new Date(sdf1.parse(trainTime).getTime()));
        }catch (Exception e){
            train.setTrainTime(new Date(sdf.parse(trainTime).getTime()));
        }
        try {
            train.setLicenseTime(new Date(sdf1.parse(licenseTime).getTime()));
        }catch (Exception e){
            train.setLicenseTime(new Date(sdf.parse(licenseTime).getTime()));
        }
        train.setLicenseNum(licenseNum);
        trainDao.update(train);
        return "success";
    }
    @RequestMapping(value = "/getCerti",method = RequestMethod.POST)
    @ResponseBody
    public String getCerti(@RequestParam(value = "name") String name) throws ParseException {
        Train train=trainDao.getTrain(name);
        if (train==null)
            return "NotFound";
        if(!train.getStatus().equals("已发证"))
            return "fail";
        return train.getId().toString();
    }
}
