<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/17
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>月子餐</title>
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/normalize.css" rel="stylesheet">
    <link href="css/test.css" rel="stylesheet">
</head>

<body data-role="page">
<div class="bg-wrapper pg3">
    <div class="captain">申请成为禅心伙伴</div>
    <form action="<%=application.getContextPath()%>/Wx/Apply" method="post">
        <div class="qblock">
            <label for="agent">姓名</label> <input name="agent" id="agent" type="text" value=""><br>
            <hr>
            <label for="phoneNum">手机</label> <input name="phoneNum" id="phoneNum" type="text" value=""><br>
            <hr>
            <label for="recommend">推荐人</label> <input name="recommend" id="recommend" type="text" value=""><br>
        </div>
        <input type="submit" class="btn" value="点击申请">
    </form>
</div>
<script src="js/jquery-1.9.0.js"></script>
</body>

</html>
