<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <title>企业动态</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/Web/Upload/img/style.css"/>
    <link href="http://mat1.gtimg.com/www/base/base.css" rel="stylesheet" type="text/css">
    <link href="<%=application.getContextPath()%>/Web/css/news-css_07.css" rel="stylesheet" type="text/css">
    <script src="http://mat1.gtimg.com/joke/Koala/Qfast1.0.1.js" type="text/javascript"></script>
    <script src="http://mat1.gtimg.com/www/js/Koala/Koala.min.1.5.js" type="text/javascript"></script>
    <style type="text/css">

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
        .navbar {
            padding: 50px 0;
        }
    </style>
</head>
<body class="login">
<div style="background-image: url(<%=application.getContextPath()%>/Web/Upload/images/pic1.png);"
     class="flexslider">
    <div class="fh5co-overlay"></div>
    <div class="fh5co-text">
        <div class="navbar">
            <div align="center">
                <table>
                    <tr>
                        <jsp:include page="../Backstage/Navi.jsp"></jsp:include>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="bar"><b>企业动态</b></div>
<div class="left">
    <div id="hotspot">
        <div class="bd">
            <c:forEach items="${activityList}" var="activity">
                <div class="hot_box line_b1 cl">
                    <a class="pic" href="#" target="_blank">
                        <img style="width:150px;max-height: 150px;"
                             src="<%=application.getContextPath()%>/Web/UserFile/ActivityPicture/${activity.showPicture}"/></a>
                    <div class="ti">
                        <h3 class="lv">
                            <a href="<%=request.getContextPath()%>/Activity/detail?id=${activity.id}"
                               target="_blank">${activity.title}</a></h3>
                        <p class="l24">
                            <span class="hui"></span>
                                <span class="hei">${activity.summary}<a
                                        href="<%=request.getContextPath()%>/Activity/detail?id=${activity.id}"
                                        target="_blank">[详细]</a></span></p>
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
