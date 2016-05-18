<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/16
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>月子餐</title>
  <meta name="viewport" content="target-densitydpi=device-dpi, width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
  <link href="css/style.css" rel="stylesheet">
  <link href="css/normalize.css" rel="stylesheet">
  <link href="css/test.css" rel="stylesheet">
</head>

<body data-role="page">
<div class="bg-wrapper pg3">
  <h1 class="multi-header">请完成精准测评  提升方案针对性</h1>
  <div class="multi-qblock">

    <form:form class="form-horizontal" role="form" modelAttribute="answers"
             name="myForm"  action="" method="post" novalidate="novalidate">
      <div class="wd4"><img src="img/word-04.png" alt=""><br><span>（多 选）</span></div>
      <c:forEach items="${Question2List}" var="question2">
        <input name="answers" type="checkbox" value="${question2.id}">${question2.id}.${question2.question}<hr>
      </c:forEach>
      <input name="openID" value="${openID}" style="display: none">
    </form:form>

  </div>
  <input type="button" onclick="submitForm()" class="btn" value="开始提交">
</div>
<script src="js/jquery-1.9.0.js"></script>
<script>
</script>
</body>
<script>
  function submitForm(){
    var myForm=document.getElementsByName("myForm")[0];
    myForm.submit();
  }
</script>
</html>