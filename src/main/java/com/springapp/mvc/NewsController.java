package com.springapp.mvc;

import com.springapp.entity.News;
import com.springapp.entity.NewsStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping(value = "**")
public class NewsController extends BaseController {
    @RequestMapping(value = "/News/Management")
    public ModelAndView management(String title) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/News/Management");
        String hql = "from News ";
        if (title != null && !title.equals("")) {
            hql += "WHERE title like '%" + title.trim() + "%'";
        }
        modelAndView.addObject("NewsList", newsDao.findAll(hql, News.class));
        modelAndView.addObject("NewsStatusList", newsStatusDao.findAll("from NewsStatus", NewsStatus.class));
        return modelAndView;
    }

    @RequestMapping(value = "/News/Management", method = RequestMethod.POST)
    public ModelAndView find(String title) throws IOException {
        return management(title);
    }

    @RequestMapping(value = "/News/Add", method = RequestMethod.POST)
    public String add(News news, @RequestParam("file") MultipartFile file, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("/WEB-INF/pages/Web/UserFile/NewsPicture/");
        File saveDir = new File(realPath);
        if (!saveDir.exists()) {
            saveDir.mkdir();
        }
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
                news.setShowPicture(guid + ".jpg");
            } catch (Exception e) {
                e.printStackTrace();
                news.setShowPicture("");
            }
        } else {
            news.setShowPicture("");
        }
        newsDao.save(news);
        return "redirect:/News/Management";
    }

    @RequestMapping(value = "/News/Detail/{id}")
    public ModelAndView detail(@PathVariable("id") int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/News/Detail");
        modelAndView.addObject("News", newsDao.get(News.class, id));
        return modelAndView;
    }

    @RequestMapping(value = "/News/List")
    public ModelAndView list() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/News/List");
        modelAndView.addObject("NewsList", newsDao.findAll("from News Where newsStatus = 1", News.class));
        return modelAndView;
    }

    @RequestMapping(value = "/News/Edit/{id}")
    public ModelAndView edit0(@PathVariable("id") int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/News/Edit");
        modelAndView.addObject("News", newsDao.get(News.class, id));
        modelAndView.addObject("NewsStatusList", newsStatusDao.findAll("from NewsStatus", NewsStatus.class));
        return modelAndView;
    }

    @RequestMapping(value = "/News/Edit/{id}", method = RequestMethod.POST)
    public String edit1(News news, @RequestParam("file") MultipartFile file, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("/WEB-INF/pages/Web/UserFile/NewsPicture/");
        File saveDir = new File(realPath);
        if (!saveDir.exists()) {
            saveDir.mkdir();
        }
        Boolean isSaveFileSuccess = false;
        // 判断文件是否存在
        if (!file.isEmpty() && file.getContentType().equals("image/jpeg")) {
            UUID uuid = UUID.randomUUID();
            String guid = uuid.toString().replaceAll("-", "");
            String path = realPath + "/" + guid + ".jpg";
            File localFile = new File(path);
            try {
                file.transferTo(localFile);
                news.setShowPicture(guid + ".jpg");
                isSaveFileSuccess = true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (!isSaveFileSuccess) {
            News oldNews = newsDao.get(News.class, news.getId());
            news.setShowPicture(oldNews.getShowPicture());
        }
        newsDao.update(news);
        return "redirect:/News/Management";
    }

    @RequestMapping(value = "/News/Delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "infoList") String infoList) {
        String[] newsIds = infoList.split(",");
        for (String id : newsIds) {
            newsDao.delete(News.class, Long.valueOf(id.trim()));
        }
        return "success";
    }

}
