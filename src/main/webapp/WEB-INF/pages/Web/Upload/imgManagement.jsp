<%--
  Created by IntelliJ IDEA.
  User: 11369
  Date: 2016/6/12
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>后台管理</title>

  <!-- Bootstrap core CSS -->
  <link href="back/css/bootstrap.css" rel="stylesheet">

  <!-- Add custom CSS here -->
  <link href="back/css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" href="back/font-awesome/css/font-awesome.min.css">
  <style>
    .pic-table img {
      width: 300px;
    }
  </style>
  <script type="text/javascript" src="back/js/jquery.uniform.min.js">
  </script>
</head>

<body>

<div id="wrapper">

  <!-- Sidebar -->
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="back.html">后台管理</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav side-nav">
        <li class="active"><a href="back.html"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li class="dropdown">
          <a href="agency.html"><i class="fa fa-bar-chart-o"></i>代理点管理</a>
        </li>
        <li class="dropdown">
          <a href="club.html"><i class="fa fa-bar-chart-o"></i>会所管理</a>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-table"></i> 评估记录 <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="btestreport1.html">禅心评估</a></li>
            <li><a href="btestreport2.html">代理点评估</a></li>
            <li><a href="btestreport3.html">会所评估</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="certi.html"><i class="fa fa-bar-chart-o"></i> 证书管理</a>
        </li>
        <li class="dropdown">
          <a href="professorm.html"><i class="fa fa-bar-chart-o"></i> 专家管理</a>
        </li>
        <li class="dropdown">
          <a href="newsm.html"><i class="fa fa-bar-chart-o"></i> 新闻管理</a>
        </li>
        <li class="dropdown">
          <a href="bchangepassword.html"><i class="fa fa-bar-chart-o"></i> 修改密码</a>
        </li>
        <li class="dropdown">
          <a href="index.html"><i class="fa fa-bar-chart-o"></i> 注销</a>
        </li>


      </ul>

      <ul class="nav navbar-nav navbar-right navbar-user">
        <li class="dropdown user-dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">管理员 <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#"><i class="fa fa-user"></i> 用户名</a></li>
            <li class="divider"></li>
            <li><a href="index"><i class="fa fa-power-off"></i> 注销</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </nav>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="back.html"><i class="icon-dashboard"></i>首页</a></li>
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
              <input type="file">
            </td>
            <td>
              <img src="images/homepage.jpg" alt="图片1">
            </td>
          </tr>
          <tr>
            <td>2</td>
            <td>
              <input type="file">
            </td>
            <td>
              <img src="images/homepage.jpg" alt="图片1">
            </td>
          </tr>

          <tr>
            <td>3</td>
            <td>
              <input type="file">
            </td>
            <td>
              <img src="images/homepage.jpg" alt="图片1">
            </td>
          </tr>
          <tr>
            <td>4</td>
            <td>
              <input type="file">
            </td>
            <td>
              <img src="images/homepage.jpg" alt="图片1">
            </td>
          </tr>
          </tbody>
        </table>
      </div>

    </div><!-- /#page-wrapper -->

  </div><!-- /#wrapper -->

  <!-- JavaScript -->
  <script src="back/js/jquery-1.10.2.js"></script>
  <script src="back/js/bootstrap.js"></script>
  <script>
    $(function(){
      $("#history").dropdown('toggle');
    });
  </script>

</body>
</html>
