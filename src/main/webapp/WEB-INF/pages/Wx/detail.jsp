<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/20
  Time: 22:34
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
  <link href="css/dt.css" rel="stylesheet">
</head>

<body data-role="page">
<div class="container">
  <h1>${activity.title}</h1>
  <div><span class="time">${activity.createtime}</span><span class="author">&nbsp;禅心妈妈</span></div>
  <hr>
  <div class="content">
    <div class="short">${activity.summary}</div>
    <p>${activity.content}</p>
  </div>

</div>
<script src="js/jquery-1.9.0.js"></script>

<script>
  $(function() {

  })
</script>
</body>

</html>
