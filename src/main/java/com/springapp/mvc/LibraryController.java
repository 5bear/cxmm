package com.springapp.mvc;


import com.springapp.entity.*;
import com.springapp.helper.MergePDF;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by xr on 2016/5/8.
 */

@Controller
@RequestMapping(value = "**")
public class LibraryController extends BaseController{
    @RequestMapping(value = "/Upload/menu")
    public ModelAndView management() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/Upload/menu");
        List<BodyCondition> BCList=bodyconditionDao.getList();
        modelAndView.addObject("list",BCList);
        return modelAndView;
    }


    @RequestMapping(value = "/Upload/menu", method = RequestMethod.POST)
    public String menu(Menu menu, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("/WEB-INF/pages/PDFs/");
        //String[] bc={"这没有东西这没有东西这没有东西","气虚","阳虚","阴虚","痰湿","特禀","平和","血瘀","湿热","气郁"};
        String[] bodycondition={"这没有东西这没有东西这没有东西","qixu","yangxu","yinxu","tanshi","tebing","pinghe","xueyu","shire","qiyu"};
        String[] group={"这没有东西这没有东西这没有东西","A","A","B","B"};//表单数据从一开始所以0号位没有东西，这是第四遍
        int bcl1 = Integer.parseInt(menu.getBCList1());
        int bcl2 = Integer.parseInt(menu.getBCList2());
        int w1 = Integer.parseInt(menu.getWeek1());
        int w2 = Integer.parseInt(menu.getWeek2());
        int w3 = Integer.parseInt(menu.getWeek3());
        int w4 = Integer.parseInt(menu.getWeek4());
        SimpleDateFormat format =new SimpleDateFormat( "yyyyMMddHHmmss" );
        String d = format.format(new Date());//加时间戳生成唯一标识

        int m=0,n=0;
        String bc1count,bc2count;
        String outfilename;

        String week1=menu.getMonth()+'_'+group[w1]+'_'+"week1"+'_';//生成文件名，并为每种体质类型记数，source文件名：月次+ABCD组别+周次+体质类型
        if(w1==1||w1==3||w1==5||w1==7){
            week1+=bodycondition[bcl1];
            m+=1;
        }else if(w1==2||w1==4||w1==6||w1==8){
            week1+=bodycondition[bcl2];
            n+=1;
        }
        String week2=menu.getMonth()+'_'+group[w2]+'_'+"week2"+'_';
        if(w2==1||w2==3||w2==5||w2==7){
            week2+=bodycondition[bcl1];
            m+=1;
        }else if(w2==2||w2==4||w2==6||w2==8){
            week2+=bodycondition[bcl2];
            n+=1;
        }
        String week3=menu.getMonth()+'_'+group[w3]+'_'+"week3"+'_';
        if(w3==1||w3==3||w3==5||w3==7){
            week3+=bodycondition[bcl1];
            m+=1;
        }else if(w3==2||w3==4||w3==6||w3==8){
            week3+=bodycondition[bcl2];
            n+=1;
        }
        String week4=menu.getMonth()+'_'+group[w4]+'_'+"week4"+'_';
        if(w4==1||w4==3||w4==5||w4==7){
            week4+=bodycondition[bcl1];
            m+=1;
        }else if(w4==2||w4==4||w4==6||w4==8){
            week4+=bodycondition[bcl2];
            n+=1;
        }
        bc1count = String.valueOf(m);
        bc2count = String.valueOf(n);

        if(m==0){
            outfilename=menu.getMonth()+'_'+bodycondition[bcl2]+'_'+bc2count;
        }else if(n==0){
            outfilename=menu.getMonth()+'_'+bodycondition[bcl1]+'_'+bc1count;
        }else{
            outfilename=menu.getMonth()+'_'+bodycondition[bcl1]+'_'+bc1count+'_'+bodycondition[bcl2]+'_'+bc2count;
        }
        //System.out.println(outfilename);

        if(bcl1==bcl2){
            return "bcl1=bcl2";
        }else{
            try {
                List<InputStream> pdfs = new ArrayList<InputStream>();
                pdfs.add(new FileInputStream(realPath+"/in"+"/"+week1+".pdf"));
                pdfs.add(new FileInputStream(realPath+"/in"+"/"+week2+".pdf"));
                pdfs.add(new FileInputStream(realPath+"/in"+"/"+week3+".pdf"));
                pdfs.add(new FileInputStream(realPath+"/in"+"/"+week4+".pdf"));
                OutputStream output = new FileOutputStream(realPath+"/out"+"/"+outfilename+"_"+d+".pdf");//生成文件名：月次+体质类型记数+时间戳
                MergePDF.concatPDFs(pdfs, output, true);
                return "redirect:"+"../PDFs"+"/out"+"/"+outfilename+"_"+d+".pdf";
            } catch (Exception e) {
                e.printStackTrace();
                return "filenotfound";
            }
        }

    }



//    @RequestMapping(value = "", method = RequestMethod.POST)
//    public String menuauto(Auto auto, HttpSession session) {
//        String realPath = session.getServletContext().getRealPath("/WEB-INF/pages/PDFs/");
//        String bodycondition=auto.getBodyCondition();
//        String[] bc=bodycondition.split(",");
//        int count=bc.length;
//        SimpleDateFormat format =new SimpleDateFormat( "yyyyMMddHHmmss" );
//        String d = format.format(new Date());//加时间戳生成唯一标识
//        String outfilename;
//        if(count==1) {
//            String week1 = auto.getMonth() + '_' + auto.getType() + '_' + "week1" + '_' + bc[0];
//            String week2 = auto.getMonth() + '_' + auto.getType() + '_' + "week2" + '_' + bc[0];
//            String week3 = auto.getMonth() + '_' + auto.getType() + '_' + "week3" + '_' + bc[0];
//            String week4 = auto.getMonth() + '_' + auto.getType() + '_' + "week4" + '_' + bc[0];
//            outfilename=auto.getMonth()+'_'+bc[0]+'_'+d;
//            try {
//                List<InputStream> pdfs = new ArrayList<InputStream>();
//                pdfs.add(new FileInputStream(realPath+"/in"+"/"+week1+".pdf"));
//                pdfs.add(new FileInputStream(realPath+"/in"+"/"+week2+".pdf"));
//                pdfs.add(new FileInputStream(realPath+"/in"+"/"+week3+".pdf"));
//                pdfs.add(new FileInputStream(realPath+"/in"+"/"+week4+".pdf"));
//                OutputStream output = new FileOutputStream(realPath+"/out"+"/"+outfilename+"_"+d+".pdf");//生成文件名：月次+体质类型记数+时间戳
//                MergePDF.concatPDFs(pdfs, output, true);
//                return "redirect:"+"../PDFs"+"/out"+"/"+outfilename+".pdf";
//            } catch (Exception e) {
//                e.printStackTrace();
//                return "filenotfound";
//            }
//        }else{
//            int random=(int)(1+Math.random()*3);
//            outfilename=auto.getMonth()+'_'+bc[0]+"+"+bc[1]+'_'+d;
//            try {
//                List<InputStream> pdfs = new ArrayList<InputStream>();
//                for(int i=1;i<=random;i++)
//                    pdfs.add(new FileInputStream(realPath+"/in"+"/"+auto.getMonth() + '_' + auto.getType() + '_' + "week"+i+ '_' + bc[0]+".pdf"));
//                for(int i=4;i>random;i--)
//                    pdfs.add(new FileInputStream(realPath+"/in"+"/"+auto.getMonth() + '_' + auto.getType() + '_' + "week"+i+ '_' + bc[1]+".pdf"));
//                OutputStream output = new FileOutputStream(realPath+"/out"+"/"+outfilename+"_"+d+".pdf");//生成文件名：月次+体质类型记数+时间戳
//                MergePDF.concatPDFs(pdfs, output, true);
//                return "redirect:"+"../PDFs"+"/out"+"/"+outfilename+".pdf";
//            } catch (Exception e) {
//                e.printStackTrace();
//                return "filenotfound";
//            }
//        }
//    }
}