<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/13
  Time: 1:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>登陆</title>
  <link href="<%=request.getContextPath()%>/Web/Upload/Wopop_files/style_log.css" rel="stylesheet" type="text/css">
  <!-- Google Fonts -->
  <!--link href='http://fonts.useso.com/css?family=Roboto+Slab:400,700|Roboto:400,300,700' rel='stylesheet' type='text/css'-->
  <!-- Modernizr JS -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/login/css/reset.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/login/css/style.css">
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

<body class="login" >
<div class="content" width:1200px; margin:0px auto 0;>

  <div class="main">
    <div  id="fh5co-home">
      <div style="background-image: url(<%=request.getContextPath()%>/Web/Upload/images/pic1.PNG);" class="flexslider">
        <div class="fh5co-overlay"></div>
        <div class="fh5co-text">
          <br> <br>
          <div>
            <div align="center">
              <table>
                <jsp:include page="../Backstage/Navi.jsp"></jsp:include>
              </table>
            </div>
            </nav>
          </div>
          <br><br>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<div class="login_m">
  <!--div class="login_logo"><img src="" width="196" height="46"></div-->
  <div class="login_boder">
    <div class="flexslider"> <!--style="background-image: url(images/pic1.png);"-->
      <div class="login_padding" id="login_model">

        <form:form modelAttribute="agent" action="" method="post" class="cd-form">
          <p class="fieldset">
            <label class="image-replace cd-username">用户名</label>
            <input class="full-width has-padding has-border" name="account"  placeholder="用户名"  id="signin-email">
          </p>

          <p class="fieldset">
            <label class="image-replace cd-password"  for="signin-password">密码</label>
            <input class="full-width has-padding has-border" type="password" name="password"  id="signin-password" placeholder="******">
            <!--<a href="#0" class="hide-password">显示密码</a>-->
            <span style="color: red">${error}</span>
          </p>
          <p class="fieldset">
            <input class="full-width" type="submit" value="登陆">
          </p>
        </form:form>
      </div>
    </div>


    <!--login_padding  Sign up end-->
  </div><!--login_boder end-->
</div>
</div><!--login_m end-->
</body>
</html>