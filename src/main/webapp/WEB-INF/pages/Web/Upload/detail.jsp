<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/6/1
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>禅心妈妈</title>
  <style>
    body,
    html {
      font-family: "Microsoft Yahei";
      height: 100%;
      padding: 0;
      margin: 0;
    }

    body {
      background: url("<%=request.getContextPath()%>/Web/Upload/images/background.png") repeat fixed;
    }

    .container {
      width: 80%;
      min-height: 100%;
      background: #fff;
      margin: auto;
    }

    .content {
      padding: 3%;
    }

    .center {
      text-align: center;
    }
    hr {
      border: solid 1px #eee;
    }
  </style>
</head>

<body>
<div class="container">
  <div class="content">
    <h1>${activity.title}</h1>
    <div><span class="time">${activity.createtime}</span><span class="author">admin</span></div>
    <hr>
    <div class="content">
      ${activity.content}
    </div>
  </div>
</div>
</div>
</body>

