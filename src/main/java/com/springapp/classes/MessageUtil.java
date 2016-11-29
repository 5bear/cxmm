package com.springapp.classes;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

/**
 * Created by 11369 on 2016/6/8.
 */
public class MessageUtil {
    private static String apikey="f820f33182baa66bad32f51d9d206cff";
    private static String httpUrl = "http://apis.baidu.com/kingtto_media/106sms/106sms";
    /**
     * @param urlAll
     *            :请求接口
     * @param httpArg
     *            :参数
     * @return 返回结果
     */
    public static String request( String mobile,String content) throws UnsupportedEncodingException {
        BufferedReader reader = null;
        String result = null;
        StringBuffer sbf = new StringBuffer();
        String httpArg="mobile="+mobile+"&content="+ URLEncoder.encode(content, "UTF-8")+"&tag=2";
        String sendUrl = httpUrl + "?" + httpArg;
        try {
            URL url = new URL(sendUrl);
            HttpURLConnection connection = (HttpURLConnection) url
                    .openConnection();
            connection.setRequestMethod("GET");
            // 填入apikey到HTTP header
            connection.setRequestProperty("apikey",  apikey);
            connection.connect();
            InputStream is = connection.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            String strRead = null;
            while ((strRead = reader.readLine()) != null) {
                sbf.append(strRead);
                sbf.append("\r\n");
            }
            reader.close();
            result = sbf.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void main(String[] args) throws UnsupportedEncodingException {
        System.out.println(request("18818080709","【禅心妈妈】 你好禅心妈妈"));
    }
}
