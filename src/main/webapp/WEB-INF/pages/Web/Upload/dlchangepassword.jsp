<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/13
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.springapp.entity.Agent" %><%
  Agent agent= (Agent) session.getAttribute("agent");
  if(agent==null){
    response.sendRedirect("login");
    return;
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>修改密码</title>

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/Web/Upload/back/css/bootstrap.css" rel="stylesheet">

  <!-- Add custom CSS here -->
  <link href="<%=request.getContextPath()%>/Web/Upload/back/css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/back/font-awesome/css/font-awesome.min.css">
</head>

<body>

<div id="wrapper">

  <!-- Sidebar -->
  <jsp:include page="../Backstage/agentNavi.jsp">
    <jsp:param name="pageName" value="dlchangePassword"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="#"><i class="icon-dashboard"></i>修改密码</a></li>
          <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
        </ol>
      </div>
      <div class="form-group">
        <label class="control-label col-md-3">旧密码</label>
        <div class="col-md-7">
          <input type="text" name="opsw" id="oldPwd" class="form-control"/>
        </div>
      </div><br><br><br>
      <div class="form-group">
        <label class="control-label col-md-3">新密码</label>
        <div class="col-md-7">
          <input type="text" name="npsw" id="newPwd" class="form-control"/>
        </div>
      </div><br><br>
      <div class="form-group">
        <label class="control-label col-md-3">重复新密码</label>
        <div class="col-md-7">
          <input type="text" name="rppsw" id="newPwd2" class="form-control"/>
        </div>
      </div><br><br>
      <div class="modal-footer">
        <input type="button" class="btn btn-success" value="提交" onclick="changePwd()"/>
      </div>
    </div><!-- /.row -->

  </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="<%=request.getContextPath()%>/Web/Upload/back/js/jquery-1.10.2.js"></script>
<script src="<%=request.getContextPath()%>/Web/Upload/back/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/Web/Upload/js/jquery.min.js" type="text/javascript"></script>
<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
<link href="<%=request.getContextPath()%>/Web/Upload/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/Web/Upload/dist/js/datepicker.js"></script>
<script src="<%=request.getContextPath()%>/Web/Upload/dist/js/i18n/datepicker.en.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/js/eModal.js"></script>
<script>
  function changePwd(){
    var oldPwd=$("#oldPwd").val();
    var newPwd=$("#newPwd").val();
    var newPwd2=$("#newPwd2").val();
    if(newPwd!=newPwd2){
      alert("两次密码输入不一致");
      return true;
    }
    $.ajax({
      url:"<%=request.getContextPath()%>/Agency/changePassword",
      type:"post",
      data:{oldPwd:oldPwd,newPwd:newPwd},
      success:function(data){
        if(data=="fail")
          alert("旧密码输入错误")
        else
          location.reload(true)
      }
    })
  }
</script>
</body>
</html>
