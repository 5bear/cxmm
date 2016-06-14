package com.springapp.mvc;

import com.springapp.classes.MD5;
import com.springapp.entity.*;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by ZhanShaoxiong on 2016/5/8.
 * 1min评测
 *逻辑: 选项对应体质类型，选项的体质个数大于等于2 /如果没有，去面诊。
 五分钟评测选题，只要一分钟评测选择了就都有。
 五分结果显示体质得分top2
 */
@Controller
@RequestMapping(value = "/Wx")
public class Test1Controller extends BaseController {


    private static final String APP_ID = "wx3ced4614cdabe878";
    private static final String APP_SECRET = "shanghaiyuechanxin20160603104666";
    private static final String DOMAIN = "cx.ecnucpp.com";
    private static final String MCH_ID = "1253261801";
    private static final int cancePrice=98;
    private static final int canhePrice=2980;
    public ModelAndView home(){
        ModelAndView modelAndView=new ModelAndView("Wx/index");
        return modelAndView;
    }
    @RequestMapping(value = "/test1")
    public ModelAndView test1(HttpServletRequest request,HttpSession session,HttpServletResponse response) throws IOException {
        ModelAndView modelAndView=new ModelAndView("Wx/test1");
        String openid = (String) session.getAttribute("openid");
        if (openid == null) {
            response.sendRedirect(request.getContextPath() + "/Wx/GetOpenId?returnUrl=" + URLEncoder.encode(request.getRequestURI(), "utf-8"));
        }
        List<Question1>question1List=question1Dao.getList();
        modelAndView.addObject("list",question1List);
        return modelAndView;
    }
    @RequestMapping(value = "/test1",method = RequestMethod.POST)
    public String test1(HttpServletRequest request,HttpSession session,HttpServletResponse response,@RequestParam(value = "q1")String q1,@RequestParam(value = "q2")String q2,@RequestParam(value = "q3")String q3,@RequestParam(value = "q4")String q4,@RequestParam(value = "q5")String q5) throws IOException {
        String openid = (String) session.getAttribute("openid");
        WxUser wxuser=userDao.getByOpenid(openid);
        if(wxuser==null) {
            wxuser = new WxUser();
            wxuser.setOpenid(openid);
            userDao.save(wxuser);
        }
        //存储选择
        String answer1 = request.getParameter("q1");
        String answer2 = request.getParameter("q2");
        String answer3 = request.getParameter("q3");
        String answer4 = request.getParameter("q4");
        String answer5 = request.getParameter("q5");
        List<String>list=new ArrayList<String>();
        list.add(answer1);
        list.add(answer2);
        list.add(answer3);
        list.add(answer4);
        list.add(answer5);
        for(int i=0;i<5;i++){
            SChoice SChoice =new SChoice();
            SChoice.setCid(Integer.parseInt(list.get(i)));
            SChoice.setTid(i+1);
            SChoice.setUid(wxuser);
            baseDao.save(SChoice);
        }
        WxEvaluation wxEvaluation=new WxEvaluation();
        wxEvaluation.setUid(wxuser);
        wxEvaluation.setTime(new Timestamp(System.currentTimeMillis()));
        wxEvaluation.setTimestamp(System.currentTimeMillis());
        wxEvaluation.setEvaluation_status(test1Dao.getEvaluationStatus(1));
        wxEvaluationDao.save(wxEvaluation);
        return "redirect:/Wx/complete";
    }
    @RequestMapping(value = "/complete")
    public ModelAndView complete(){
        ModelAndView modelAndView=new ModelAndView("Wx/complete");
        return modelAndView;
    }
    @RequestMapping(value = "/complete",method = RequestMethod.POST)
    public String complete(HttpServletRequest request,HttpSession session,HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        String openid = (String) session.getAttribute("openid");
        if (openid == null) {
            return "redirect:"+request.getContextPath() + "/Wx/GetOpenId?returnUrl=" + URLEncoder.encode(request.getRequestURI());
        }
         /*存储用户信息*/
        String Age = request.getParameter("Age");
        if(Age==null)
            Age=" ";
        String ExpectingDate = request.getParameter("ExpectingDate");
        if(ExpectingDate==null)
            ExpectingDate=" ";
       /* String PregnancyWeek = request.getParameter("PregnancyWeek");*/
        String Birthorder = request.getParameter("Birthorder");
        if(Birthorder==null)
            Birthorder=" ";
        String Height = request.getParameter("Height");
        if(Height==null)
            Height=" ";
        String AfterWeight = request.getParameter("AfterWeight");
        if(AfterWeight==null)
            AfterWeight=" ";
        String Weight = request.getParameter("Weight");
        if(Weight==null)
            Weight=" ";
        String eutocia = request.getParameter("eutocia");
        if(eutocia==null)
            eutocia=" ";
        String feed = request.getParameter("feed");
        if(feed==null)
            feed=" ";
        String phone = request.getParameter("phone");
        if(phone==null)
            phone=" ";
        WxUser wxuser=userDao.getByOpenid(openid);
        if(wxuser==null) {
            wxuser = new WxUser();
            wxuser.setOpenid(openid);
            wxuser.setDateOfLogin(sdf.format(new Date()));
            wxuser.setAge(Age);
            wxuser.setExpectingDate(ExpectingDate);
         /*   wxuser.setPregnancyWeek(Integer.parseInt(PregnancyWeek));*/
            wxuser.setBirthorder(Birthorder);
            wxuser.setHeight(Height);
            wxuser.setAfterWeight(AfterWeight);
            wxuser.setWeight(Weight);
            wxuser.setPhone(phone);
            if(eutocia!=null)
                wxuser.setEutocia(Integer.parseInt(eutocia));
            if(feed!=null)
                wxuser.setFeed(Integer.parseInt(feed));
            baseDao.save(wxuser);
        }
        wxuser.setDateOfLogin(sdf.format(new Date()));
        wxuser.setAge(Age);
        wxuser.setExpectingDate(ExpectingDate);
       /* wxuser.setPregnancyWeek(Integer.parseInt(PregnancyWeek));*/
        wxuser.setBirthorder(Birthorder);
        wxuser.setHeight(Height);
        wxuser.setAfterWeight(AfterWeight);
        wxuser.setWeight(Weight);
        wxuser.setPhone(phone);
        if(eutocia!=null)
            wxuser.setEutocia(Integer.parseInt(eutocia));
        if(feed!=null)
            wxuser.setFeed(Integer.parseInt(feed));
        baseDao.update(wxuser);
        WxEvaluation wxEvaluation=wxEvaluationDao.get(openid);
        wxEvaluation.setEvaluation_status(test1Dao.getEvaluationStatus(2));
        wxEvaluation.setName(wxuser.getNickname());
        wxEvaluationDao.update(wxEvaluation);
        return "redirect:/Wx/result";
    }

    @RequestMapping(value = "/result")
    public ModelAndView result(HttpSession session,HttpServletResponse response,HttpServletRequest request) throws IOException {
        ModelAndView modelAndView=new ModelAndView("Wx/result");
        String openid = (String) session.getAttribute("openid");
        if (openid == null) {
            response.sendRedirect(request.getContextPath() + "/Wx/GetOpenId?returnUrl=" + URLEncoder.encode(request.getRequestURI(), "utf-8"));
        }
        WxUser wxuser=userDao.getByOpenid(openid);
        if(wxuser==null) {
            wxuser = new WxUser();
            wxuser.setOpenid(openid);
            userDao.save(wxuser);
        }
        //取uid
        int uid=wxuser.getUid();
        List<Map> result=new ArrayList<Map>();
        String resultBodyCondition="";
        String resultTendency="";
        result=test1Dao.getStatistics(uid);//降序得到1分钟评测的体质结果，未筛选出得分>=2的
        {
            //result 只显示前两项
            WxUser wxUser=new WxUser();
            wxUser=test1Dao.getUser(uid);

           /* List<Object> resultTemp=new ArrayList<Object>();//用来存放得分大于2的体质结果
            for (Object item : result)
            {
                Object[] array = (Object[]) item;
                Integer countNum = Integer.parseInt(array[3].toString());
                if(countNum>=2)
                    resultTemp.add(resultTemp.size(),item);
            }
            //若resultTemp仍为空，则说明是1+1+1+1+1的情况;否则resultTemp才是真正应该显示出来起来的结果
            if(resultTemp.size()!=0)
                result = resultTemp;*/
            //result为最终结果
            int count=0;
            for(Map map:result){
                if(Integer.parseInt(map.get("countNum").toString())>=2) {
                    if (count == 0) {
                        resultBodyCondition += map.get("name");
                    } else {
                        resultBodyCondition += "," + map.get("name");
                    }
                    if(count==0){
                        resultTendency+=map.get("tendency");
                    }else{
                        resultTendency+=","+map.get("tendency");
                    }
                    count++;
                }
            }
            WxEvaluation wxEvaluation=wxEvaluationDao.get(openid);
            wxEvaluation.setUid(wxUser);
            wxEvaluationDao.update(wxEvaluation);
        }

        List<BodyCondition>bodyConditions=bodyconditionDao.getList();
        String show="";
        if(resultBodyCondition.equals(""))
            show="您的体质比较复杂，请完成五分钟评测";
        else
            show=resultBodyCondition+";有偏向"+resultTendency+"的趋势";
        modelAndView.addObject("show",show);
        request.setAttribute("bodyConditions",bodyConditions);
        request.setAttribute("result", result);
        request.setAttribute("uid", openid);
        return modelAndView;
    }
    @RequestMapping(value = "/test",method = RequestMethod.GET)
    public ModelAndView test(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
        ModelAndView modelAndView=new ModelAndView("Wx/test");
        String openid = (String) session.getAttribute("openid");
        if (openid == null) {
            response.sendRedirect(request.getContextPath() + "/Wx/GetOpenId?returnUrl=" + URLEncoder.encode(request.getRequestURI(), "utf-8"));
        }
        WxUser wxUser=userDao.getByOpenid(openid);
        modelAndView.addObject("wxUser",wxUser);
        WxEvaluation wxEvaluation=wxEvaluationDao.get(openid);
        if (wxEvaluation!=null) {
            if(wxEvaluation.getEvaluation_status().getId()==1)
                return new ModelAndView("redirect:/Wx/complete");
            else if(wxEvaluation.getEvaluation_status().getId()==2)
                return new ModelAndView("redirect:/Wx/menu");
            else if(wxEvaluation.getEvaluation_status().getId()==3)
                return new ModelAndView("redirect:/Wx/test5");
            else
                return new ModelAndView("redirect:/Wx/contact");
        }
        return  modelAndView;
    }
    @RequestMapping(value = "/menu",method = RequestMethod.GET)
    public ModelAndView menu(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
        ModelAndView modelAndView=new ModelAndView("Wx/menu");
        String openid = (String) session.getAttribute("openid");
        if (openid == null) {
            response.sendRedirect(request.getContextPath() + "/Wx/GetOpenId?returnUrl=" + URLEncoder.encode(request.getRequestURI(), "utf-8"));
        }
        return  modelAndView;
    }
    @RequestMapping(value = "/purchase")
    public ModelAndView purchase(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException, NoSuchAlgorithmException {
        ModelAndView modelAndView=new ModelAndView("Wx/purchase");
        String openid = (String) session.getAttribute("openid");
        if (openid == null) {
            response.sendRedirect(request.getContextPath() + "/Wx/GetOpenId?returnUrl=" + URLEncoder.encode(request.getRequestURI(), "utf-8"));
        }
        return modelAndView;
    }
    @RequestMapping(value = "/ensure",method = RequestMethod.POST)
    @ResponseBody
    public String ensure(HttpServletRequest request,HttpServletResponse response,HttpSession session,@RequestParam(value = "canheNum")int canheNum,@RequestParam(value = "canceNum")int canceNum) throws IOException, NoSuchAlgorithmException {
        int price=canceNum*cancePrice+canheNum*canhePrice;
        String openid = (String) session.getAttribute("openid");
        System.out.print("openid"+openid);
        if (openid == null) {
            response.sendRedirect(request.getContextPath() + "/Wx/GetOpenId?returnUrl=" + URLEncoder.encode(request.getRequestURI(), "utf-8"));
        }
        //测试用
        if(openid.equals("oU4jhwKx8rklU3cWvXY5Hry97xFc"))
            price=1;
        String body="chanxingouwu";
        Long timeStr=System.currentTimeMillis();
        String nonce_str=timeStr.toString();
        session.setAttribute("order",timeStr.toString());
        session.setAttribute("price",price*100);
        String result=payJSAPI(nonce_str, body, timeStr.toString(), price*100, getRemortIP(request), openid);
        System.out.print(result);
        String prepay_id=parse(result);
        System.out.print(prepay_id);
        String p="prepay_id="+prepay_id;
        String signJS=signJS(nonce_str,prepay_id,timeStr/1000L);
        Map map=new HashMap();
        Long timeStamp=timeStr/1000L;
        map.put("appId",APP_ID);
        map.put("timeStamp",timeStamp.toString());
        map.put("nonce_str",nonce_str);
        map.put("package",p);
        map.put("paySign",signJS);
        return JSONObject.fromObject(map).toString();
    }
    @RequestMapping(value = "/purchase",method = RequestMethod.POST)
    public ModelAndView purchase(WxOrderinfo order,HttpSession session,HttpServletRequest request) throws IOException, NoSuchAlgorithmException {
        String openid = (String) session.getAttribute("openid");
        WxUser wxuser=userDao.getByOpenid(openid);
        if(wxuser==null) {
            wxuser = new WxUser();
            wxuser.setOpenid(openid);
            userDao.save(wxuser);
        }
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String cance="";
        if(order.getCanceNums()!=null)
        for(int i=0;i<order.getCanceNums().length;i++){
            if(i==0)
                cance+=order.getCanceNums()[i];
            else
                cance+=","+order.getCanceNums()[i];
        }
        String canhe="";
        if(order.getCanheNums()!=null)
        for(int i=0;i<order.getCanheNums().length;i++){
            if(i==0)
                canhe+=order.getCanheNums()[i];
            else
                canhe+=","+order.getCanheNums()[i];
        }
        String orderNum= (String) session.getAttribute("order");
        order.setDeliverStatus("未发货");
        order.setCanceNum(cance);
        order.setCanheNum(canhe);
        order.setDate(simpleDateFormat.format(new Date()));
        order.setDateTime(System.currentTimeMillis());
        order.setResult("success");
        order.setUid(wxuser);
        order.setOrderNum(orderNum);
        orderDao.save(order);
        WxEvaluation wxEvaluation=wxEvaluationDao.get(openid);
        if(wxEvaluation.getEvaluation_status().getId()==4)
            return new ModelAndView("redirect:/Wx/index");
        wxEvaluation.setEvaluation_status(test1Dao.getEvaluationStatus(3));
        wxEvaluationDao.update(wxEvaluation);
        return new ModelAndView("redirect:/Wx/test5");
    }
    /*
    * 确认收货*/

    @RequestMapping(value = "/confirmReceived",method = RequestMethod.POST)
     public  String confirmReceived(int id){
        WxOrderinfo wxOrderinfo=orderDao.get(WxOrderinfo.class,id);
        wxOrderinfo.setDeliverStatus("已收货");
        orderDao.update(wxOrderinfo);
        return "success";
    }
/*xml解析*/
    public String parse(String protocolXML) {

        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory
                    .newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder
                    .parse(new InputSource(new StringReader(protocolXML)));

            Element root = doc.getDocumentElement();
            NodeList books = root.getChildNodes();
            String prepay_id;
            if (books != null) {
                for (int i = 0; i < books.getLength(); i++) {
                    Node book = books.item(i);
                    if(book.getNodeName().equals("prepay_id")) {
                        prepay_id =  book.getFirstChild().getNodeValue();
                        return prepay_id;
                    }
                }
            }
            return  "";
        } catch (Exception e) {
            e.printStackTrace();
            return e.toString();
        }
    }


    public String payJSAPI(String nonce_str,String body,String out_trade_no,int total_fee,String spbill_create_ip,String openid) throws NoSuchAlgorithmException, IOException {
        StringBuilder urlBuilder = new StringBuilder();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
        long currentTime = System.currentTimeMillis() ;
        currentTime +=15*60*1000;
        Date now = new Date(currentTime);
        Date date=new Date(currentTime);
        String signStr = sign(nonce_str,body,out_trade_no,total_fee,spbill_create_ip,openid,now,date);
        urlBuilder.append("<xml>");
        urlBuilder.append("<appid>" + APP_ID + "</appid>");
        urlBuilder.append("<mch_id>").append(MCH_ID).append("</mch_id>");
        urlBuilder.append("<nonce_str>").append(nonce_str).append("</nonce_str>");
        urlBuilder.append("<sign>").append(signStr).append("</sign>");
        urlBuilder.append("<body>").append(body).append("</body>");
        urlBuilder.append("<out_trade_no>").append(out_trade_no).append("</out_trade_no>");
        urlBuilder.append("<total_fee>").append(total_fee).append("</total_fee>");
        urlBuilder.append("<spbill_create_ip>").append(spbill_create_ip).append("</spbill_create_ip>");
        urlBuilder.append("<time_start>").append(df.format(now)).append("</time_start>");
        urlBuilder.append("<time_expire>").append(df.format(date)).append("</time_expire>");
        urlBuilder.append("<notify_url>").append("http://localhost:8080/Wx/index").append("</notify_url>");
        urlBuilder.append("<trade_type>").append("JSAPI").append("</trade_type>");
        urlBuilder.append("<openid>").append(openid).append("</openid>");
        urlBuilder.append("</xml>");
        String param = urlBuilder.toString();
        return urlConnect(param, "https://api.mch.weixin.qq.com/pay/unifiedorder?");
    }
    public String sign(String nonce_str,String body,String out_trade_no,int total_fee,String spbill_create_ip,String openid,Date now,Date date) throws NoSuchAlgorithmException {
        StringBuilder urlBuilder = new StringBuilder();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
        urlBuilder.append("appid=" + APP_ID);
        urlBuilder.append("&body=").append(body);
        urlBuilder.append("&mch_id=").append(MCH_ID);
        //urlBuilder.append("&device_info=").append( );
        urlBuilder.append("&nonce_str=").append(nonce_str);
        urlBuilder.append("&notify_url=").append("http://localhost:8080/Wx/index");
        urlBuilder.append("&openid=").append(openid);
        urlBuilder.append("&out_trade_no=").append(out_trade_no);
       // urlBuilder.append("&sign=").append(nonce_str);
        urlBuilder.append("&spbill_create_ip=").append(spbill_create_ip);
        urlBuilder.append("&time_expire=").append(df.format(date));
        urlBuilder.append("&time_start=").append(df.format(now));
        urlBuilder.append("&total_fee=").append(total_fee);
        urlBuilder.append("&trade_type=").append("JSAPI");
        urlBuilder.append("&key=").append(APP_SECRET);
        String signStr = urlBuilder.toString();
        signStr = MD5.MD5Encode(signStr).toUpperCase();
        return signStr;
    }
    /*js签名*/
    public String signJS(String nonce_str,String prepay_id,Long timeStamp) throws NoSuchAlgorithmException {
        StringBuilder urlBuilder = new StringBuilder();
        urlBuilder.append("appId=" + APP_ID);
        urlBuilder.append("&nonceStr=").append(nonce_str);
        urlBuilder.append("&package=").append("prepay_id="+prepay_id);
        urlBuilder.append("&signType=").append("MD5");
        urlBuilder.append("&timeStamp=").append(timeStamp.toString());
        urlBuilder.append("&key=").append(APP_SECRET);
        String signStr = urlBuilder.toString();
        signStr = MD5.MD5Encode(signStr).toUpperCase();
        return signStr;
    }
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
    public String getRemortIP(HttpServletRequest request) {
        if (request.getHeader("x-forwarded-for") == null) {
            return request.getRemoteAddr();
        }
        return request.getHeader("x-forwarded-for");
    }

    @RequestMapping(value = "/biocode")
    public ModelAndView biocode(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
        ModelAndView modelAndView=new ModelAndView("Wx/biocode");
        String openid = (String) session.getAttribute("openid");
        if (openid == null) {
            response.sendRedirect(request.getContextPath() + "/Wx/GetOpenId?returnUrl=" + URLEncoder.encode(request.getRequestURI(), "utf-8"));
        }
        return modelAndView;
    }
    @RequestMapping(value = "/index")
    public ModelAndView index(HttpSession session) throws NoSuchAlgorithmException {
        ModelAndView modelAndView=new ModelAndView("Wx/index");
        return modelAndView;
    }
    @RequestMapping(value = "/contact")
    public ModelAndView contact(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
        ModelAndView modelAndView=new ModelAndView("Wx/contact");
        String openid = (String) session.getAttribute("openid");
        if (openid == null) {
            response.sendRedirect(request.getContextPath() + "/Wx/GetOpenId?returnUrl=" + URLEncoder.encode(request.getRequestURI(), "utf-8"));
        }
        WxUser wxUser=userDao.getByOpenid(openid);
        modelAndView.addObject("wxUser",wxUser);
        return modelAndView;
    }
    @RequestMapping(value = "/activity")
    public ModelAndView activity(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
        ModelAndView modelAndView=new ModelAndView("Wx/news");
       List<Activity>activityList=activityDao.getList();
        modelAndView.addObject("list",activityList);
        return modelAndView;
    }
    @RequestMapping(value = "/share")
    public ModelAndView share(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
        ModelAndView modelAndView=new ModelAndView("Wx/share");
        List<Activity>activityList=activityDao.getShareList();
        modelAndView.addObject("list",activityList);
        return modelAndView;
    }
    @RequestMapping(value = "/detail")
    public ModelAndView showActivity(@RequestParam(value = "id")int id) throws IOException {
        ModelAndView modelAndView=new ModelAndView("Wx/detail");
        Activity activity=activityDao.get(Activity.class,id);
        modelAndView.addObject("activity",activity);
        return modelAndView;
    }
}
