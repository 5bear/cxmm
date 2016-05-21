package com.springapp.mvc;

import com.springapp.entity.Agent;
import com.springapp.entity.WxEvaluation;
import net.sf.json.JSONArray;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

/**
 * Created by ZhanShaoxiong on 2016/5/8.
 */
@Controller
@RequestMapping(value = "/Agency")
public class AgentController extends BaseController {
    /*这里全部是一级代理*/
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView home(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("Web/Upload/agency");
         /*分页，每页十项*/
        String pn = request.getParameter("pn");
        int pageNum = 1, start = 0, end = 0;
        if (pn != null && !pn.equals(""))
            pageNum = Integer.parseInt(pn);
        start = (pageNum - 1) * 10;
        end = start + 9;
        List<Agent> agentList = agentDao.getList();
        int totalPage;
        if (agentList.size() % 10 == 0)
            totalPage = agentList.size() / 10;
        else
            totalPage = agentList.size() / 10 + 1;
        request.setAttribute("currentPage", pageNum);
        request.setAttribute("totalPage", totalPage);
        List<Agent> myList = agentDao.getByPage(start, end);
        modelAndView.addObject("list", myList);
        List<Agent>agentList1=agentDao.getListByStatus();
        return modelAndView;
    }

    @RequestMapping(value = "joinerm", method = RequestMethod.GET)
    public ModelAndView joinerm(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("Web/Upload/joinerm");
        Agent agent = (Agent) session.getAttribute("agent");
        if (agent == null) {
            return new ModelAndView("redirect:/agentLogin");
        }
        List<WxEvaluation> evaluations = evaluationDao.getListByAgent(agent.getId());
        modelAndView.addObject("list", evaluations);
        return modelAndView;
    }

    @RequestMapping(value = "secondary", method = RequestMethod.GET)
    public ModelAndView secondary(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("Web/Upload/secondary");
        Agent agent = (Agent) session.getAttribute("agent");
        if (agent == null) {
            return new ModelAndView("redirect:/agentLogin");
        }
        List<Agent> agentList = agentDao.getList(agent.getId());
        modelAndView.addObject("list", agentList);
        return modelAndView;
    }

    @RequestMapping(value = "dlchangePassword", method = RequestMethod.GET)
    public ModelAndView dlchangePassword(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("Web/Upload/dlchangePassword");
        Agent agent = (Agent) session.getAttribute("agent");
        if (agent == null) {
            return new ModelAndView("redirect:/agentLogin");
        }
        List<Agent> agentList = agentDao.getList(agent.getId());
        modelAndView.addObject("list", agentList);
        return modelAndView;
    }
//
//    @RequestMapping(value = "/add", method = RequestMethod.POST)
//    public String add(Agent agent, @RequestParam("file") MultipartFile file, HttpSession session) {
//        Agent agent1 = (Agent) session.getAttribute("agent");
//        String realPath = session.getServletContext().getRealPath("/WEB-INF/pages/Web/Upload/qrcode/");
//        // 获取文件类型
//        //System.out.println(file.getContentType());
//        // 获取文件大小
//        //System.out.println(file.getSize());
//        // 获取文件名称
//        //System.out.println(file.getOriginalFilename());
//
//        // 判断文件是否存在
//        if (!file.isEmpty() && file.getContentType().equals("image/jpeg")) {
//            UUID uuid = UUID.randomUUID();
//            String guid = uuid.toString().replaceAll("-", "");
//            String path = realPath + "/" + guid + ".jpg";
//            File localFile = new File(path);
//            try {
//                file.transferTo(localFile);
//                agent.setQrcode(guid + ".jpg");
//            } catch (Exception e) {
//                e.printStackTrace();
//                agent.setQrcode("");
//            }
//        } else {
//            agent.setQrcode("");
//        }
//        if (agent1 != null) {
//            agent.setFromAgent(agent1.getId());
//            baseDao.save(agent);
//            return "redirect:/Agency/Secondary";
//        }
//        agent.setFromAgent(Long.parseLong("0"));//一级代理
//        baseDao.save(agent);
//        return "redirect:/Agency";
//    }
//
//    @RequestMapping(value = "/edit", method = RequestMethod.POST)
//    public String edit(Agent agent, @RequestParam("file") MultipartFile file, HttpSession session) {
//        String realPath = session.getServletContext().getRealPath("/WEB-INF/pages/Web/Upload/qrcode/");
//
//        // 获取文件类型
//        //System.out.println(file.getContentType());
//        // 获取文件大小
//        //System.out.println(file.getSize());
//        // 获取文件名称
//        //System.out.println(file.getOriginalFilename());
//
//        // 判断文件是否存在
//        if (!file.isEmpty() && file.getContentType().equals("image/jpeg")) {
//            UUID uuid = UUID.randomUUID();
//            String guid = uuid.toString().replaceAll("-", "");
//            String path = realPath + "/" + guid + ".jpg";
//            File localFile = new File(path);
//            try {
//                file.transferTo(localFile);
//                agent.setQrcode(guid + ".jpg");
//            } catch (Exception e) {
//                e.printStackTrace();
//                agent.setQrcode("");
//            }
//        } else {
//            agent.setQrcode("");
//        }
//        agent.setFromAgent(Long.parseLong("0"));//一级代理
//        baseDao.update(agent);
//        return "redirect:/Agency";
//    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "infoList") String infoList) {
        String[] clubIds = infoList.split(",");
        for (String id : clubIds) {
            Agent agent = baseDao.get(Agent.class, Long.parseLong(id));
            baseDao.delete(agent);
        }
        return "success";
    }

    @RequestMapping(value = "/changeStatus", method = RequestMethod.POST)
    @ResponseBody
    public String changeStatus(@RequestParam(value = "infoList") String infoList, @RequestParam(value = "type") int type) {
        String[] clubIds = infoList.split(",");
        for (String id : clubIds) {
            Agent agent = baseDao.get(Agent.class, Long.parseLong(id));
            if (type == 0)
                agent.setStatus("可用");
            else
                agent.setStatus("失效");
            agentDao.update(agent);
        }
        return "success";
    }

    @RequestMapping(value = "/find", method = RequestMethod.POST)
    @ResponseBody
    public String find(@RequestParam(value = "club") String club, @RequestParam(value = "status") String status) {
        List<Agent> agentList = agentDao.findByCondition(club, status);
        return JSONArray.fromObject(agentList).toString();
    }
    @RequestMapping(value = "/balance", method = RequestMethod.GET)
    public void balance(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "agentId") Long agentId, @RequestParam(value = "canceRate") float canceRate,@RequestParam(value = "canheRate") float canheRate,
                          @RequestParam(value = "startDate") String startDate,@RequestParam(value = "endDate") String endDate) throws ParseException {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM");
        Long timeStamp1=simpleDateFormat.parse(startDate).getTime();
        Long timeStamp2=simpleDateFormat.parse(endDate).getTime();
        Map agent=agentDao.getAsMap(agentId,canceRate,canheRate,timeStamp1,timeStamp2);
        List<Map>agentList=agentDao.getByRecommend((String) agent.get("name"),canceRate,canheRate,timeStamp1,timeStamp2);
        agentList.add(0,agent);
        try{
            String[] titles = new String[]{"代理点", "手机号", "餐册数","餐册提成比例","餐盒数","餐盒提成比例","推荐人"};
            String[] keys = new String[]{"name", "phoneNum", "canceNum","canceRate","canheNum","canheRate","recommend"};

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



            for (Map agent1 : agentList) {
                row = sheet.createRow(i);

                row.setRowStyle(style);
                int j = 0;
                //for(int n=0;i<enrollCodeList.size();n++)
                for (String key : keys) {
                    cell = row.createCell(j);
                    cell.setCellValue(agent1.get(key)+"");
                    cell.setCellStyle(style);
                    j++;
                }
                i++;
            }

            response.reset();
            // 设置response的Header
            response.setHeader("pragma", "no-cache");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment; filename="+agentId.toString()+".xls");
            response.setContentType("application/*");
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