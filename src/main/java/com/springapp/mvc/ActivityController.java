package com.springapp.mvc;

import com.springapp.entity.Activity;
import net.sf.json.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by ZhanShaoxiong on 2016/5/11.
 */
@Controller
@RequestMapping(value = "Activity")
public class ActivityController extends BaseController{
    @RequestMapping(value = "/Management")
    public ModelAndView home(HttpServletRequest request) throws UnsupportedEncodingException {
        ModelAndView modelAndView=new ModelAndView("Web/Upload/ActivityManagement");
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
        List<Activity> activityList = activityDao.getList(title,status);
        int totalPage;
        if(activityList.size()%10==0)
            totalPage=activityList.size()/10;
        else
            totalPage=activityList.size()/10+1;
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("totalPage",totalPage);
        List<Activity>myList=activityDao.getByPage(start,end,title,status);
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
    @RequestMapping(value = "/detail")
    public ModelAndView showActivity(@RequestParam(value = "id")int id) throws IOException {
        ModelAndView modelAndView=new ModelAndView("Web/Upload/detail");
        Activity activity=activityDao.get(Activity.class,id);
        activity.setContent(activity.getContent().replace("width=100%",""));
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
        activity.setType(0);
        if(activity.getId()==0)
            activityDao.save(activity);
        else
            activityDao.update(activity);
        return "redirect:/Activity/Management";
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
        return "redirect:/Activity/Management";
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
    /**
     * 文件上传
     * @param request {@link HttpServletRequest}
     * @param response {@link javax.servlet.http.HttpServletResponse}
     * @return json response
     */
    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> fileUpload(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //文件保存本地目录路径



        String realPath=request.getSession().getServletContext().getRealPath("/")+"WEB-INF/pages/Web/"+"attached"+"/";
        System.out.println("realPath:"+realPath);
        String savePath = realPath;
        //文件保存目录URL
        String saveUrl = request.getContextPath() + "/Web/attached"+"/";

        if(!ServletFileUpload.isMultipartContent(request)){
            return getError("请选择文件。");
        }

        //检查目录
		/*File uploadDir = new File(savePath);
		if(!uploadDir.isDirectory()){
			return getError("上传目录不存在。");
		}
		//检查目录写权限
		if(!uploadDir.canWrite()){
			return getError("上传目录没有写权限。");
		}*/

        String dirName = request.getParameter("dir");
        if (dirName == null) {
            dirName = "image";
        }

        //定义允许上传的文件扩展名
        Map<String, String> extMap = new HashMap<String, String>();
        extMap.put("image", "gif,jpg,jpeg,png,bmp");
        /*
        extMap.put("flash", "swf,flv");
        extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,xml,txt,zip,rar,gz,bz2");*/

        if(!extMap.containsKey(dirName)){
            return getError("目录名不正确。");
        }
        //创建文件夹
        savePath += dirName + "/";
        saveUrl += dirName + "/";
        File saveDirFile = new File(savePath);
        if (!saveDirFile.exists()) {
            saveDirFile.mkdirs();
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String ymd = sdf.format(new Date());
        savePath += ymd + "/";
        saveUrl += ymd + "/";
        File dirFile = new File(savePath);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }

        //最大文件大小
        long maxSize = 1000000;

        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");
        List items = null;
        try {
            items = upload.parseRequest(request);
        } catch (FileUploadException fe) {
            return getError("接收文件异常。");
        }
        Iterator  itr = items.iterator();
        while (itr.hasNext()) {
            FileItem item = (FileItem) itr.next();
            String fileName = item.getName();
            if (!item.isFormField()) {
                //检查文件大小
                if(item.getSize() > maxSize){
                    return getError("上传文件大小超过限制。");
                }
                //检查扩展名
                String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
                if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
                    return getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。");
                }

                SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
                String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
                try{
                    File uploadedFile = new File(savePath, newFileName);
                    item.write(uploadedFile);
                }catch(Exception e){
                    return getError("上传文件失败。");
                }

                Map<String, Object> succMap = new HashMap<String, Object>();
                succMap.put("error", 0);
                succMap.put("url", saveUrl + newFileName);

                return succMap;
            }
        }

        return null;
    }

    private Map<String, Object> getError(String errorMsg) {
        Map<String, Object> errorMap = new HashMap<String, Object>();
        errorMap.put("error", 1);
        errorMap.put("message", errorMsg);
        return errorMap;
    }

    /**
     * 文件空间
     * @param request {@link HttpServletRequest}
     * @param response {@link HttpServletResponse}
     * @return json
     */
    @RequestMapping(value = "/fileManager")
    @ResponseBody
    public Object fileManager(HttpServletRequest request, HttpServletResponse response) {
        //根目录路径，可以指定绝对路径
        String realPath=System.getProperty("search.root")+"attached"+"/";
        System.out.println("realPath:"+realPath);

        String rootPath = realPath;
        //根目录URL，可以指定绝对路径，比如 http://www.yoursite.com/attached/
        String rootUrl  = request.getContextPath() + "/attached"+"/";
        //图片扩展名
        String[] fileTypes = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};

        String dirName = request.getParameter("dir");
        if (dirName != null) {
            if(!Arrays.<String>asList(new String[]{"image", "flash", "media", "file"}).contains(dirName)){
                return "Invalid Directory name.";
            }
            rootPath += dirName + "/";
            rootUrl += dirName + "/";
            File saveDirFile = new File(rootPath);
            if (!saveDirFile.exists()) {
                saveDirFile.mkdirs();
            }
        }
        //根据path参数，设置各路径和URL
        String path = request.getParameter("path") != null ? request.getParameter("path") : "";
        String currentPath = rootPath + path;
        String currentUrl = rootUrl + path;
        String currentDirPath = path;
        String moveupDirPath = "";
        if (!"".equals(path)) {
            String str = currentDirPath.substring(0, currentDirPath.length() - 1);
            moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0, str.lastIndexOf("/") + 1) : "";
        }

        //排序形式，name or size or type
        String order = request.getParameter("order") != null ? request.getParameter("order").toLowerCase() : "name";

        //不允许使用..移动到上一级目录
        if (path.indexOf("..") >= 0) {
            return "Access is not allowed.";
        }
        //最后一个字符不是/
        if (!"".equals(path) && !path.endsWith("/")) {
            return "Parameter is not valid.";
        }
        //目录不存在或不是目录
        File currentPathFile = new File(currentPath);
        if(!currentPathFile.isDirectory()){
            return "Directory does not exist.";
        }

        //遍历目录取的文件信息
        List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
        if(currentPathFile.listFiles() != null) {
            for (File file : currentPathFile.listFiles()) {
                Hashtable<String, Object> hash = new Hashtable<String, Object>();
                String fileName = file.getName();
                if(file.isDirectory()) {
                    hash.put("is_dir", true);
                    hash.put("has_file", (file.listFiles() != null));
                    hash.put("filesize", 0L);
                    hash.put("is_photo", false);
                    hash.put("filetype", "");
                } else if(file.isFile()){
                    String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
                    hash.put("is_dir", false);
                    hash.put("has_file", false);
                    hash.put("filesize", file.length());
                    hash.put("is_photo", Arrays.<String>asList(fileTypes).contains(fileExt));
                    hash.put("filetype", fileExt);
                }
                hash.put("filename", fileName);
                hash.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified()));
                fileList.add(hash);
            }
        }

        if ("size".equals(order)) {
            Collections.sort(fileList, new SizeComparator());
        } else if ("type".equals(order)) {
            Collections.sort(fileList, new TypeComparator());
        } else {
            Collections.sort(fileList, new NameComparator());
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("moveup_dir_path", moveupDirPath);
        result.put("current_dir_path", currentDirPath);
        result.put("current_url", currentUrl);
        result.put("total_count", fileList.size());
        result.put("file_list", fileList);

        return result;
    }

    private class NameComparator implements Comparator<Map<String, Object>> {
        public int compare(Map<String, Object> hashA, Map<String, Object> hashB) {
            if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
                return -1;
            } else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
                return 1;
            } else {
                return ((String)hashA.get("filename")).compareTo((String)hashB.get("filename"));
            }
        }
    }

    private class SizeComparator implements Comparator<Map<String, Object>> {
        public int compare(Map<String, Object> hashA, Map<String, Object> hashB) {
            if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
                return -1;
            } else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
                return 1;
            } else {
                if (((Long)hashA.get("filesize")) > ((Long)hashB.get("filesize"))) {
                    return 1;
                } else if (((Long)hashA.get("filesize")) < ((Long)hashB.get("filesize"))) {
                    return -1;
                } else {
                    return 0;
                }
            }
        }
    }

    private class TypeComparator implements Comparator<Map<String, Object>> {
        public int compare(Map<String, Object> hashA, Map<String, Object> hashB) {
            if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
                return -1;
            } else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
                return 1;
            } else {
                return ((String)hashA.get("filetype")).compareTo((String)hashB.get("filetype"));
            }
        }
    }

}

