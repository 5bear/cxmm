<%@ page import="com.springapp.entity.Admin" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/9
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Admin admin= (Admin) session.getAttribute("admin");
    String pageFather = request.getParameter("pageFather");
    if(pageFather==null)
        pageFather="empty";
    String pageName = request.getParameter("pageName");
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
        <a class="navbar-brand" href="#">后台管理</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav side-nav">
            <li class="dropdown"><a href="<%=request.getContextPath()%>/index"><i class="fa fa-dashboard"></i> 首页</a></li>
            <li <%if(pageName.equals("Agency")){%>class="active"<%}else{%>class="dropdown"<%}%>>
                <a href="<%=request.getContextPath()%>/Agency"><i class="fa fa-bar-chart-o"></i>代理点管理</a>
            </li>
            <li <%if(pageName.equals("Club")){%>class="active"<%}else{%>class="dropdown"<%}%>>
                <a href="<%=request.getContextPath()%>/Club"><i class="fa fa-bar-chart-o"></i>会所管理</a>
            </li>
            <li <%if(pageFather.equals("Evaluate")){%>class="dropdown open"<%}else{%>class="dropdown"<%}%>>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-table"></i> 评估记录 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li <%if(pageName.equals("evaluate1")){%>class="active"<%}else{%>class="dropdown"<%}%>><a href="<%=request.getContextPath()%>/Evaluate/evaluate1">禅心评估</a></li>
                    <li <%if(pageName.equals("evaluate2")){%>class="active"<%}else{%>class="dropdown"<%}%>><a href="<%=request.getContextPath()%>/Evaluate/evaluate2">代理点评估</a></li>
                    <li <%if(pageName.equals("evaluate3")){%>class="active"<%}else{%>class="dropdown"<%}%>><a href="<%=request.getContextPath()%>/Evaluate/evaluate3">会所评估</a></li>
                </ul>
            </li>
            <li <%if(pageName.equals("Order")){%>class="active"<%}else{%>class="dropdown"<%}%>>
                <a href="<%=request.getContextPath()%>/Order"><i class="fa fa-bar-chart-o"></i> 订单管理</a>
            </li>
            <li <%if(pageName.equals("certi")){%>class="active"<%}else{%>class="dropdown"<%}%>>
                <a href="<%=request.getContextPath()%>/Train/certi"><i class="fa fa-bar-chart-o"></i> 证书管理</a>
            </li>
            <li <%if(pageName.equals("professor")){%>class="active"<%}else{%>class="dropdown"<%}%>>
                <a href="<%=request.getContextPath()%>/Professor/Management"><i class="fa fa-bar-chart-o"></i> 专家管理</a>
            </li>
            <li <%if(pageName.equals("book")){%>class="active"<%}else{%>class="dropdown"<%}%>>
                <a href="<%=request.getContextPath()%>/BookManage"><i class="fa fa-bar-chart-o"></i>书库管理</a>
            </li>
           <%-- <li <%if(pageName.equals("News")){%>class="active"<%}else{%>class="dropdown"<%}%>>
                <a href="<%=request.getContextPath()%>/News/Management"><i class="fa fa-bar-chart-o"></i> 新闻管理</a>
            </li>--%>
            <li <%if(pageName.equals("Activity")){%>class="active"<%}else{%>class="dropdown"<%}%>>
                <a href="<%=request.getContextPath()%>/Activity/Management"><i class="fa fa-bar-chart-o"></i> 企业动态</a>
            </li>
            <li <%if(pageName.equals("Share")){%>class="active"<%}else{%>class="dropdown"<%}%>>
                <a href="<%=request.getContextPath()%>/Share/Management"><i class="fa fa-bar-chart-o"></i>禅心分享</a>
            </li>
            <li <%if(pageName.equals("changepwd")){%>class="active"<%}else{%>class="dropdown"<%}%>>
                <a href="<%=request.getContextPath()%>/changePassword"><i class="fa fa-bar-chart-o"></i> 修改密码</a>
            </li>
            <li class="dropdown">
                <a href="<%=request.getContextPath()%>/logout?role=admin"><i class="fa fa-bar-chart-o"></i> 注销</a>
            </li>
        </ul>

        <ul class="nav navbar-nav navbar-right navbar-user">
            <li class="dropdown user-dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">管理员 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="#"><i class="fa fa-user"></i><%=admin.getAccount()%></a></li>
                    <li class="divider"></li>
                    <li><a href="<%=request.getContextPath()%>/logout?role=admin"><i class="fa fa-power-off"></i> 注销</a></li>
                </ul>
            </li>
        </ul>
    </div><!-- /.navbar-collapse -->
</nav>