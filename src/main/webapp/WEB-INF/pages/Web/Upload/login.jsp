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

    .nav {
      padding: 50px 0;;
    }
  </style>
</head>

<body class="login" >
<div class="content" >

  <div class="main">
    <div  id="fh5co-home">
      <div style="background-image: url(<%=request.getContextPath()%>/Web/Upload/images/pic1.png);" class="flexslider">
        <div class="fh5co-overlay"></div>
        <div class="fh5co-text">
          <div class="nav">
            <div align="center">
              <table>
                <jsp:include page="../Backstage/Navi.jsp"></jsp:include>
              </table>
            </div>
            </nav>
          </div>
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
        <select style="margin-left: 17px;border: 1px solid #d2d8d8;width: 374px;height: 26px;background-color: rgb(250, 255, 189);line-height: 52px" onchange="showForm(this)">
          <option value="1">后台</option>
          <option value="2">代理点</option>
        </select>
        <div id="form1" >
          <form:form modelAttribute="admin" action="" method="post" class="cd-form">
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
        <div style="display: none" id="form2" >
          <form:form modelAttribute="agent" action="agentLogin" method="post" class="cd-form">
            <p class="fieldset">
              <label class="image-replace cd-username">用户名</label>
              <input class="full-width has-padding has-border" name="account"  placeholder="用户名" >
            </p>

            <p class="fieldset">
              <label class="image-replace cd-password"  for="signin-password">密码</label>
              <input class="full-width has-padding has-border" type="password" name="password"  placeholder="******">
              <!--<a href="#0" class="hide-password">显示密码</a>-->
              <span style="color: red">${error}</span>
            </p>
            <p class="fieldset">
              <input class="full-width" type="submit" value="登陆">
            </p>
          </form:form>
        </div>

      </div>
    </div>


    <!--login_padding  Sign up end-->
  </div><!--login_boder end-->
</div><!--login_m end-->
</body>
<script>
  function showForm(obj){
    var id=obj.selectedIndex
    console.log(id)
    var form1=document.getElementById("form1")
    var form2=document.getElementById("form2")
    if(id==0){
      form1.style.display="";
      form2.style.display="none"
    }else{
      form2.style.display="";
      form1.style.display="none"
    }
  }
</script>
</html>