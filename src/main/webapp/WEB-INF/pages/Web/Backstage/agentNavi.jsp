<%@ page import="com.springapp.entity.Agent" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/13
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Agent agent= (Agent) session.getAttribute("agent");
  String pageName=request.getParameter("pageName");
%>
<script src="<%=request.getContextPath()%>/Web/Upload/back/js/jquery-1.10.2.js"></script>
<script src="<%=request.getContextPath()%>/Web/Upload/back/js/bootstrap.js"></script>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">代理点管理</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav side-nav">
      <li class="<%=pageName.equals("secondary")?"active":"dropdown"%>">
        <a href="/Agency/secondary"><i class="fa fa-bar-chart-o"></i>二级代理管理</a>
      </li>
      <li class="<%=pageName.equals("joinerm")?"active":"dropdown"%>">
        <a href="/Agency/joinerm"><i class="fa fa-bar-chart-o"></i> 评估记录</a>
      </li>
      <li class="<%=pageName.equals("dlchangePassword")?"active":"dropdown"%>">
        <a href="/Agency/dlchangePassword"><i class="fa fa-bar-chart-o"></i> 修改密码</a>
      </li>
      <li class="<%=pageName.equals("logout")?"active":"dropdown"%>">
        <a href="/logout?role=agent"><i class="fa fa-bar-chart-o"></i> 注销</a>
      </li>


    </ul>

    <ul class="nav navbar-nav navbar-right navbar-user">
      <li class="dropdown user-dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">账号 <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="#"><i class="fa fa-user"></i><%=agent.getAgent()%></a></li>
          <li class="divider"></li>
          <li><a href="/logout?role=agent"><i class="fa fa-power-off"></i> 注销</a></li>
        </ul>
      </li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>
