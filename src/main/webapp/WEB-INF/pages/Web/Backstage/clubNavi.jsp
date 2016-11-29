<%@ page import="com.springapp.entity.Club" %>

<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/13
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Club club= (Club) session.getAttribute("club");
  String pageName= request.getParameter("pageName");
  System.out.print(pageName);
%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">会所后台管理</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav side-nav">
      <li class="<%=pageName.equals("index")?"active":"dropdowm"%>"><a href="<%=request.getContextPath()%>/index"><i class="fa fa-dashboard"></i> 首页</a></li>
      <li class="<%=pageName.equals("test")?"active":"dropdowm"%>">
        <a href="<%=request.getContextPath()%>/Question1/Test" target="_blank"><i class="fa fa-bar-chart-o"></i> 体质评估</a>
      </li>
      <li class="<%=pageName.equals("pointerRecord")?"active":"dropdowm"%>">
        <a href="<%=request.getContextPath()%>/Club/pointRecord"><i class="fa fa-bar-chart-o"></i> 评估记录</a>
      </li>
      <li class="<%=pageName.equals("order")?"active":"dropdowm"%>">
        <a href="<%=request.getContextPath()%>/Club/clubOrder"><i class="fa fa-bar-chart-o"></i> 订单记录</a>
      </li>
      <li class="<%=pageName.equals("changePassword")?"active":"dropdowm"%>">
        <a href="<%=request.getContextPath()%>/Club/changePassword"><i class="fa fa-bar-chart-o"></i> 修改密码</a>
      </li>
      <li class="<%=pageName.equals("logout")?"active":"dropdowm"%>">
        <a href="<%=request.getContextPath()%>/logout?role=club"><i class="fa fa-bar-chart-o"></i> 注销</a>
      </li>


    </ul>

    <ul class="nav navbar-nav navbar-right navbar-user">
      <li class="dropdown user-dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">会所账号 <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="#"><i class="fa fa-user"></i> <%=club.getClub()%></a></li>
          <li><a href="#"><i class="fa fa-gear"></i> <%=club.getInvalidDate()%></a></li>
          <li class="divider"></li>
          <li><a href="/logout?role=club"><i class="fa fa-power-off"></i> 注销</a></li>
        </ul>
      </li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>
