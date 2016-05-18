package com.springapp.mvc;

import com.springapp.entity.Agent;
import com.springapp.entity.WxEvaluation;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

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
}
