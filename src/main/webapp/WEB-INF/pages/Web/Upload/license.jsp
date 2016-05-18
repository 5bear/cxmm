<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/10
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>证书信息</title>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Web/Upload/img/style.css"/>
  <link href="http://mat1.gtimg.com/www/base/base.css" rel="stylesheet" type="text/css">
  <link href="http://health.qq.com/css/index2014/css_07.css" rel="stylesheet" type="text/css">
  <script src="http://mat1.gtimg.com/joke/Koala/Qfast1.0.1.js" type="text/javascript"></script>
  <script src="http://mat1.gtimg.com/www/js/Koala/Koala.min.1.5.js" type="text/javascript"></script>
  <style type="text/css">
    table
    {
      border-left: 1px solid #fff;
      border-right: 1px solid #fff;
      border-top: 1px solid #fff;
      border-bottom: 1px solid #fff;
    }
    td
    {
      font-family: "Roboto Slab", sans-serif;
      font-size: 18px;
      font-weight: 900;
      color: #f1715e;
      border-right: 0px solid #fff;
      padding: 15px 30px;
      text-align: center;
      width:300px;
      cursor:pointer;
    }
  </style>
</head>
<body>
<div class="main">
  <div  id="fh5co-home">
    <div style="background-image: url(<%=request.getContextPath()%>/Web/Upload/images/pic1.PNG);"class="flexslider">
      <div class="fh5co-overlay"></div>
      <div class="fh5co-text">
        <br> <br> <br>
        <div>
          <div align="center">
            <table>
              <tr>
               <jsp:include page="../Backstage/Navi.jsp"></jsp:include>
              </tr>
            </table>
          </div>
          </nav>
        </div>
        <br><br><br>
      </div>
    </div>
  </div>
  <div class="bar"><b>证书信息</b></div>
    <div class="left">
      <div class="main_content">
          <div class="form-group">
              <label class="title1 col-md-3">姓名：</label>
              <label class="title1 col-md-5">爱叫啥叫啥</label>
          </div>
          <div class="form-group">
              <label class="title1 col-md-3">性别：</label>
              <label class="title1 col-md-3">是男是女</label>
          </div>
          <div class="form-group">
              <label class="title1 col-md-3">发证时间：</label>
              <label class="title1 col-md-5">2016/5/10</label>
          </div>
          <div class="form-group">
              <label class="title1 col-md-3">证书编号：</label>
              <label class="title1 col-md-5">1234556789</label>
          </div>
      </div>
    </div>
  <div class="clear"></div>
</div>
</body>
</html>

