<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <title>月子餐</title>
  <meta name="viewport" content="target-densitydpi=device-dpi, width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
  <link href="css/style.css" rel="stylesheet">
  <link href="css/normalize.css" rel="stylesheet">
  <link href="css/dt.css" rel="stylesheet">
</head>

<body data-role="page">
<!--   <div class="container">
      <div class="dt-wrapper">
          <div class="dt-pic"><img src="http://img4.duitang.com/uploads/item/201312/05/20131205172118_4MRjn.jpeg"></div>
          <div class="dt-txt">
              <h1>亲爱的，做完月子重遇更好的自己</h1>
              <a href="">你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在...</a>
          </div>
      </div>
       <hr>

        <div class="dt-wrapper">
          <div class="dt-pic"><img src="http://img4.duitang.com/uploads/item/201312/05/20131205172118_4MRjn.jpeg"></div>
          <div class="dt-txt">
              <h1>亲爱的，做完月子重遇更好的自己</h1>
              <a href="">你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在...</a>
          </div>
      </div>
       <hr>

        <div class="dt-wrapper">
          <div class="dt-pic"><img src="http://img4.duitang.com/uploads/item/201312/05/20131205172118_4MRjn.jpeg"></div>
          <div class="dt-txt">
              <h1>亲爱的，做完月子重遇更好的自己</h1>
              <a href="">你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在...</a>
          </div>
      </div>
       <hr>

        <div class="dt-wrapper">
          <div class="dt-pic"><img src="http://img4.duitang.com/uploads/item/201312/05/20131205172118_4MRjn.jpeg"></div>
          <div class="dt-txt">
              <h1>亲爱的，做完月子重遇更好的自己</h1>
              <a href="">你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在逗我你一定是在...</a>
          </div>
      </div>
       <hr>

  </div>
   -->
<div class="bg">
  <c:forEach items="${list}" var="activity">
    <div class="block">
      <div class="dt-wrapper">
        <div class="dt-pic"><img src="<%=request.getContextPath()%>/Web/UserFile/ActivityPicture/${activity.showPicture}"></div>
        <div class="dt-txt">
          <h1>${activity.title}</h1>
          <a href="<%=request.getContextPath()%>/WeiXin/detail?id=${activity.id}">${activity.summary}</a>
        </div>
      </div>

    </div>
  </c:forEach>
</div>
<script src="js/jquery-1.9.0.js"></script>

<script>
  $(function() {

  })
</script>
</body>

</html>

