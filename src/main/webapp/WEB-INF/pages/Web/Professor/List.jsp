<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <title>专家</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/login/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/login/css/style.css">
    <script src="<%=request.getContextPath()%>/Web/Upload/login/js/modernizr.js"></script>
    <link href="<%=request.getContextPath()%>/Web/Upload/web/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <script src="<%=request.getContextPath()%>/Web/Upload/web/js/jquery-1.11.0.min.js"></script>
    <link href="<%=request.getContextPath()%>/Web/Upload/web/css/style.css" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
        table {
            border-left: 1px solid #fff;
            border-right: 1px solid #fff;
            border-top: 1px solid #fff;
            border-bottom: 1px solid #fff;
        }

        td {
            font-family: "Roboto Slab", sans-serif;
            font-size: 18px;
            font-weight: 900;
            color: #f1715e;
            border-right: 0px solid #fff;
            padding: 15px 30px;
            text-align: center;
            width: 300px;
            cursor: pointer;
        }
    </style>
</head>

<body class="login">
<div class="content" width:1200px; margin:0px auto 0;>
    <div class="main">
        <div id="fh5co-home">
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
                    </div>
                    <br><br>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<div class="login_m">
    <div class="about" id="about">
        <div class="container">
            <% int i = 0;%>
            <c:forEach items="${ProfessorList}" var="professor">
                <% if (i % 2 == 0) {%>
                <div class="row about-row">
                    <div class="col-md-3 about-row-column">
                        <img src="<%=application.getContextPath()%>/Web/UserFile/ProfessorPicture/${professor.picture}" alt=""/>
                    </div>
                    <div class="col-md-9 about-column">
                        <h3>${professor.name}</h3>
                        <h5>${professor.title}</h5>
                        <p>${professor.introduction}</p>
                        <br>
                        <a href="${professor.link}">专家推荐链接</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <% } else {%>
                <div class="row about-row">
                    <div class="col-md-9 about-column">
                        <h3>${professor.name}</h3>
                        <h5>${professor.title}</h5>
                        <p>${professor.introduction}</p>
                        <a href="${professor.link}">专家推荐链接</a>
                    </div>
                    <div class="col-md-3 about-row-column">
                        <img src="<%=application.getContextPath()%>/Web/UserFile/ProfessorPicture/${professor.picture}" alt=""/>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <% }
                    i++;%>
            </c:forEach>
        </div>
    </div>
</div><!--login_m end-->
</body>
</html>