<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/16
  Time: 23:12
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
</head>

<body data-role="page">
<div class="bg-wrapper pg3">
  <form action="" method="post" name="myForm">
    <c:forEach items="${list}" var="question1">
      <div class="captain"> 第${question1.id}题（单选题）</div>
      <div class="qblock">
        <input name="q${question1.id}" type="radio" value="1">A. ${question1.option1}
        <br>
        <input name="q${question1.id}" type="radio" value="2">B. ${question1.option2}
        <br>
        <input name="q${question1.id}" type="radio" value="3">C. ${question1.option3}
        <br>
        <input name="q${question1.id}" type="radio" value="4">D. ${question1.option4}
        <br>
        <input name="q${question1.id}" type="radio" value="5">E. ${question1.option5}
        <br>
        <input name="q${question1.id}" type="radio" value="6">F. ${question1.option6}
        <br>
        <input name="q${question1.id}" type="radio" value="7">G. ${question1.option7}
        <br>
        <input name="q${question1.id}" type="radio" value="8">H. ${question1.option8}
        <br>
        <input name="q${question1.id}" type="radio" value="9">I. ${question1.option9}
        <br>
      </div>
    </c:forEach>

  <input type="submit" class="btn" value="完成测试">
  </form>
</div>
<script src="js/jquery-1.9.0.js"></script>
<script>
  function check(){
    for(var i=1;i<6;i++){
      var flag=true
      var names=document.getElementsByName("q"+i);
      for(var j=0;j<names.length;j++){
        if(names[j].checked==true)
           flag=false
      }
      if(flag){
        alert("问题"+j+"未填写");
        return true;
      }
    }
    var myForm=document.getElementsByName("myForm");
    myForm[0].submit();
  }
</script>
</body>

</html>

