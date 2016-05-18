<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <title>活动</title>
    <link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/Web//Upload/img/style.css"/>
    <link href="http://mat1.gtimg.com/www/base/base.css" rel="stylesheet" type="text/css">
    <link href="<%=application.getContextPath()%>/css/news-css_07.css" rel="stylesheet" type="text/css">
    <script src="http://mat1.gtimg.com/joke/Koala/Qfast1.0.1.js" type="text/javascript"></script>
    <script src="http://mat1.gtimg.com/www/js/Koala/Koala.min.1.5.js" type="text/javascript"></script>
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
<body>
<div class="main">
    <div id="fh5co-home">
        <div style="background-image: url(<%=application.getContextPath()%>/Web/Upload/images/pic1.PNG);"
             class="flexslider">
            <div class="fh5co-overlay"></div>
            <div class="fh5co-text">
                <br> <br> <br>
                <div>
                    <div align="center">
                        <table>
                           <jsp:include page="../Backstage/Navi.jsp"></jsp:include>
                        </table>
                    </div>
                </div>
                <br><br><br>
            </div>
        </div>
    </div>
    <div class="bar"><b>精彩活动</b></div>
    <div class="left">
        <div id="hotspot">
            <div class="bd">
                <c:forEach items="${activityList}" var="news">
                    <div class="hot_box line_b1 cl">
                        <a class="pic" href="#" target="_blank">
                            <img style="width:150px;max-height: 150px;"
                                 src="<%=application.getContextPath()%>/Web/UserFile/ActivityPicture/${news.showPicture}"/></a>
                        <div class="ti">
                          <%--  <h3 class="lv">
                                <a href="<%=application.getContextPath()%>/News/Detail/${news.id}"
                                   target="_blank">${news.title}</a></h3>--%>
                            <p class="l24">
                                <span class="hui"></span>
                                <span class="hei">${news.summary}…[<a
                                        href="${news.url}"
                                        target="_blank">报名参加</a>]</span></p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
</body>
</html>
