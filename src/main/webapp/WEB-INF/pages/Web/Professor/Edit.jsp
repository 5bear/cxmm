<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>新闻管理</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=application.getContextPath()%>/Web/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="<%=application.getContextPath()%>/Web/Upload/back/css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/Web/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/Web/Upload/back/css/style.css">
    <link href="<%=application.getContextPath()%>/Web/suyati-line-control/editor.css" type="text/css" rel="stylesheet"/>
</head>

<body>

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="../Backstage/NavigationBar.jsp">
        <jsp:param name="pageName" value="professor"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="newsm.html"><i class="icon-dashboard"></i>新闻管理</a></li>
                </ol>
            </div>
            <form:form class="form-horizontal" id="add_admin" novalidate="novalidate" method="post"
                       enctype="multipart/form-data" modelAttribute="news" accept-charset="utf-8"
                       onsubmit="$('#txtEditor')[0].value = $('#txtEditor').Editor('getText')">
                <div class="modal-body">
                    <div class="form-group"><label class="control-label col-md-3">专家姓名</label>
                        <div class="col-md-7">
                            <input type="text" name="name" class="form-control" placeholder="姓名"
                                   value="${Professor.name}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">手机号码</label>
                        <div class="col-md-7">
                            <input type="text" name="phone" class="form-control" placeholder="手机号码"
                                   value="${Professor.phone}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">邮箱</label>
                        <div class="col-md-7">
                            <input type="text" name="email" class="form-control" placeholder="邮箱"
                                   value="${Professor.email}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">推荐链接</label>
                        <div class="col-md-7">
                            <input type="text" name="link" class="form-control" placeholder="推荐链接"
                                   value="${Professor.link}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">职称</label>
                        <div class="col-md-7">
                            <input type="text" name="title" class="form-control" placeholder="职称"
                                   value="${Professor.title}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">简介</label>
                        <div class="col-md-7">
                            <textarea type="text" name="introduction" class="form-control" placeholder="简介">${Professor.introduction}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">上传照片</label>
                        <div class="col-md-5">
                            <img src="<%=application.getContextPath()%>/Web/UserFile/ProfessorPicture/${Professor.picture}"
                                 style="width:200px;">
                            <input type="file" name="file"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">状态</label>
                        <div class="col-md-3">
                            <select class="form-control" name="professorStatus">
                                <c:forEach items="${ProfessorStatusList}" var="professorStatus">
                                    <option value='${professorStatus.professorStatusId}'>${professorStatus.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-success" value="保存" onclick=""/>
                </div>
            </form:form>
        </div><!-- /.row -->

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="<%=application.getContextPath()%>/Web/jquery/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/Web/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>