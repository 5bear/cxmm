package com.springapp.mvc;

import com.springapp.entity.Activity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

/**
 * Created by ZhanShaoxiong on 2016/5/11.
 */
@Controller
@RequestMapping(value = "Activity")
public class ActivityController extends BaseController{
    @RequestMapping(value = "/Management")
    public ModelAndView home(HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/ActivityManagement");
         /*分页，每页十项*/
        String pn=request.getParameter("pn");
        int pageNum=1,start=0,end=0;
        if(pn!=null&&!pn.equals(""))
            pageNum=Integer.parseInt(pn);
        start = (pageNum - 1) * 10;
        end=start+9;
        List<Activity> activityList = activityDao.getList();
        int totalPage;
        if(activityList.size()%10==0)
            totalPage=activityList.size()/10;
        else
            totalPage=activityList.size()/10+1;
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("totalPage",totalPage);
        List<Activity>myList=activityDao.getByPage(start,end);
        modelAndView.addObject("list", myList);
        return modelAndView;
    }
    @RequestMapping(value = "/List")
    public ModelAndView List(){
        ModelAndView modelAndView=new ModelAndView("Web/Upload/ActivityList");
        List<Activity>activityList=activityDao.getList();
        modelAndView.addObject("activityList",activityList);
        return modelAndView;
    }
    @RequestMapping(value = "/Add", method = RequestMethod.POST)
    public String add(Activity activity, @RequestParam("file") MultipartFile file, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("/WEB-INF/pages/Web/UserFile/ActivityPicture/");
        File mainFile=new File(realPath);
        if(!mainFile.exists())
            mainFile.mkdir();
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
        activityDao.save(activity);
        return "redirect:/Activity/Management";
    }
}

