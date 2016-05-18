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
  <title>月子餐</title>
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

    <table>
      <tr>
        <td>订单号</td>
        <td>1234567890</td>
      </tr>
      <tr>
        <td>购买时间</td>
        <td>2016-5-16</td>
      </tr>
      <tr>
        <td>商品名称</td>
        <td>月子餐</td>
      </tr>
      <tr>
        <td>数量</td>
        <td>1</td>
      </tr>
      <tr>
        <td>价格</td>
        <td>100元</td>
      </tr>
      <tr>
        <td>收货人姓名</td>
        <td>鲍鱼</td>
      </tr>
      <tr>
        <td>收货地址</td>
        <td>华东师范大学把喇叭哇空间打开了是的</td>
      </tr>
      <tr>
        <td>手机</td>
        <td>1234567891</td>
      </tr>
      <tr>
        <td>发货状态</td>
        <td>已发货</td>
      </tr>
      <tr>
        <td>快递公司</td>
        <td>顺丰快递</td>
      </tr>
      <tr>
        <td>快递编号</td>
        <td>E156425as6546a</td>
      </tr>
    </table>



<%--继续购买--%>


  </div>
</div>
<script src="js/jquery-1.9.0.js"></script>
<script>

</script>
</body>

</html>