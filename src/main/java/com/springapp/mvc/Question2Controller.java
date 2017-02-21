package com.springapp.mvc;

import com.springapp.classes.MessageUtil;
import com.springapp.entity.*;
import com.springapp.helper.MergePDF;
import org.apache.poi.hssf.usermodel.*;
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
import java.math.BigInteger;
import java.net.HttpCookie;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "**")
public class Question2Controller extends BaseController {
    @RequestMapping(value = "/Question2/Test")
    public ModelAndView test0(String evaluationId) {
        List statistics = answer1Dao.getStatistics(evaluationId);
        String whereClause = "1=0";
        for (Object item : statistics) {
            Object[] array = (Object[]) item;
            Integer answer = (Integer) array[0];
            whereClause += " OR type = '" + answer + "'";
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/Question2/Test");
        modelAndView.addObject("Question2List", question2Dao.getList(whereClause));
        modelAndView.addObject("EvaluationId", evaluationId);
        return modelAndView;
    }

    @RequestMapping(value = "/Question2/Test", method = RequestMethod.POST)
    public String test1(@RequestParam(value = "answers") String answers, @RequestParam(value = "evaluationId") String evaluationId) {
        String[] split = answers.split(",");
        List<Answer2> answersList = new ArrayList<Answer2>();
        for (String s : split) {
            Answer2 answer2 = new Answer2();
            answer2.setQuestion2Id(Integer.parseInt(s));
            answer2.setEvaluationId(evaluationId);
            answersList.add(answer2);
        }
        answer2Dao.save(answersList);
//        try {
//            List<InputStream> pdfs = new ArrayList<InputStream>();
//            pdfs.add(new FileInputStream("C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\cxmm1\\uploadFile\\ph1.pdf"));
//            pdfs.add(new FileInputStream("C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\cxmm1\\uploadFile\\ph2.pdf"));
//            pdfs.add(new FileInputStream("C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\cxmm1\\uploadFile\\ph3.pdf"));
//            pdfs.add(new FileInputStream("C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\cxmm1\\uploadFile\\ph4.pdf"));
//            OutputStream output = new FileOutputStream("C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\cxmm1\\WEB-INF\\pages\\create\\ph.pdf");
//            MergePDF.concatPDFs(pdfs, output, true);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return "redirect:/Question2/Result?evaluationId=" + evaluationId;
    }

    @RequestMapping(value = "/Question2/Result")
    public ModelAndView result(String evaluationId) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/Question2/Result");
        return modelAndView;
    }
    @RequestMapping(value = "/Question2/purchase")
    public ModelAndView purchase() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/Question2/Purchase");
        return modelAndView;
    }
    @RequestMapping(value = "/Question2/purchase",method = RequestMethod.POST)
    public String purchase(HsOrder hsOrder,HttpSession session) {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String guid= (String) session.getAttribute("guid");
        Evaluation evaluation = evaluationDao.getHsEvaluate(guid);
        evaluation.setEvaluationStatus(test1Dao.getEvaluationStatus(3));
        evaluationDao.update(evaluation);
        hsOrder.setGuid(guid);
        String cance="";
        if(hsOrder.getCanceNums()!=null)
            for(int i=0;i<hsOrder.getCanceNums().length;i++){
                if(i==0)
                    cance+=hsOrder.getCanceNums()[i];
                else
                    cance+=","+hsOrder.getCanceNums()[i];
            }
        String canhe="";
        if(hsOrder.getCanheNums()!=null)
            for(int i=0;i<hsOrder.getCanheNums().length;i++){
                if(i==0)
                    canhe+=hsOrder.getCanheNums()[i];
                else
                    canhe+=","+hsOrder.getCanheNums()[i];
            }
        hsOrder.setOrderNum(String.valueOf(new Date().getTime()));
        hsOrder.setDeliverStatus("未发货");
        hsOrder.setCanceNum(cance);
        hsOrder.setCanheNum(canhe);
        hsOrder.setDate(simpleDateFormat.format(new Date()));
        hsOrder.setDateTime(new Date().getTime());
        baseDao.save(hsOrder);
        return "redirect:/Question1/Test";
    }
    @RequestMapping(value = "/Question2/Result", method = RequestMethod.POST)
    public String result(@RequestParam(value = "evaluationId") String evaluationId,
                         @RequestParam(value = "name") String name,
                         @RequestParam(value = "address") String address,
                         @RequestParam(value = "phone") String phone,
                         @RequestParam(value = "suggestion",required = false) String suggestion,
                         @RequestParam(value = "ExpectingDate") String ExpectingDate,
                         @RequestParam(value = "Birthorder") String Birthorder,
                         @RequestParam(value = "height") String height,
                         @RequestParam(value = "AfterWeight") String AfterWeight,
                         @RequestParam(value = "Weight") String Weight,
                         @RequestParam(value = "eutocia") int eutocia,
                         @RequestParam(value = "feed") int feed,
                         @RequestParam(value = "age") String age,
                         @RequestParam(value = "notes",required = false) String notes) {
        Evaluation evaluation = evaluationDao.find("from Evaluation where guid=?", Evaluation.class, new Object[]{evaluationId});
        EvaluationStatus evaluationStatus=test1Dao.getEvaluationStatus(2);
        evaluation.setEvaluationStatus(evaluationStatus);
        evaluation.setName(name);
        evaluation.setAddress(address);
        evaluation.setPhone(phone);
        evaluation.setSuggestion(suggestion);
        evaluation.setNotes(notes);
        evaluation.setExpectingDate(ExpectingDate);
        evaluation.setBirthorder(Birthorder);
        evaluation.setHeight(height);
        evaluation.setAfterWeight(AfterWeight);
        evaluation.setWeight(Weight);
        evaluation.setEutocia(eutocia);
        evaluation.setFeed(feed);
        evaluation.setAge(age);
        evaluationDao.update(evaluation);
        return "redirect:/Question2/purchase";
    }

    @RequestMapping(value = "/Question2/Clear")
    public String clear(String evaluationId) {
        answer2Dao.clear(evaluationId);
        return "redirect:/Question2/Test?evaluationId=" + evaluationId;
    }
    @RequestMapping(value = "Question2/edit",method = RequestMethod.POST)
    @ResponseBody
    public String edit(@RequestParam(value = "id")int id,@RequestParam(value = "express")String express,@RequestParam(value = "expressNum")String expressNum){
        HsOrder wxOrderinfo=baseDao.get(HsOrder.class,id);
        wxOrderinfo.setExpress(express);
        wxOrderinfo.setExpressNum(expressNum);
        orderDao.update(wxOrderinfo);
        return "success";
    } @RequestMapping(value = "Question2/delete", method = RequestMethod.POST)
      @ResponseBody
      public String delete(@RequestParam(value = "infoList") String infoList) {
        String[] orderIds = infoList.split(",");
        for (String id : orderIds) {
            HsOrder wxOrderinfo = baseDao.get(HsOrder.class, Integer.parseInt(id));
            orderDao.delete(wxOrderinfo);
        }
        return "success";
    }
    @RequestMapping(value = "Question2/changeStatus", method = RequestMethod.POST)
    @ResponseBody
    public String changeStatus(HttpServletRequest request,@RequestParam(value = "infoList") String infoList, @RequestParam(value = "type") int type) throws IOException {
        String[] orderIds = infoList.split(",");
        for (String id : orderIds) {
            HsOrder wxOrderinfo = baseDao.get(HsOrder.class, Integer.parseInt(id));
            if (type == 0)
                wxOrderinfo.setDeliverStatus("未发货");
            else if(type==1) {
                wxOrderinfo.setDeliverStatus("已发货");
            }
            else {
                wxOrderinfo.setDeliverStatus("投递成功");
            }
            orderDao.update(wxOrderinfo);
        }
        return "success";
    }
    @RequestMapping(value = "Question2/outPDF", method = RequestMethod.POST)
    @ResponseBody
    public String menuauto(@RequestParam(value = "canceNum")String canceNum,@RequestParam(value = "guid")String guid, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("/WEB-INF/pages/PDFs/");
        Auto auto=new Auto();
        auto.setMonth(canceNum);
        Evaluation evaluation = evaluationDao.find("from Evaluation where guid=?", Evaluation.class, new Object[]{guid});
        if (evaluation.getEutocia()==1)
            auto.setType("A");
        else
            auto.setType("B");
        List<Map>lResultList= answer2Dao.getStatistics(guid);
        int index=0;
        String bodyCondition = "";
        for (Object item : lResultList) {
            Object[] array = (Object[]) item;
            String name = (String) array[0];
            BigInteger count = (BigInteger) array[1];
            if (index == 0) {
                index++;
                bodyCondition += count;
            } else if (index == 1) {
                index++;
                bodyCondition += "," + count;
            } else {
                break;
            }
        }
        auto.setBodyCondition(bodyCondition);
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

    @RequestMapping(value = "Question2/outExcel", method = RequestMethod.GET)
    public void outExcel3(HttpServletResponse response) throws ParseException {
        List<HsOrder> wxOrderinfoList = baseDao.findAll("from HsOrder",HsOrder.class);
        List<Map>mapList=new ArrayList<Map>();
        for(HsOrder wxOrderinfo:wxOrderinfoList){
            Map map=new HashMap();
            map.put("p1",wxOrderinfo.getOrderNum());
            map.put("p2",wxOrderinfo.getName());
            map.put("p3",wxOrderinfo.getDate());
            map.put("p4",wxOrderinfo.getCanceNum());
            map.put("p5",wxOrderinfo.getCanheNum());
            map.put("p6",wxOrderinfo.getName());
            map.put("p7",wxOrderinfo.getPhoneNum());
            map.put("p8",wxOrderinfo.getAddress());
            map.put("p9",wxOrderinfo.getExpress());
            map.put("p10",wxOrderinfo.getExpressNum());
            map.put("p11",wxOrderinfo.getDeliverStatus());
            mapList.add(map);
        }
        try{
            String[] titles = new String[]{"订单号", "昵称", "购买时间","餐册","餐盒","收货人","电话","收货地址","快递公司","快递编号","发货状态"};
            String[] keys = new String[]{"p1", "p2", "p3","p4","p5","p6","p7","p8","p9","p10","p11"};

            HSSFWorkbook wb = new HSSFWorkbook();
            // 在webbook中添加一个sheet,对应Excel文件中的sheet
            HSSFSheet sheet = wb.createSheet("sheet1");
            // 在sheet中添加表头第0行
            HSSFRow row = sheet.createRow((int) 0);
            // 创建单元格，并设置值表头 设置表头居中
            HSSFCellStyle headStyle = wb.createCellStyle();
            headStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
            headStyle.setBorderBottom((short) 1);
            headStyle.setBorderLeft((short) 1);
            headStyle.setBorderTop((short) 1);
            headStyle.setBorderRight((short) 1);

            HSSFRow firstRow = sheet.createRow((int) 0);
            HSSFCell cell;
            int i = 0;
            for (String title : titles) {
                cell = firstRow.createCell((short) i);
                cell.setCellValue(title);
                cell.setCellStyle(headStyle);
                i++;
            }
            HSSFCellStyle style = wb.createCellStyle();
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            i = 1;



            for (Map map : mapList) {
                row = sheet.createRow(i);

                row.setRowStyle(style);
                int j = 0;
                //for(int n=0;i<enrollCodeList.size();n++)
                for (String key : keys) {
                    cell = row.createCell(j);
                    cell.setCellValue(map.get(key)+"");
                    cell.setCellStyle(style);
                    j++;
                }
                i++;
            }

            response.reset();
            // 设置response的Header
            response.setHeader("pragma", "no-cache");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment; filename=" + "result" + ".xls");
            response.setContentType("application ");
            try {
                wb.write(response.getOutputStream());
                response.flushBuffer();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        catch (Exception e){
            System.out.print("exception"+e);
        }
    }
}
