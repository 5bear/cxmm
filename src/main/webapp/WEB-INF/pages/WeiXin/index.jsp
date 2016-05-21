<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/17
  Time: 17:08
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
<div class="bg-wrapper pg1">
  <div class="back" ><img width="60%" src="img/back.png" alt="" onclick="javascript:location.href='test'"></div>
  <div class="slogan"><img  src="img/word-01.png" alt="">  </div>
</div>
<script src="js/jquery-1.9.0.js"></script>

<script>
  $(function() {
    $(".back>img").delay(400).fadeIn(500);
    $(".slogan>img").delay(1000).fadeIn();
  })
</script>
</body>

</html>
