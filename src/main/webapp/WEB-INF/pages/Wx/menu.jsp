<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/17
  Time: 16:55
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
  <link href="css/test.css" rel="stylesheet">
  <style>
    .float-btn{
      position: fixed;
      bottom: 0;
      height: auto;
      width: 100%;
      background-color: rgba(255,255,255,0.65);
      text-align: center;

    }
    .float-btn a{
      margin-bottom: 5%;

    }
  </style>
</head>
<body data-role="page">
<div class="bg-wrapper pg3">
  <div class="hdp"><img src="img/head-pic.png" alt=""></div>
  <div class="lp"><img src="img/intro.png" alt=""></div>
</div>
<div class="float-btn"><a href="<%=request.getContextPath()%>/Wx/purchase" class="btn">立即购买</a></div>
<script src="js/jquery-1.9.0.js"></script>
<script>
</script>
</body>

</html>
