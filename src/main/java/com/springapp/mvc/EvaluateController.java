package com.springapp.mvc;

import com.springapp.entity.*;
import net.sf.json.JSONObject;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigInteger;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ZhanShaoxiong on 2016/5/10.
 */
@Controller
@RequestMapping(value = "/Evaluate")
public class EvaluateController extends BaseController {
    private static Map<String, String> bodyConditionToDetails = new HashMap<String, String>();
/*
    private static String models = "您的体质偏向 %s，%n在产后有 %s 风险，%n坐月子是女人改变体质的黄金期，也是极易让妇科，内分泌等慢性疾病埋下隐患的敏感期，建议您依据体质，合理规划好产后饮食调理，选择由专家为您量身定制的食疗调理方案，降低敏感期风险，让您和宝宝更加健康！";
*/

    static {
        bodyConditionToDetails.put("气虚", "子宫下垂、产后露恶不绝");
        bodyConditionToDetails.put("阳虚", "腹泻、产后脱发");
        bodyConditionToDetails.put("阴虚", "便秘、产后露恶不绝");
        bodyConditionToDetails.put("气郁", "产后抑郁症、产后缺乳");
        bodyConditionToDetails.put("血瘀", "产后出血量大、产后排尿不良");
        bodyConditionToDetails.put("痰湿", "产后肥胖症");
        bodyConditionToDetails.put("湿热", "乳腺炎、泌尿道感染");
        bodyConditionToDetails.put("特禀", "过敏、湿疹");
        bodyConditionToDetails.put("平和", "");
    }
    @RequestMapping
    public ModelAndView home(){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/test");
        return modelAndView;
    }
    @RequestMapping(value = "evaluate1")
    public ModelAndView evaluate1(HttpServletRequest request) throws ParseException {
        ModelAndView modelAndView=new ModelAndView("Web/Upload/evaluate1");
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
        List<WxEvaluation> wxEvaluationList = evaluationDao.cxList(name,fromDatetime,toDatetime,status);
        int totalPage;
        if(wxEvaluationList.size()%10==0)
            totalPage=wxEvaluationList.size()/10;
        else
            totalPage=wxEvaluationList.size()/10+1;
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("totalPage",totalPage);
        List<WxEvaluation>myList=evaluationDao.getCxByPage(start, end,name,fromDatetime,toDatetime,status);
        modelAndView.addObject("list", myList);
        List<EvaluationStatus>evaluationStatuses=baseDao.findAll("from EvaluationStatus",EvaluationStatus.class);
        modelAndView.addObject("evaluationStatuses",evaluationStatuses);
        return modelAndView;
    }
    @RequestMapping(value = "/outExcel1", method = RequestMethod.GET)
    public void outExcel1(HttpServletResponse response,@RequestParam(value = "name")String name,@RequestParam(value = "fromDatetime")String fromDatetime,@RequestParam(value = "toDatetime")String toDatetime,@RequestParam(value = "status")String status) throws ParseException {
        List<WxEvaluation> wxEvaluationList = evaluationDao.cxList(name, fromDatetime, toDatetime, status);
        List<Map>mapList=new ArrayList<Map>();
        for(WxEvaluation wxEvaluation:wxEvaluationList){
            Map map=new HashMap();
            map.put("nickname",wxEvaluation.getUid().getNickname());
            map.put("evaluateTime",wxEvaluation.getTime());
            map.put("status",wxEvaluation.getEvaluation_status().getName());
            map.put("ExpectingDate",wxEvaluation.getUid().getExpectingDate());
            map.put("Weight",wxEvaluation.getUid().getWeight());
            map.put("AfterWeight",wxEvaluation.getUid().getAfterWeight());
            map.put("Height",wxEvaluation.getUid().getHeight());
            map.put("Age",wxEvaluation.getUid().getAge());
            map.put("BirthOrder",wxEvaluation.getUid().getBirthorder());
            map.put("eutocia",wxEvaluation.getUid().getEutocia()==1?"顺产":"剖产");
            map.put("feed",wxEvaluation.getUid().getFeed()==1?"哺乳":"非哺乳");
            map.put("phone",wxEvaluation.getUid().getPhone());
            map.put("result1",JSONObject.fromObject(getResult(1, wxEvaluation.getUid().getUid())).get("result"));
            map.put("result5",JSONObject.fromObject(getResult(5, wxEvaluation.getUid().getUid())).get("result"));
            mapList.add(map);
        }
        try{
            String[] titles = new String[]{"会员名", "评估时间", "状态","预产期","孕前体重(KG)","当前体重(KG)","身高(CM)","年龄(周岁)","胎次","顺产/剖产","哺乳/非哺乳","手机号","一分钟评测结果","五分钟评测结果"};
            String[] keys = new String[]{"nickname", "evaluateTime", "status","ExpectingDate","Weight","AfterWeight","Height","Age","BirthOrder","eutocia","feed","phone","result1","result5"};

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
    @RequestMapping(value = "/outExcel2", method = RequestMethod.GET)
    public void outExcel2(HttpServletResponse response,@RequestParam(value = "name")String name,@RequestParam(value = "agent")String agent,@RequestParam(value = "fromDatetime")String fromDatetime,@RequestParam(value = "toDatetime")String toDatetime,@RequestParam(value = "status")String status) throws ParseException {
        List<WxEvaluation> wxEvaluationList = evaluationDao.dlList(name, agent, fromDatetime, toDatetime, status);
        List<Map>mapList=new ArrayList<Map>();
        for(WxEvaluation wxEvaluation:wxEvaluationList){
            Map map=new HashMap();
            map.put("nickname",wxEvaluation.getUid().getNickname());
            map.put("evaluateTime",wxEvaluation.getTime());
            map.put("status",wxEvaluation.getEvaluation_status().getName());
            map.put("ExpectingDate",wxEvaluation.getUid().getExpectingDate());
            map.put("Weight",wxEvaluation.getUid().getWeight());
            map.put("AfterWeight",wxEvaluation.getUid().getAfterWeight());
            map.put("Height",wxEvaluation.getUid().getHeight());
            map.put("Age",wxEvaluation.getUid().getAge());
            map.put("BirthOrder",wxEvaluation.getUid().getBirthorder());
            map.put("eutocia",wxEvaluation.getUid().getEutocia()==1?"顺产":"剖产");
            map.put("feed",wxEvaluation.getUid().getFeed()==1?"哺乳":"非哺乳");
            map.put("phone",wxEvaluation.getUid().getPhone());
            map.put("result1",JSONObject.fromObject(getResult(1, wxEvaluation.getUid().getUid())).get("result"));
            map.put("result5",JSONObject.fromObject(getResult(5, wxEvaluation.getUid().getUid())).get("result"));
            mapList.add(map);
        }
        try{
            String[] titles = new String[]{"会员名", "评估时间", "状态","预产期","孕前体重(KG)","当前体重(KG)","身高(CM)","年龄(周岁)","胎次","顺产/剖产","哺乳/非哺乳","手机号","一分钟评测结果","五分钟评测结果"};
            String[] keys = new String[]{"nickname", "evaluateTime", "status","ExpectingDate","Weight","AfterWeight","Height","Age","BirthOrder","eutocia","feed","phone","result1","result5"};

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
    @RequestMapping(value = "evaluate2")
    public ModelAndView evaluate2(HttpServletRequest request) throws ParseException {
        ModelAndView modelAndView=new ModelAndView("Web/Upload/evaluate2");
        String name=request.getParameter("name");
        request.setAttribute("name",name);
        String agent=request.getParameter("agent");
        request.setAttribute("agent",agent);
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
        List<WxEvaluation> wxEvaluationList = evaluationDao.dlList(name,agent,fromDatetime,toDatetime,status);
        int totalPage;
        if(wxEvaluationList.size()%10==0)
            totalPage=wxEvaluationList.size()/10;
        else
            totalPage=wxEvaluationList.size()/10+1;
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("totalPage",totalPage);
        List<WxEvaluation>myList=evaluationDao.getDlByPage(start, end,name,agent,fromDatetime,toDatetime,status);
        modelAndView.addObject("list", myList);
        List<EvaluationStatus>evaluationStatuses=baseDao.findAll("from EvaluationStatus",EvaluationStatus.class);
        modelAndView.addObject("evaluationStatuses",evaluationStatuses);
        return modelAndView;
    }
    @RequestMapping(value = "/outExcel3", method = RequestMethod.GET)
    public void outExcel3(HttpServletResponse response,@RequestParam(value = "name")String name,@RequestParam(value = "clubName")String clubName,@RequestParam(value = "fromDatetime")String fromDatetime,@RequestParam(value = "toDatetime")String toDatetime,@RequestParam(value = "status")String status) throws ParseException {
        List<Evaluation> evaluationList = evaluationDao.hsList(name, fromDatetime, toDatetime, status,clubName);
        List<Map>mapList=new ArrayList<Map>();
        for(Evaluation evaluation:evaluationList){
            Map map=new HashMap();
            map.put("nickname",evaluation.getName());
            map.put("club",evaluation.getClub().getClub());
            map.put("evaluateTime",evaluation.getTime());
            map.put("status",evaluation.getEvaluationStatus().getName());
            map.put("ExpectingDate",evaluation.getExpectingDate());
            map.put("Weight",evaluation.getWeight());
            map.put("AfterWeight",evaluation.getAfterWeight());
            map.put("Height",evaluation.getHeight());
            map.put("Age",evaluation.getAge());
            map.put("BirthOrder",evaluation.getBirthorder());
            map.put("eutocia",evaluation.getEutocia()==1?"顺产":"剖产");
            map.put("feed",evaluation.getFeed()==1?"哺乳":"非哺乳");
            map.put("phone",evaluation.getPhone());
            map.put("result1",JSONObject.fromObject(getResult1(1,evaluation.getGuid())).get("result"));
            map.put("result5",JSONObject.fromObject(getResult1(5, evaluation.getGuid())).get("result"));
            mapList.add(map);
        }
        try{
            String[] titles = new String[]{"会所","会员名", "评估时间", "状态","预产期","孕前体重(KG)","当前体重(KG)","身高(CM)","年龄(周岁)","胎次","顺产/剖产","哺乳/非哺乳","手机号","一分钟评测结果","五分钟评测结果"};
            String[] keys = new String[]{"club","nickname", "evaluateTime", "status","ExpectingDate","Weight","AfterWeight","Height","Age","BirthOrder","eutocia","feed","phone","result1","result5"};

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
    @RequestMapping(value = "evaluate3")
    public ModelAndView evaluate3(HttpServletRequest request) throws ParseException {
        ModelAndView modelAndView=new ModelAndView("Web/Upload/evaluate3");
        String name=request.getParameter("name");
        request.setAttribute("name",name);
        String clubName=request.getParameter("clubName");
        request.setAttribute("clubName",clubName);
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
        List<Evaluation> wxEvaluationList = evaluationDao.hsList(name,fromDatetime,toDatetime,status,clubName);
        int totalPage;
        if(wxEvaluationList.size()%10==0)
            totalPage=wxEvaluationList.size()/10;
        else
            totalPage=wxEvaluationList.size()/10+1;
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("totalPage",totalPage);
        List<Evaluation>myList=evaluationDao.getHsByPage(start, end,name,fromDatetime,toDatetime,status,clubName);
        modelAndView.addObject("list", myList);
        List<EvaluationStatus>evaluationStatuses=baseDao.findAll("from EvaluationStatus",EvaluationStatus.class);
        modelAndView.addObject("evaluationStatuses",evaluationStatuses);
        return modelAndView;
    }
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "infoList") String infoList) {
        String[] evaluationIds = infoList.split(",");
        for (String id : evaluationIds) {
            WxEvaluation wxEvaluation = evaluationDao.get(WxEvaluation.class, Long.parseLong(id));
            baseDao.delete(wxEvaluation);
            List<SChoice>sChoiceList=baseDao.findAll("from SChoice where uid.uid=?",SChoice.class,new Object[]{wxEvaluation.getUid().getUid()});
            for(SChoice sChoice:sChoiceList){
                baseDao.delete(sChoice);
            }
            List<LChoice>lChoiceList=baseDao.findAll("from LChoice where uid.uid=?",LChoice.class,new Object[]{wxEvaluation.getUid().getUid()});
            for(LChoice lChoice:lChoiceList){
                baseDao.delete(lChoice);
            }
            List<LResult>lResultList=baseDao.findAll("from LResult where uid.uid=?",LResult.class,new Object[]{wxEvaluation.getUid().getUid()});
            for(LResult lResult:lResultList){
                baseDao.delete(lResult);
            }
            List<WxOrderinfo>wxOrderinfoList=orderDao.getByOpenid(wxEvaluation.getUid().getOpenid());
            for(WxOrderinfo wxOrderinfo:wxOrderinfoList){
                baseDao.delete(wxOrderinfo);
            }
        }
        return "success";
    }
    @RequestMapping(value = "/delete1", method = RequestMethod.POST)
    @ResponseBody
    public String delete1(@RequestParam(value = "infoList") String infoList) {
        String[] evaluationIds = infoList.split(",");
        for (String id : evaluationIds) {
            Evaluation evaluation = evaluationDao.getHsEvaluate(id);
            baseDao.delete(evaluation);
            List<Answer1>answer1List=answer1Dao.findAll("from Answer1 where evaluationId=?",Answer1.class,new Object[]{id});
            for(Answer1 answer1:answer1List){
                baseDao.delete(answer1);
            }
            List<Answer2>answer2List=answer2Dao.findAll("from Answer2 where evaluationId=?", Answer2.class, new Object[]{id});
            for(Answer2 answer2:answer2List){
                baseDao.delete(answer2);
            }
        }
        return "success";
    }
    @RequestMapping(value = "getResult",method = RequestMethod.POST)
    @ResponseBody
    public String getResult(@RequestParam(value = "type")int type,@RequestParam(value = "uid")int uid) {
        List<Map> resultList = new ArrayList();
        Map resultMap = new HashMap();
        String result = "";
        if (type == 1) {
            resultList = test1Dao.getStatistics(uid);//降序得到1分钟评测的体质结果，未筛选出得分>=2的
            {
                //result为最终结果
                int count = 0;
                for (Map map : resultList) {
                    if (Integer.parseInt(map.get("countNum").toString()) >= 2) {
                        if (count == 0) {
                            result += map.get("name");
                        } else {
                            result += "," + map.get("name");
                        }
                        count++;
                    }
                }
            }
            if(result.equals(""))
                result="无法判断您的体质。。。";
            resultMap.put("result",result);
            resultMap.put("resultList",resultList);
        }else{
            List<LResult>lResultList=test2Dao.getResult(uid);
            if(lResultList.size()<1)
                result="无法判断出您的体质类型...";
            else{
                if(lResultList.size()<2)
                result+=lResultList.get(0).getBCid().getName();
                else{
                    result+=lResultList.get(0).getBCid().getName()+","+lResultList.get(1).getBCid().getName();
                }
            }
            resultMap.put("result",result);
            resultMap.put("resultList",lResultList);
        }
        return JSONObject.fromObject(resultMap).toString();
    }

    @RequestMapping(value = "getResult1",method = RequestMethod.POST)
    @ResponseBody
    public String getResult1(@RequestParam(value = "type")int type,@RequestParam(value = "evaluationId")String evaluationId) {
        List<Map> resultList = new ArrayList();
        Map resultMap = new HashMap();
        String result = "";
        if (type == 1) {
            resultList = answer1Dao.getStatistics(evaluationId);
            String bodyCondition = "";
            int index = 0;
            for (Object item : resultList) {
                Object[] array = (Object[]) item;
                Integer answer = (Integer) array[0];
                BigInteger count = (BigInteger) array[1];
                String name = (String) array[2];
                if (index == 0) {
                    index++;
                    if (count.intValue() > 1) {
                        result += name;
                    } else {
                        result="无法判断您的体质。。。";
                    }
                } else if (index == 1) {
                    index++;
                    if (count.intValue() > 1) {
                        result += "，" + name;
                    }
                }
            }
            resultMap.put("result",result);
            resultMap.put("resultList",resultList);
        }else{
            resultList = answer2Dao.getStatistics(evaluationId);
            int index = 0;
            String bodyCondition = "";
            for (Object item : resultList) {
                Object[] array = (Object[]) item;
                String name = (String) array[0];
                BigInteger count = (BigInteger) array[1];
                if (index == 0) {
                    index++;
                    result += name;
                } else if (index == 1) {
                    index++;
                    result += "兼" + name;
                } else {
                    break;
                }
            }
            resultMap.put("result",result);
            resultMap.put("resultList",resultList);
        }
        return JSONObject.fromObject(resultMap).toString();
    }
}
