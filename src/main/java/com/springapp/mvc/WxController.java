package com.springapp.mvc;

import com.springapp.entity.Agent;
import com.springapp.helper.SHA1;
import net.sf.json.JSONObject;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "**")
public class WxController extends BaseController {

    @RequestMapping(value = "/Wx/Apply")
    public ModelAndView apply(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        String openid = (String) session.getAttribute("openid");
        if (openid == null) {
            response.sendRedirect(request.getContextPath() + "/Wx/GetOpenId?returnUrl=" + URLEncoder.encode(request.getRequestURI(), "utf-8"));
        }
        Agent isAgent = agentDao.isAgent(openid);
        if (isAgent != null) {
            if (isAgent.getStatus().equals("可用")) {
                //返回二维码
            } else if (isAgent.getStatus().equals("正在审核")) {
                //正在审核
            } else if (isAgent.getStatus().equals("失效")) {
                //失效
            } else {
                throw new Exception("这个状态是不可能的。");
            }
        }
        ModelAndView modelAndView = new ModelAndView("WeiXin/apply");
        return modelAndView;
    }

    @RequestMapping(value = "/Wx/Apply", method = RequestMethod.POST)
    public String applyPost(Agent agent, HttpSession session) throws Exception {
        String openid = (String) session.getAttribute("openid");
        if (openid == null) {
            throw new Exception("异常的提交。");
        }
        agent.setOpenid(openid);
        agent.setStatus("正在审核");
        agentDao.save(agent);
        String url = getQC(agent.getId().toString());
        FileWriter fileWriter = new FileWriter("C:\\Users\\Administrator\\Desktop\\Result.txt", true);
        fileWriter.write(url);
        fileWriter.flush();
        fileWriter.close();
        return "redirect:/Wx/Apply";
    }

    @RequestMapping(value = "/Wx/GetOpenId")
    public void getOpenId(HttpServletRequest request, HttpServletResponse response, String returnUrl) throws IOException {
        String code = request.getParameter("code");
        HttpSession session = request.getSession();
        boolean isValidCode = true;
        String serviceUrl = URLEncoder.encode(
                "http://" + DOMAIN + request.getContextPath() + "/Wx/GetOpenId" + "?returnUrl=" + returnUrl, "utf-8");
        //检查是否已验证或者验证是否通过
        if (code == null || code.equals("authdeny")) {
            isValidCode = false;
        }
        //如果session未空或者取消授权，重定向到授权页面
        if ((!isValidCode) && session.getAttribute("openid") == null) {
            StringBuilder oauth_url = new StringBuilder();
            oauth_url.append("https://open.weixin.qq.com/connect/oauth2/authorize?");
            oauth_url.append("appid=").append(APP_ID);
            oauth_url.append("&redirect_uri=").append(serviceUrl);
            oauth_url.append("&response_type=code");
            oauth_url.append("&scope=snsapi_userinfo");
            oauth_url.append("&state=1#wechat_redirect");
            //return "redirect:" + oauth_url;
            response.sendRedirect(oauth_url.toString());
        }
        //如果用户同意授权并且，用户session不存在，通过OAUTH接口调用获取用户信息
        if (isValidCode && session.getAttribute("openid") == null) {
            JSONObject obj = getAccessToken(APP_ID, APP_SECRET, code);
            //String token = obj.getString("access_token");
            String openid = obj.getString("openid");
            //JSONObject user = WxOAuthAPI.getUserInfo(token, openid);
            session.setAttribute("openid", openid);
            //return "redirect:https://www.baidu.com/s?wd=" + openid;
            response.sendRedirect(returnUrl);
        }
        print(response, "授权失败");
        //return "redirect:http://www.bing.com/";
    }

    private static final String APP_ID = "wxde1edf21c395f90f";
    private static final String APP_SECRET = "27842e02309c727301349ccbead46c07";
    private static final String DOMAIN = "cx.ecnucpp.com";
    private static final String MCH_ID = "1336372301";

    private static String getJSONString(String url) throws IOException {
        URL getUrl = new URL(url);
        HttpURLConnection connection = (HttpURLConnection) getUrl.openConnection();
        connection.connect();
        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
        StringBuilder jsonBuilder = new StringBuilder();
        String lines;
        while ((lines = reader.readLine()) != null) {
            jsonBuilder.append(lines);
        }
        reader.close();
        connection.disconnect();
        return jsonBuilder.toString();
    }

    private static String sendPost(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！" + e);
            e.printStackTrace();
        }
        //使用finally块来关闭输出流、输入流
        finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    private static String postJSONString(String pathUrl, String requestString) {
        try {
            //建立连接
            URL url = new URL(pathUrl);
            HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();

            //设置连接属性
            httpConn.setDoOutput(true);// 使用 URL 连接进行输出
            httpConn.setDoInput(true);// 使用 URL 连接进行输入
            httpConn.setUseCaches(false);// 忽略缓存
            httpConn.setRequestMethod("POST");// 设置URL请求方法
            // 设置请求属性
            // 获得数据字节数据，请求数据流的编码，必须和下面服务器端处理请求流的编码一致
            byte[] requestStringBytes = requestString.getBytes("utf-8");
            httpConn.setRequestProperty("Content-length", "" + requestStringBytes.length);
            httpConn.setRequestProperty("Content-Type", "application/octet-stream");
            httpConn.setRequestProperty("Connection", "Keep-Alive");// 维持长连接
            httpConn.setRequestProperty("Charset", "UTF-8");

            // 建立输出流，并写入数据
            OutputStream outputStream = httpConn.getOutputStream();
            outputStream.write(requestStringBytes);
            outputStream.close();
            // 获得响应状态
            int responseCode = httpConn.getResponseCode();

            if (HttpURLConnection.HTTP_OK == responseCode) {// 连接成功
                // 当正确响应时处理数据
                StringBuffer sb = new StringBuffer();
                String readLine;
                BufferedReader responseReader;
                // 处理响应流，必须与服务器响应流输出的编码一致
                responseReader = new BufferedReader(new InputStreamReader(httpConn.getInputStream(), "utf-8"));
                while ((readLine = responseReader.readLine()) != null) {
                    sb.append(readLine);
                }
                responseReader.close();
                httpConn.disconnect();
                return sb.toString();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "";
    }

    /**
     * 获取授权令牌
     */
    public static JSONObject getAccessToken(String appid, String secret,
                                            String code) throws IOException {
        StringBuilder urlBuilder = new StringBuilder();
        urlBuilder.append("https://api.weixin.qq.com/sns/oauth2/access_token?");
        urlBuilder.append("appid=" + appid);
        urlBuilder.append("&secret=").append(secret);
        urlBuilder.append("&code=").append(code);
        urlBuilder.append("&grant_type=authorization_code");
        String url = urlBuilder.toString();
        String jsonString = getJSONString(url);
        JSONObject jsonObj = JSONObject.fromObject(jsonString);
        return jsonObj;
    }

    //获取用户信息
    public static JSONObject getUserInfo(String token, String openid) throws IOException {
        StringBuilder urlBuilder = new StringBuilder();
        urlBuilder.append("https://api.weixin.qq.com/sns/userinfo?");
        urlBuilder.append("access_token=" + token);
        urlBuilder.append("&openid=").append(openid);
        urlBuilder.append("&lang=zh_CN");
        String url = urlBuilder.toString();
        String jsonString = getJSONString(url);
        JSONObject jsonObj = JSONObject.fromObject(jsonString);
        return jsonObj;
    }

    //@RequestMapping(value = "/Wx/GetAccessToken")
    public String getAccessToken() throws IOException {
        String url = String.format(
                "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%s&secret=%s",
                APP_ID, APP_SECRET);
        String jsonString = getJSONString(url);
        JSONObject jsonObj = JSONObject.fromObject(jsonString);
        String accessToken = jsonObj.getString("access_token");
        //return "redirect:https://www.baidu.com/s?wd=" + accessToken;
        return accessToken;
    }

    //@RequestMapping(value = "/Wx/GetQC")
    public String getQC(String scene_id) throws IOException {
        String accessToken = getAccessToken();
        String url = String.format("https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=%s", accessToken);
        String jsonString = String.format("{\"action_name\": \"QR_LIMIT_SCENE\", \"action_info\": {\"scene\": {\"scene_id\": %s}}}", scene_id);
        String postBackJsonString = postJSONString(url, jsonString);
        JSONObject postBackJsonObj = JSONObject.fromObject(postBackJsonString);
        String ticket = postBackJsonObj.getString("ticket");
        String qCUrl = String.format("https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=%s", URLEncoder.encode(ticket, "utf-8"));
        return qCUrl;
    }

    //http://blog.csdn.net/lhzjj/article/details/11678129

    private static String TOKEN = "cxmm";

    //从输入流读取post参数
    private String readStreamParameter(ServletInputStream in) {
        StringBuilder buffer = new StringBuilder();
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new InputStreamReader(in));
            String line = null;
            while ((line = reader.readLine()) != null) {
                buffer.append(line);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != reader) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return buffer.toString();
    }

    @RequestMapping(value = "/Wx/Receive")
    public void receiveGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 随机字符串，从微信用户获取
        String echostr = request.getParameter("echostr");
        if (checkSignature(request)) {
            response.getWriter().print(echostr);
            return;
        }
        response.getWriter().print("Error");
    }

    @RequestMapping(value = "/Wx/Receive", method = RequestMethod.POST)
    public void receive(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String postStr = null;
        try {
            postStr = readStreamParameter(request.getInputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }
        //this.print(response, postStr);
        if (null != postStr && !postStr.isEmpty()) {
            Document document = null;
            try {
                document = DocumentHelper.parseText(postStr);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (null == document) {
                //this.print(response, "");
                return;
            }
            Element root = document.getRootElement();
            String fromUsername = root.elementText("FromUserName");
            String toUsername = root.elementText("ToUserName");
            //String content = root.elementTextTrim("Content");
            String msgType = root.elementTextTrim("MsgType");//扫二维码关注：event
            String event = root.elementTextTrim("Event");//扫二维码关注：subscribe
            String eventKey = root.elementText("EventKey");//扫二维码关注：qrscene_
            String ticket = root.elementText("Ticket");//扫二维码关注
            if (msgType.equals("event") && event.equals("subscribe") && eventKey.startsWith("qrscene_")) {
                this.print(response, fromUsername);
                this.print(response, eventKey.substring(8));
            }
//            String time = new Date().getTime() + "";
//            String textTpl = "<xml>" +
//                    "<ToUserName><![CDATA[%1$s]]></ToUserName>" +
//                    "<FromUserName><![CDATA[%2$s]]></FromUserName>" +
//                    "<CreateTime>%3$s</CreateTime>" +
//                    "<MsgType><![CDATA[%4$s]]></MsgType>" +
//                    "<Content><![CDATA[%5$s]]></Content>" +
//                    "<FuncFlag>0</FuncFlag>" +
//                    "</xml>";
//            if (null != keyword && !keyword.equals("")) {
//                String msgType = "text";
//                String contentStr = "Welcome to wechat world!";
//                String resultStr = textTpl.format(textTpl, fromUsername, toUsername, time, msgType, contentStr);
//                this.print(response, resultStr);
//            } else {
//                this.print(response, "Input something...");
//            }
        } else {
            this.print(response, "");
        }
    }

    //向请求端发送返回数据
    public void print(HttpServletResponse response, String content) throws IOException {
        try {
            FileWriter fileWriter = new FileWriter("C:\\Users\\Administrator\\Desktop\\Result.txt", true);
            fileWriter.write(content);
            fileWriter.flush();
            fileWriter.close();
        } catch (Exception e) {

        }
        try {
            response.getWriter().print(content);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (Exception e) {

        }
    }

    //数组转字符串
    public String ArrayToString(String[] arr) {
        StringBuffer bf = new StringBuffer();
        for (int i = 0; i < arr.length; i++) {
            bf.append(arr[i]);
        }
        return bf.toString();
    }

    //sha1加密
    public String SHA1Encode(String sourceString) {
        String resultString = null;
        try {
            resultString = new String(sourceString);
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            resultString = byte2hexString(md.digest(resultString.getBytes()));
        } catch (Exception ex) {
        }
        return resultString;
    }

    public final String byte2hexString(byte[] bytes) {
        StringBuffer buf = new StringBuffer(bytes.length * 2);
        for (int i = 0; i < bytes.length; i++) {
            if (((int) bytes[i] & 0xff) < 0x10) {
                buf.append("0");
            }
            buf.append(Long.toString((int) bytes[i] & 0xff, 16));
        }
        return buf.toString().toUpperCase();
    }

    private Boolean checkSignature(HttpServletRequest request) {
        // 微信加密签名，用于验证签名
        String signature = request.getParameter("signature");
        // 时间
        String timestamp = request.getParameter("timestamp");
        // 随机数
        String nonce = request.getParameter("nonce");

        String[] str = {TOKEN, timestamp, nonce};
        Arrays.sort(str); // 字典序排
        String bigStr = str[0] + str[1] + str[2];
        // SHA1加密
        String digest = new SHA1().getDigestOfString(bigStr.getBytes()).toLowerCase();

        // 确认请求来至微信
        return digest.equals(signature);
    }

    private void responseMsg(HttpServletRequest request) {

    }

    @RequestMapping(value = "/Wx/SetMenu")
    public void createMenu(HttpServletResponse response) throws IOException {
        Map map = new HashMap();
        List<Map> menus = new LinkedList<Map>();

        //第一个菜单
        Map firstBtn = new HashMap();
        firstBtn.put("type", "view");
        firstBtn.put("name", "体质评估");
        firstBtn.put("url", "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxde1edf21c395f90f&redirect_uri=http%3a%2f%2fcx.ecnucpp.com%2ftest1minute%2f&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect");
        menus.add(firstBtn);

        //第二个菜单
        Map secondBtn = new HashMap();
        secondBtn.put("name", "我的");

        //第二个菜单的子菜单
        List<Map> secondSubBtn = new LinkedList<Map>();
        Map myBtn = new HashMap();
        myBtn.put("type", "view");
        myBtn.put("name", "订单信息");
        myBtn.put("url", "http://cxmm.ecnucpp.com:8080/web/info.html#rd?nsukey=DnPkRwzLRP0hqwlZ9RDNO%2BVCvhVACGS9f1hXxYOZ2hY2%2FtA7KjGhi%2B%2Bhk7MwT%2FjYoq20NfgLMvfb4%2FLeKsc0SQ%3D%3D");
        secondSubBtn.add(myBtn);
        Map myTest = new HashMap();
        myTest.put("type", "view");
        myTest.put("name", "疑问解答");
        myTest.put("url", "http://cxmm.ecnucpp.com:8080/web/result.html#rd?nsukey=QaM%2B9o09ye8S8BKC9nW0AVl%2FodduOpmyfov2wnEJBhS%2FUnSJO9OlIz0I7SKiW1Rx%2BILfAM5LYeb1wdbhTcFrJw%3D%3D");
        secondSubBtn.add(myTest);
        Map myShare = new HashMap();
        myShare.put("type", "view");
        myShare.put("name", "我的分享");
        myShare.put("url", "http://cxmm.ecnucpp.com:8080/order/share.html#rd?nsukey=V9DHBC7nas75fC9RVychj%2BpcMPfn7%2FrRMlQUxTbqhLBSZUXJyFYzLiOZqIYgcgCiJKUGg6iqP5jTq0AavNLUGw%3D%3D");
        secondSubBtn.add(myShare);
        secondBtn.put("sub_button", secondSubBtn);
        menus.add(secondBtn);

        //第三个菜单
        Map thirdBtn = new HashMap();
        thirdBtn.put("name", "禅心妈妈");

        List<Map> thirdSubBtn = new LinkedList<Map>();
        Map newsBtn = new HashMap();
        newsBtn.put("type", "view");
        newsBtn.put("name", "动态");
        newsBtn.put("url", "http://cxmm.ecnucpp.com:8080/demo/news_mobile.html#rd?nsukey=f5X8KQpkxzQjBKR64M%2F1cdemk3t%2BQr%2BVf9NN9i%2B76hA2LLWUJ8LuIZ%2FaEqnFjk%2BdV86UN%2FxFcfP%2FL5YPQp9MxQ%3D%3D");
        thirdSubBtn.add(newsBtn);
        Map activityBtn = new HashMap();
        activityBtn.put("type", "view");
        activityBtn.put("name", "我的推广");
        activityBtn.put("url", "http://cxmm.ecnucpp.com:8080/demo/activity_mobile.html#rd?nsukey=d6V6w5w984jU3yAuCijK9yQ2jYRwKMFix5Y5E3Ld%2BDA4jZcbll%2B%2F%2BY%2FyAQjY2dbZ%2BQKTKQWZQZAQyrCQaE2ZTQ%3D%3D");
        thirdSubBtn.add(activityBtn);
        Map joinUsBtn = new HashMap();
        joinUsBtn.put("type", "view");
        joinUsBtn.put("name", "合作伙伴");
        joinUsBtn.put("url", "http://cxmm.ecnucpp.com:8080/Chanxin51/detail/index/28526");
        thirdSubBtn.add(joinUsBtn);
        thirdBtn.put("sub_button", thirdSubBtn);
        menus.add(thirdBtn);
        map.put("button", menus);

        String accessToken = getAccessToken();
        String url = String.format("https://api.weixin.qq.com/cgi-bin/menu/create?access_token=%s", accessToken);
        JSONObject jObject = JSONObject.fromObject(map);
        String jsonString = jObject.toString();
        String s = postJSONString(url, jObject.toString());
        print(response, jsonString + "\r\n" + s);
    }

    public String payJSAPI(String nonce_str, String body, String out_trade_no, int total_fee, String spbill_create_ip, String openid) throws NoSuchAlgorithmException, IOException {
        StringBuilder urlBuilder = new StringBuilder();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
        long currentTime = System.currentTimeMillis();
        currentTime += 15 * 60 * 1000;
        Date now = new Date(currentTime);
        Date date = new Date(currentTime);
        String signStr = sign(nonce_str, body, out_trade_no, total_fee, spbill_create_ip, openid, now, date);
        urlBuilder.append("appid=" + APP_ID);
        urlBuilder.append("&mch_id=").append(MCH_ID);
        //urlBuilder.append("&device_info=").append( );
        urlBuilder.append("&nonce_str=").append(nonce_str);
        urlBuilder.append("&sign=").append(signStr);
        urlBuilder.append("&body=").append(body);
        urlBuilder.append("&out_trade_no=").append(out_trade_no);
        urlBuilder.append("&total_fee=").append(total_fee);
        urlBuilder.append("&spbill_create_ip=").append(spbill_create_ip);
        urlBuilder.append("&time_start=").append(df.format(now));
        urlBuilder.append("&time_expire=").append(df.format(date));
        urlBuilder.append("&notify_url=").append("");
        urlBuilder.append("&trade_type=").append("JSAPI");
        urlBuilder.append("&openid=").append(openid);
        String param = urlBuilder.toString();
        return sendPost("https://api.mch.weixin.qq.com/pay/unifiedorder?", param);
    }

    public String sign(String nonce_str, String body, String out_trade_no, int total_fee, String spbill_create_ip, String openid, Date now, Date date) throws NoSuchAlgorithmException {
        StringBuilder urlBuilder = new StringBuilder();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
        urlBuilder.append("appid=" + APP_ID);
        urlBuilder.append("&body=").append(body);
        urlBuilder.append("&mch_id=").append(MCH_ID);
        //urlBuilder.append("&device_info=").append( );
        urlBuilder.append("&nonce_str=").append(nonce_str);
        urlBuilder.append("&notify_url=").append("");
        urlBuilder.append("&openid=").append(openid);
        urlBuilder.append("&out_trade_no=").append(out_trade_no);
        urlBuilder.append("&sign=").append(nonce_str);
        urlBuilder.append("&spbill_create_ip=").append(spbill_create_ip);
        urlBuilder.append("&time_expire=").append(df.format(date));
        urlBuilder.append("&time_start=").append(df.format(now));
        urlBuilder.append("&total_fee=").append(total_fee);
        urlBuilder.append("&trade_type=").append("JSAPI");
        urlBuilder.append("&key=").append(APP_SECRET);
        String signStr = urlBuilder.toString();
        signStr = getMd5(signStr).toUpperCase();
        return signStr;
    }

    public static String getMd5(String str) throws NoSuchAlgorithmException {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        byte[] bs = md5.digest(str.getBytes());
        StringBuilder sb = new StringBuilder(40);
        for (byte x : bs) {
            if ((x & 0xff) >> 4 == 0) {
                sb.append("0").append(Integer.toHexString(x & 0xff));
            } else {
                sb.append(Integer.toHexString(x & 0xff));
            }
        }
        return sb.toString();
    }
}
