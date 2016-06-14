package com.springapp.mvc;

import com.springapp.classes.DateEditor;
import com.springapp.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by ZhanShaoxiong on 2016/5/8.
 */
@Controller
public class BaseController {
    @Autowired
    protected BaseDao baseDao;
    @Autowired
    protected NewsDao newsDao;
    @Autowired
    protected NewsStatusDao newsStatusDao;
    @Autowired
    protected Question1Dao question1Dao;
    @Autowired
    protected Question2Dao question2Dao;
    @Autowired
    protected EvaluationDao evaluationDao;
    @Autowired
    protected Answer1Dao answer1Dao;
    @Autowired
    protected Answer2Dao answer2Dao;
    @Autowired
    protected ProfessorDao professorDao;
    @Autowired
    protected ProfessorStatusDao professorStatusDao;
    @Autowired
    protected ClubDao clubDao;
    @Autowired
    protected AgentDao agentDao;
    @Autowired
    protected Test1Dao test1Dao;
    @Autowired
    protected UserDao userDao;
    @Autowired
    protected TrainDao trainDao;
    @Autowired
    protected Test2Dao test2Dao;
    @Autowired
    protected ActivityDao activityDao;
    @Autowired
    protected BodyconditionDao bodyconditionDao;
    @Autowired
    protected AdminDao adminDao;
    @Autowired
    protected OrderDao orderDao;
    @Autowired
    protected TSDao tsDao;
    @Autowired
    protected WxEvaluationDao wxEvaluationDao;
    protected SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    protected SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd");

    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        //对于需要转换为Date类型的属性，使用DateEditor进行处理
        binder.registerCustomEditor(Date.class, new DateEditor());
    }
}
