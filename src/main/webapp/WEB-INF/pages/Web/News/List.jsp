<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <title>新闻</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/Web/Upload/img/style.css"/>
    <link href="http://mat1.gtimg.com/www/base/base.css" rel="stylesheet" type="text/css">
    <link href="<%=application.getContextPath()%>/Web/css/news-css_07.css" rel="stylesheet" type="text/css">
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
<body class="login">
<div style="background-image: url(<%=application.getContextPath()%>/Web/Upload/images/pic1.PNG);"
     class="flexslider">
    <div class="fh5co-overlay"></div>
    <div class="fh5co-text">
        <br><br><br><br>
        <div>
            <div align="center">
                <table>
                    <tr>
                        <jsp:include page="../Backstage/Navi.jsp"></jsp:include>
                    </tr>
                </table>
            </div>
        </div>
        <br><br><br><br>
    </div>
</div>
<div class="bar"><b>新闻资讯</b></div>
<div class="left">
    <div id="hotspot">
        <div class="bd">
            <c:forEach items="${NewsList}" var="news">
                <div class="hot_box line_b1 cl">
                    <a class="pic" href="news.html" target="_blank">
                        <img style="width:150px;max-height: 150px;"
                             src="<%=application.getContextPath()%>/Web/UserFile/NewsPicture/${news.showPicture}"/></a>
                    <div class="ti">
                        <h3 class="lv">
                            <a href="<%=application.getContextPath()%>/News/Detail/${news.id}"
                               target="_blank">${news.title}</a></h3>
                        <p class="l24">
                            <span class="hui"></span>
                                <span class="hei">${news.summary}…[<a
                                        href="<%=application.getContextPath()%>/News/Detail/${news.id}"
                                        target="_blank">详细</a>]</span></p>
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
