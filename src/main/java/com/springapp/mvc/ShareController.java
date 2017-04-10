package com.springapp.mvc;

import com.springapp.entity.Activity;
import net.sf.json.JSONObject;
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
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by 11369 on 2016/6/12.
 */
@Controller
@RequestMapping(value = "Share")
public class ShareController extends BaseController {
    @RequestMapping(value = "/Management")
    public ModelAndView home(HttpServletRequest request) throws UnsupportedEncodingException {
        ModelAndView modelAndView=new ModelAndView("Web/Upload/ShareManagement");
        request.setCharacterEncoding("utf-8");
        String title=request.getParameter("title");
        String status=request.getParameter("status");
         /*分页，每页十项*/
        String pn=request.getParameter("pn");
        int pageNum=1,start=0,end=0;
        if(pn!=null&&!pn.equals(""))
            pageNum=Integer.parseInt(pn);
        start = (pageNum - 1) * 10;
        end=10;
        List<Activity> activityList = activityDao.getShareList(title,status);
        int totalPage;
        if(activityList.size()%10==0)
            totalPage=activityList.size()/10;
        else
            totalPage=activityList.size()/10+1;
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("totalPage",totalPage);
        List<Activity>myList=activityDao.getShareByPage(start,end,title,status);
        modelAndView.addObject("list", myList);
        return modelAndView;
    }
    @RequestMapping(value = "/List")
    public ModelAndView List(){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/ShareList");
        List<Activity>activityList=activityDao.getShareList();
        modelAndView.addObject("activityList",activityList);
        return modelAndView;
    }
    @RequestMapping(value = "/detail")
    public ModelAndView showActivity(@RequestParam(value = "id")int id) throws IOException {
        ModelAndView modelAndView=new ModelAndView("Web/Upload/detail");
        Activity activity=activityDao.get(Activity.class,id);
        activity.setContent(activity.getContent().replace("width=100% ",""));
        activity.setContent(activity.getContent().replace("width=\"100%\"",""));
        modelAndView.addObject("activity",activity);
        return modelAndView;
    }
    @RequestMapping(value = "/Add", method = RequestMethod.POST)
    public String add(Activity activity, @RequestParam("file") MultipartFile file, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("/WEB-INF/pages/Web/UserFile/ActivityPicture/");
        activity.setContent(activity.getContent().replace("<img", "<img width=100%"));
        File mainFile=new File(realPath);
        if(!mainFile.exists())
            mainFile.mkdirs();
        // 获取文件类型
        //System.out.println(file.getContentType());
        // 获取文件大小
        //System.out.println(file.getSize());
        // 获取文件名称
        //System.out.println(file.getOriginalFilename());

        // 判断文件是否存在
        if (!file.isEmpty() && file.getContentType().equals("image/jpeg")) {
            UUID uuid = UUID.randomUUID();
            String guid = uuid.toString().replaceAll("-", "");
            String path = realPath + "/" + guid + ".jpg";
            File localFile = new File(path);
            try {
                file.transferTo(localFile);
                activity.setShowPicture(guid + ".jpg");
            } catch (Exception e) {
                e.printStackTrace();
                activity.setShowPicture("");
            }
        } else {
            activity.setShowPicture("");
        }
        activity.setCreatetime(sdf.format(new Date()));
        activity.setType(1);
        if(activity.getId()==0)
            activityDao.save(activity);
        else
            activityDao.update(activity);
        return "redirect:/Share/Management";
    }
    @RequestMapping(value = "/Edit", method = RequestMethod.POST)
    public String Edit(Activity activity, @RequestParam("file") MultipartFile file, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("/WEB-INF/pages/Web/UserFile/ActivityPicture/");
        activity.getContent().replace("<img","<img width=100%");
        File mainFile=new File(realPath);
        if(!mainFile.exists())
            mainFile.mkdirs();
        // 获取文件类型
        //System.out.println(file.getContentType());
        // 获取文件大小
        //System.out.println(file.getSize());
        // 获取文件名称
        //System.out.println(file.getOriginalFilename());

        // 判断文件是否存在
        if (!file.isEmpty() && file.getContentType().equals("image/jpeg")) {
            UUID uuid = UUID.randomUUID();
            String guid = uuid.toString().replaceAll("-", "");
            String path = realPath + "/" + guid + ".jpg";
            File localFile = new File(path);
            try {
                file.transferTo(localFile);
                activity.setShowPicture(guid + ".jpg");
            } catch (Exception e) {
                e.printStackTrace();
                activity.setShowPicture("");
            }
        } else {
            activity.setShowPicture("");
        }
        activityDao.update(activity);
        return "redirect:/Share/Management";
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "infoList")String infoList){
        String[] clubIds = infoList.split(",");
        for (String id : clubIds) {
            Activity activity = baseDao.get(Activity.class, Integer.parseInt(id));
            baseDao.delete(activity);
        }
        return "success";
    }
    @RequestMapping(value = "/get",method = RequestMethod.POST)
    @ResponseBody
    public String get(@RequestParam(value = "id")int id){
        Activity activity=activityDao.get(Activity.class,id);
        return JSONObject.fromObject(activity).toString();
    }
}
