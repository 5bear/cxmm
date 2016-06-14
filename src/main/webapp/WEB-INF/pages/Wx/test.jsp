<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/17
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>禅心妈妈</title>
  <meta name="viewport" content="target-densitydpi=device-dpi, width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
  <link href="css/style.css" rel="stylesheet">
  <link href="css/normalize.css" rel="stylesheet">
</head>

<body data-role="page">
<div class="bg-wrapper pg2">
  <div class="wd2"><img src="img/word-02.png" alt="">  </div>
  <div class="zhentu"><img src="img/zhentu.png" alt=""></div>
  <div class="wd3"><img src="img/word-03.png" alt=""></div>
  <a style="display:none" href="<%=request.getContextPath()%>/Wx/test1" class="btn">开始测试</a>
</div>
<script src="js/jquery-1.9.0.js"></script>

<script>
  $(function() {
    $(".wd2>img").delay(400).fadeIn();
    $(".zhentu>img").delay(800).fadeIn();
    $(".wd3>img").delay(800).fadeIn();
    $(".btn").delay(1000).fadeIn();
  })
</script>
</body>

</html>