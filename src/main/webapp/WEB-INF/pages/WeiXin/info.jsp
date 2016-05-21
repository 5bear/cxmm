<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/17
  Time: 17:01
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
  <link href="css/test.css" rel="stylesheet">
  <link href="css/normalize.css" rel="stylesheet">
</head>

<body data-role="page">
<div class="bg-wrapper pg9">
  <div class="wd6"><img width="40%" src="img/word-06.png" alt=""></div>
  <div class="myinfo">
    <table>
      <tr>
        <td>预产期</td>
        <td>${wxuser.expectingDate}</td>
      </tr>
      <tr>
        <td>孕前体重</td>
        <td>${wxuser.weight}KG</td>
      </tr>
      <tr>
        <td>当前体重</td>
        <td>${wxuser.afterWeight}KG</td>
      </tr>
      <tr>
        <td>身高</td>
        <td>${wxuser.height}CM</td>
      </tr>
      <tr>
        <td>年龄</td>
        <td>${wxuser.age}</td>
      </tr>
      <tr>
        <td>胎次</td>
        <td>${wxuser.birthorder}</td>
      </tr>
    </table>
  </div>
  <div class="wd5"><img width="40%" src="img/word-05.png" alt=""></div>
  <div class="myinfo">

  <c:forEach items="${list}" var="order">
    <table>
      <tr>
        <td>订单号</td>
        <td>${order.get("orderNum")}</td>
      </tr>
      <tr>
        <td>购买时间</td>
        <td>${order.get("dateTime")}</td>
      </tr>
      <tr>
        <td>餐册</td>
        <td>"第"${order.get("cance")}"月"</td>
      </tr>
      <tr>
        <td>餐盒</td>
        <td>"第"${order.get("canhe")}"月"</td>
      </tr>
      <tr>
        <td>价格</td>
        <td>${order.get("price")}</td>
      </tr>
      <tr>
        <td>收货人姓名</td>
        <td>${order.get("name")}</td>
      </tr>
      <tr>
        <td>收货地址</td>
        <td>${order.get("address")}</td>
      </tr>
      <tr>
        <td>手机</td>
        <td>${order.get("phoneNum")}</td>
      </tr>
      <tr>
        <td>发货状态</td>
        <td>${order.get("deliverStatus")}</td>
      </tr>
      <tr>
        <td>快递公司</td>
        <td>${order.get("express")}</td>
      </tr>
      <tr>
        <td>快递编号</td>
        <td>${order.get("expressNum")}</td>
      </tr>
    </table>
  </c:forEach>



<%--继续购买--%>


  </div>
  <input type="button" style="display: ${wxEvaluation.evaluation_status.id<=2||wxEvaluation==null?"none":""}" onclick="javascript:location.href='<%=request.getContextPath()%>/WeiXin/purchase'" class="btn" value="继续购买">
</div>
<script src="js/jquery-1.9.0.js"></script>
<script>

</script>
</body>

</html>