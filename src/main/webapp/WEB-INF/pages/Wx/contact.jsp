<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/17
  Time: 17:03
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
  <style>
    html {
      font-size : 20px;
    }
    @media only screen and (min-width: 320px){
      html {
        font-size: 20px !important;
      }
    }
    @media only screen and (min-width: 401px){
      html {
        font-size: 25px !important;
      }
    }
    @media only screen and (min-width: 428px){
      html {
        font-size: 26.75px !important;
      }
    }
    @media only screen and (min-width: 481px){
      html {
        font-size: 30px !important;
      }
    }
    @media only screen and (min-width: 569px){
      html {
        font-size: 35px !important;
      }
    }
    @media only screen and (min-width: 641px){
      html {
        font-size: 40px !important;
      }
    }
    .text {
      text-align: left;
      margin: auto;
      width: 55%;
      position: absolute;
      left: 0;
      right: 0;
      top: 50%;
      font-size: 0.5rem;
      letter-spacing: 0.2em;
    }

    .cusname {
      color: #3e6bb1;
    }
    .ctct {
      position: relative;
    }
    .text{
      display: none;

    }
    hr{
      border:1px solid #ffcdcd;
    }
  </style>
</head>

<body data-role="page">
<div class="bg-wrapper pg9">
  <div class="ctct">
    <div class="text">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="cusname">${wxUser.nickname} </span>您好，我们已经收到您的测评信息，禅心月子调理专家正在为您定制月子饮食调养方案，请到“我的订单”中查阅配送信息，感谢您对禅心妈妈的信任和支持！
      <hr>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp如有疑问，欢迎通过“禅心妈妈”微信公众号联系我们！</div>
    <img width="80%" src="img/contact.png" alt="">
  </div>
</div>
<script src="js/jquery-1.9.0.js"></script>
<script>
  $(function() {
    $(".ctct>img").delay(400).fadeIn(500);
    $(".text").delay(800).fadeIn(500);

  })
</script>
</body>

</html>

