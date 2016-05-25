<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/17
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>禅心妈妈</title>
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <link href="<%=application.getContextPath()%>/WeiXin/css/style.css" rel="stylesheet">
    <link href="<%=application.getContextPath()%>/WeiXin/css/test.css" rel="stylesheet">
    <link href="<%=application.getContextPath()%>/WeiXin/css/normalize.css" rel="stylesheet">
</head>

<body data-role="page">
<div class="bg-wrapper pg9">
    <div class="wd7"><img width="60%" src="<%=application.getContextPath()%>/WeiXin/img/word-07.png" alt=""></div>
    <div class="biocode">
        <!-- 如果 不是 伙伴-->
        <!--  <p>您还不是禅心伙伴！</p>
         <a class="btn" href="apply.html">立即申请</a> -->
        <!-- end -->

        <!-- 二维码图片 -->
        <div class="square"><img src="${qrcodepath}" alt=""></div>
    </div>
</div>
<script src="<%=application.getContextPath()%>/WeiXin/js/jquery-1.9.0.js"></script>
<script>
    $(function () {
        $(".ctct>img").delay(400).fadeIn(500);
    })
</script>
</body>

</html>

