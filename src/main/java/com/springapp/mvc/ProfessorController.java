package com.springapp.mvc;

import com.springapp.entity.Professor;
import com.springapp.entity.ProfessorStatus;
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
public class ProfessorController extends BaseController {
    @RequestMapping(value = "/Professor/Management")
    public ModelAndView management(String name) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/Professor/Management");
        String hql = "from Professor ";
        if (name != null && !name.equals("")) {
            hql += "WHERE name like '%" + name.trim() + "%'";
        }
        modelAndView.addObject("ProfessorList", professorDao.findAll(hql, Professor.class));
        modelAndView.addObject("ProfessorStatusList", professorStatusDao.findAll("from ProfessorStatus", ProfessorStatus.class));
        return modelAndView;
    }

    @RequestMapping(value = "/Professor/Management", method = RequestMethod.POST)
    public ModelAndView find(String name) throws IOException {
        return management(name);
    }

    @RequestMapping(value = "/Professor/Add", method = RequestMethod.POST)
    public String add(Professor professor, @RequestParam("professorStatus") int professorStatus, @RequestParam("file") MultipartFile file, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("/WEB-INF/pages/Web/UserFile/ProfessorPicture/");
        ProfessorStatus professorStatusObject = professorStatusDao.get(ProfessorStatus.class, professorStatus);
        professor.setProfessor_status(professorStatusObject);
        // 判断文件是否存在
        if (!file.isEmpty() && file.getContentType().equals("image/jpeg")) {
            UUID uuid = UUID.randomUUID();
            String guid = uuid.toString().replaceAll("-", "");
            String path = realPath + "/" + guid + ".jpg";
            File localFile = new File(path);
            try {
                file.transferTo(localFile);
                professor.setPicture(guid + ".jpg");
            } catch (Exception e) {
                e.printStackTrace();
                professor.setPicture("");
            }
        } else {
            professor.setPicture("");
        }
        professorDao.save(professor);
        return "redirect:/Professor/Management";
    }

    @RequestMapping(value = "/Professor/List")
    public ModelAndView list() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/Professor/List");
        modelAndView.addObject("ProfessorList", professorDao.findAll("from Professor Where professor_status = 1", Professor.class));
        return modelAndView;
    }

    @RequestMapping(value = "/Professor/Edit/{id}")
    public ModelAndView edit0(@PathVariable("id") int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Web/Professor/Edit");
        modelAndView.addObject("Professor", professorDao.get(Professor.class, id));
        modelAndView.addObject("ProfessorStatusList", professorStatusDao.findAll("from ProfessorStatus", ProfessorStatus.class));
        return modelAndView;
    }

    @RequestMapping(value = "/Professor/Edit/{id}", method = RequestMethod.POST)
    public String edit1(Professor professor, @RequestParam("professorStatus") int professorStatus, @RequestParam("file") MultipartFile file, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("/WEB-INF/pages/Web/UserFile/ProfessorPicture/");
        ProfessorStatus professorStatusObject = professorStatusDao.get(ProfessorStatus.class, professorStatus);
        professor.setProfessor_status(professorStatusObject);
        Boolean isSaveFileSuccess = false;
        // 判断文件是否存在
        if (!file.isEmpty() && file.getContentType().equals("image/jpeg")) {
            UUID uuid = UUID.randomUUID();
            String guid = uuid.toString().replaceAll("-", "");
            String path = realPath + "/" + guid + ".jpg";
            File localFile = new File(path);
            try {
                file.transferTo(localFile);
                professor.setPicture(guid + ".jpg");
                isSaveFileSuccess = true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (!isSaveFileSuccess) {
            Professor oldProfessor = professorDao.get(Professor.class, professor.getId());
            professor.setPicture(oldProfessor.getPicture());
        }
        professorDao.update(professor);
        return "redirect:/Professor/Management";
    }

    @RequestMapping(value = "/Professor/Delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam(value = "infoList") String infoList) {
        String[] professorIds = infoList.split(",");
        for (String id : professorIds) {
            professorDao.delete(Professor.class, Integer.parseInt(id.trim()));
        }
        return "success";
    }
}
