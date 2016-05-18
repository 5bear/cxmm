package com.springapp.servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

public class UploadFileServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //获取对应名称在物理磁盘中的绝对路径
        //上传文件保存的目录
        String saveFileDir = req.getRealPath("/WEB-INF/pages/PDFs/in");

        System.out.println(saveFileDir);
        /**
         * setRepository：用于保存当文件大于默认的上传文件大小时
         * File :将要上传的文件保存在一个临时的目录中
         */

        factory.setRepository(new File(saveFileDir));

        /**
         * 设置默认上传文件的大小默认为10k
         */
        factory.setSizeThreshold(1024);

        //创建ServletFileUpload 对象
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            List<FileItem> list = upload.parseRequest(req);

            for (FileItem f : list) {
                //System.out.println(name);
                //为ture时，表示一个普通的文本框
                //获取表单中填写的内容，普通文本是输入的内容，当是一个文件时表示文件名字
                String name = f.getFieldName();
                if (f.isFormField())//判断是否是上传的一个文件
                {
                    String username = f.getString();

                    System.out.println("username :" + username);
                    req.setAttribute(name, username);
                } else//表示一个上传的是个文件
                {
                    //获取上传的文件的名字
                    String fileName = f.getName();

                    //处理不同浏览器的兼容性问题
                    int start = fileName.lastIndexOf("\\");

                    fileName = fileName.substring(start + 1);
                    System.out.println("上传的文件名字是:" + fileName);

                    //将form表单中的属性name作为name 文件名字作为value
                    req.setAttribute(name, fileName);
                    //fileUpload组件提供的方法【简便的方法】
                    //f.write(new File(saveFileDir,fileName));

                    //下面手动完成创建,会产生临时文件
                    OutputStream output = new FileOutputStream(new File(saveFileDir, fileName));

                    InputStream in = f.getInputStream();

                    //获取上传文件总的字节数
                    long size = f.getSize();
                    double sum = 0;
                    byte[] buffer = new byte[1024];
                    int len = 0;
                    while ((len = in.read(buffer)) != -1) {
                        sum += len;
                        output.write(buffer, 0, len);
                      /*  //在此处可完成进度的设置
                        System.out.println(100 * sum / size + "%");*/
                    }
                    in.close();
                    output.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //req.getRequestDispatcher("/Question1/Test").forward(req, resp);
        resp.sendRedirect("BookManage");
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
