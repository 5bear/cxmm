package com.springapp.mvc;

import com.springapp.classes.MessageUtil;
import com.springapp.entity.Auto;
import com.springapp.entity.LResult;
import com.springapp.entity.WxOrderinfo;
import com.springapp.entity.WxUser;
import com.springapp.helper.MergePDF;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by ZhanShaoxiong on 2016/5/22.
 */
@Controller
@RequestMapping(value = "**")
public class OrderController extends BaseController{
    @RequestMapping(value = "Order",method = RequestMethod.GET)
    public ModelAndView order(HttpServletRequest request) throws IOException {
        ModelAndView modelAndView=new ModelAndView("Web/Upload/order");
        String name=request.getParameter("name");
        String express=request.getParameter("express");
         /*分页，每页十项*/
        String pn=request.getParameter("pn");
        int pageNum=1,start=0,end=0;
        if(pn!=null&&!pn.equals(""))
            pageNum=Integer.parseInt(pn);
        start = (pageNum - 1) * 10;
        end=10;
        List<WxOrderinfo> wxOrderinfoList = orderDao.getList(name,express);
        int totalPage;
        if(wxOrderinfoList.size()%10==0)
            totalPage=wxOrderinfoList.size()/10;
        else
            totalPage=wxOrderinfoList.size()/10+1;
        request.setAttribute("name",name);
        request.setAttribute("express",express);
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("totalPage",totalPage);
        List<WxOrderinfo>myList=orderDao.getByPage(start,end,name,express);
        modelAndView.addObject("list", myList);
        return modelAndView;
    }

    @RequestMapping(value = "Order",method = RequestMethod.POST)
    public String order(WxOrderinfo wxOrderinfo){
        baseDao.update(wxOrderinfo);
        return "redirect:/Order";
    }
    @RequestMapping(value = "Order/edit",method = RequestMethod.POST)
    @ResponseBody
    public String edit(@RequestParam(value = "id")int id,@RequestParam(value = "express")String express,@RequestParam(value = "expressNum")String expressNum){
        WxOrderinfo wxOrderinfo=orderDao.get(WxOrderinfo.class,id);
        wxOrderinfo.setExpress(express);
        wxOrderinfo.setExpressNum(expressNum);
        orderDao.update(wxOrderinfo);
        return "success";
    } @RequestMapping(value = "Order/delete", method = RequestMethod.POST)
      @ResponseBody
      public String delete(@RequestParam(value = "infoList") String infoList) {
        String[] orderIds = infoList.split(",");
        for (String id : orderIds) {
            WxOrderinfo wxOrderinfo = orderDao.get(WxOrderinfo.class, Integer.parseInt(id));
            orderDao.delete(wxOrderinfo);
        }
        return "success";
    }
    private static String company="【禅心妈妈】";
    @RequestMapping(value = "Order/changeStatus", method = RequestMethod.POST)
    @ResponseBody
    public String changeStatus(HttpServletRequest request,@RequestParam(value = "infoList") String infoList, @RequestParam(value = "type") int type) throws IOException {
        String[] orderIds = infoList.split(",");
        for (String id : orderIds) {
            WxOrderinfo wxOrderinfo = orderDao.get(WxOrderinfo.class, Integer.parseInt(id));
            if (type == 0)
                wxOrderinfo.setDeliverStatus("未发货");
            else if(type==1) {
                wxOrderinfo.setDeliverStatus("已发货");
                String content=company+"您的订单"+wxOrderinfo.getOrderNum()+"已经发货。快递公司:"+wxOrderinfo.getExpress()+"快递单号:"+wxOrderinfo.getExpressNum();
                String jsonResult = MessageUtil.request(wxOrderinfo.getPhoneNum(), content);
                System.out.println(jsonResult);
            }
            else {
                wxOrderinfo.setDeliverStatus("投递成功");
                String content=company+"您的订单"+wxOrderinfo.getOrderNum()+"已经投递成功。快递公司:"+wxOrderinfo.getExpress()+"快递单号:"+wxOrderinfo.getExpressNum();
                String jsonResult = MessageUtil.request(wxOrderinfo.getPhoneNum(), content);
                System.out.println(jsonResult);
            }
            orderDao.update(wxOrderinfo);
        }
        return "success";
    }
    @RequestMapping(value = "Order/outPDF", method = RequestMethod.POST)
    @ResponseBody
    public String menuauto(@RequestParam(value = "canceNum")String canceNum,@RequestParam(value = "uid")int uid, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("/WEB-INF/pages/PDFs/");
        Auto auto=new Auto();
        auto.setMonth(canceNum);
        WxUser wxUser=userDao.get(WxUser.class,uid);
        if (wxUser.getEutocia()==1)
            auto.setType("A");
        else
            auto.setType("B");
        List<LResult>lResultList=test2Dao.getResult(wxUser.getUid());
        String ls="";
        for(int i=0;i<lResultList.size();i++){
            if(i==0)
                ls+=lResultList.get(i).getBCid().getBCid();
            else
                ls+=","+lResultList.get(i).getBCid().getBCid();
        }
        auto.setBodyCondition(ls);
        String[] Bodycondition={"这没有东西这没有东西这没有东西","qixu","yangxu","yinxu","tanshi","tebing","pinghe","xueyu","shire","qiyu"};
        String bodycondition=auto.getBodyCondition();
        String[] bc=bodycondition.split(",");
        int count=bc.length;
        SimpleDateFormat format =new SimpleDateFormat( "yyyyMMddHHmmss" );
        String d = format.format(new Date());//加时间戳生成唯一标识
        String outfilename;
        if(count==1) {
            String week1 = "month"+auto.getMonth() + '_' + auto.getType() + '_' + "week1" + '_' + Bodycondition[Integer.parseInt(bc[0])];
            String week2 = "month"+auto.getMonth() + '_' + auto.getType() + '_' + "week2" + '_' + Bodycondition[Integer.parseInt(bc[0])];
            String week3 = "month"+auto.getMonth() + '_' + auto.getType() + '_' + "week3" + '_' + Bodycondition[Integer.parseInt(bc[0])];
            String week4 = "month"+auto.getMonth() + '_' + auto.getType() + '_' + "week4" + '_' + Bodycondition[Integer.parseInt(bc[0])];
            outfilename="month"+auto.getMonth()+'_'+Bodycondition[Integer.parseInt(bc[0])]+'_'+d;
            try {
                List<InputStream> pdfs = new ArrayList<InputStream>();
                pdfs.add(new FileInputStream(realPath+"/in"+"/"+week1+".pdf"));
                pdfs.add(new FileInputStream(realPath+"/in"+"/"+week2+".pdf"));
                pdfs.add(new FileInputStream(realPath+"/in"+"/"+week3+".pdf"));
                pdfs.add(new FileInputStream(realPath+"/in"+"/"+week4+".pdf"));
                OutputStream output = new FileOutputStream(realPath+"/out"+"/"+outfilename+".pdf");//生成文件名：月次+体质类型记数+时间戳
                MergePDF.concatPDFs(pdfs, output, true);
                return outfilename+".pdf";
            } catch (Exception e) {
                e.printStackTrace();
                return "filenotfound";
            }
        }else{
            int random=(int)(1+Math.random()*3);
            outfilename="month"+auto.getMonth()+'_'+Bodycondition[Integer.parseInt(bc[0])]+"+"+Bodycondition[Integer.parseInt(bc[1])]+'_'+d;
            try {
                List<InputStream> pdfs = new ArrayList<InputStream>();
                for(int i=1;i<=random;i++)
                    pdfs.add(new FileInputStream(realPath+"/in"+"/"+"month"+auto.getMonth() + '_' + auto.getType() + '_' + "week"+i+ '_' + Bodycondition[Integer.parseInt(bc[0])]+".pdf"));
                for(int i=4;i>random;i--)
                    pdfs.add(new FileInputStream(realPath+"/in"+"/"+"month"+auto.getMonth() + '_' + auto.getType() + '_' + "week"+i+ '_' + Bodycondition[Integer.parseInt(bc[1])]+".pdf"));
                OutputStream output = new FileOutputStream(realPath+"/out"+"/"+outfilename+".pdf");//生成文件名：月次+体质类型记数+时间戳
                MergePDF.concatPDFs(pdfs, output, true);
                return outfilename+".pdf";
            } catch (Exception e) {
                e.printStackTrace();
                return "filenotfound";
            }
        }

    }

}
