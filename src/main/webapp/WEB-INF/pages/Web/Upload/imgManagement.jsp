<%@ page import="com.springapp.entity.Admin" %>
<%--
  Created by IntelliJ IDEA.
  User: 11369
  Date: 2016/6/12
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Admin admin= (Admin) session.getAttribute("admin");
  if(admin==null)
  {
    response.sendRedirect(request.getContextPath()+"/login");
    return;
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="pragma" content="no-cache" />
  <meta name="description" content="">
  <meta name="author" content="">

  <title>后台管理</title>

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/Web/Upload/back/css/bootstrap.css" rel="stylesheet">

  <!-- Add custom CSS here -->
  <link href="<%=request.getContextPath()%>/Web/Upload/back/css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/back/font-awesome/css/font-awesome.min.css">
  <style>
    .pic-table img {
      width: 300px;
    }
  </style>
</head>

<body>

<div id="wrapper">

  <!-- Sidebar -->
  <jsp:include page="../Backstage/NavigationBar.jsp" flush="true">
  <jsp:param name="pageName" value="imgManagement"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="#"><i class="icon-dashboard"></i>首页</a></li>
          <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
        </ol>
      </div>

      <div class="col-lg-12">
        <table class="table table-striped table-bordered table-hover table-checkable pic-table" cellspacing="0" width="100%">
          <thead>
          <tr>
            <th width="100">图片序号</th>
            <th width="200">上传操作</th>
            <th>图片预览</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>1</td>
            <td>
              <form name="form1" action="" method="post" enctype="multipart/form-data">
                  <input type="file" name="file" onchange="submitBtn(1)">
                  <input type="text" value="bg1" name="fileName" style="display: none">
              </form>
            </td>
            <td>
              <img src="<%=request.getContextPath()%>/Web/Upload/images/bg1.jpg" id="imgArea1" alt="图片1">
            </td>
          </tr>
          <tr>
            <td>2</td>
            <td>
              <form name="form2" action="" method="post" enctype="multipart/form-data">
                <input type="file" name="file" onchange="submitBtn(2)">
                <input type="text" value="bg2" name="fileName" style="display: none">
              </form>
            </td>
            <td>
              <img src="<%=request.getContextPath()%>/Web/Upload/images/bg2.jpg" id="imgArea2" alt="图片2">
            </td>
          </tr>

          <tr>
            <td>3</td>
            <td>
              <form name="form3" action="" method="post" enctype="multipart/form-data">
                <input type="file" name="file" onchange="submitBtn(3)">
                <input type="text" value="bg3" name="fileName" style="display: none">
              </form>
            </td>
            <td>
              <img src="<%=request.getContextPath()%>/Web/Upload/images/bg3.jpg" id="imgArea3" alt="图片3">
            </td>
          </tr>
          <tr>
            <td>4</td>
            <td>
              <form name="form4" action="" method="post" enctype="multipart/form-data">
                <input type="file" name="file" onchange="submitBtn(4)">
                <input type="text" value="bg4" name="fileName" style="display: none">
              </form>
            </td>
            <td>
              <img src="<%=request.getContextPath()%>/Web/Upload/images/bg4.jpg" id="imgArea4" alt="图片4">
            </td>
          </tr>
          </tbody>
        </table>
      </div>

    </div><!-- /#page-wrapper -->

  </div><!-- /#wrapper -->
</div>
  <!-- JavaScript -->
<script src="<%=request.getContextPath()%>/Web/Upload/back/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/Web/Upload/back/js/jquery.form.js"></script>
  <script src="<%=request.getContextPath()%>/Web/Upload/back/js/bootstrap.js"></script>
  <script>
    $(function(){
      $("#history").dropdown('toggle');
    });
    function submitBtn(type) {
      console.log("success")
      var form = $("form[name=form"+type+"]");
      var options  = {
        url:'imgManagement',
        type:'post',
        success:function(data)
        {
          console.log(data)
          /*$("#imgArea"+type).attr("src","<%=request.getContextPath()%>/Web/Upload/images/"+data);*/
          location.reload(true)
        }
      };
      form.ajaxSubmit(options);
      //$("#fileForm").submit();
    }
  </script>

</body>
</html>
