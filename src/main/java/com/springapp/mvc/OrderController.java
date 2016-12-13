package com.springapp.mvc;

import com.springapp.classes.MessageUtil;
import com.springapp.classes.WxHelp;
import com.springapp.entity.*;
import com.springapp.helper.MergePDF;
import net.sf.json.JSONObject;
import org.apache.poi.hssf.usermodel.*;
import org.dom4j.DocumentHelper;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by ZhanShaoxiong on 2016/5/22.
 */
@Controller
@RequestMapping(value = "**")
public class OrderController extends BaseController{
    private static final String APP_ID = "wx3ced4614cdabe878";
    private static final String APP_SECRET = "shanghaiyuechanxin20160603104666";
    private static final String DOMAIN = "cx.ecnucpp.com";
    private static final String MCH_ID = "1253261801";
    public String urlConnect(String param, String url) {
        // 使用POST方式向目的服务器发送请求
        URL connect;
        StringBuffer data = new StringBuffer();
        try {
            connect = new URL(url);
            System.out.println(connect);
            HttpURLConnection connection = (HttpURLConnection) connect.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);

            OutputStreamWriter paramout = new OutputStreamWriter(
                    connection.getOutputStream(), "UTF-8");

            paramout.write(param);
            paramout.flush();

            BufferedReader reader = new BufferedReader(new InputStreamReader(
                    connection.getInputStream(), "UTF-8"));
            String line;
            while ((line = reader.readLine()) != null) {
                data.append(line);
            }

            paramout.close();
            reader.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String result = data.toString();
        return result;
    }

    /**
     * 检查所有未完成订单的状态
     */
    public void checkWxOrder(){
        List<WxOrderinfo> orderinfos = orderDao.findAll("from WxOrderinfo where result='fail'",WxOrderinfo.class);
        for(WxOrderinfo wxOrderinfo:orderinfos) {
            String url = "https://api.mch.weixin.qq.com/pay/orderquery?";
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("appid", APP_ID);
            params.put("mch_id", MCH_ID);
            String out_trade_no = wxOrderinfo.getOrderNum();
            Long timeMillis = System.currentTimeMillis();
            String nonce_str = timeMillis.toString();
            params.put("nonce_str", nonce_str);
            params.put("out_trade_no",out_trade_no);
            String sign = WxHelp.Sign(params);
            params.put("sign",sign);
            String xmlString = WxHelp.toXML(params);
            String result = urlConnect(xmlString,url);
            org.dom4j.Document document = null;
            try {
                document = DocumentHelper.parseText(result);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (null == document) {
                //this.print(response, "");
                return ;
            }
            org.dom4j.Element root = document.getRootElement();
            String return_code = root.elementText("return_code");
            String result_code = root.elementText("result_code");
            if(return_code.equals("SUCCESS")&&result_code.equals("SUCCESS")){
                String trade_state = root.elementText("trade_state");
                if(trade_state.equals("SUCCESS")){
                    System.out.println(wxOrderinfo.getOrderNum());
                    wxOrderinfo.setResult("success");
                    orderDao.update(wxOrderinfo);
                    WxEvaluation wxEvaluation = wxEvaluationDao.get(wxOrderinfo.getUid().getOpenid());
                    if(wxEvaluation.getEvaluation_status().getId()<3) {
                        EvaluationStatus evaluationStatus = test1Dao.getEvaluationStatus(3);
                        wxEvaluation.setEvaluation_status(evaluationStatus);
                        wxEvaluationDao.update(wxEvaluation);
                    }
                }else{
                    wxOrderinfo.setResult(trade_state.toLowerCase());
                    orderDao.update(wxOrderinfo);
                }
            }
        }
    }
    @RequestMapping(value = "Order",method = RequestMethod.GET)
    public ModelAndView order(HttpServletRequest request) throws IOException {
        ModelAndView modelAndView=new ModelAndView("Web/Upload/order");
        //检测失效订单状态
        checkWxOrder();
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
                String content=company+"亲爱的妈妈，订单已发货，快递单号在我的订单中可查询。如有疑问，请电询400-6822257";
                String jsonResult = MessageUtil.request(wxOrderinfo.getPhoneNum(), content);
                System.out.println(jsonResult);
            }
            else {
                wxOrderinfo.setDeliverStatus("投递成功");
               /* String content=company+"您的订单"+wxOrderinfo.getOrderNum()+"已经投递成功。快递公司:"+wxOrderinfo.getExpress()+"快递单号:"+wxOrderinfo.getExpressNum();
                String jsonResult = MessageUtil.request(wxOrderinfo.getPhoneNum(), content);
                System.out.println(jsonResult);*/
            }
            orderDao.update(wxOrderinfo);
        }
        return "success";
    }
    @RequestMapping(value = "Order/outExcel", method = RequestMethod.GET)
    public void outExcel3(HttpServletResponse response) throws ParseException {
        List<WxOrderinfo> wxOrderinfoList = orderDao.getList();
        List<Map>mapList=new ArrayList<Map>();
        for(WxOrderinfo wxOrderinfo:wxOrderinfoList){
            Map map=new HashMap();
            map.put("p1",wxOrderinfo.getOrderNum());
            map.put("p2",wxOrderinfo.getUid().getNickname());
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
