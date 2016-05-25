<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/21
  Time: 19:19
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
  <link href="<%=application.getContextPath()%>/WeiXin/css/style.css" rel="stylesheet">
  <link href="<%=application.getContextPath()%>/WeiXin/css/test.css" rel="stylesheet">
  <link href="<%=application.getContextPath()%>/WeiXin/css/normalize.css" rel="stylesheet">
  <style>
    .co-num{
      font-size: 16px;
      margin:20px 0;
      text-align: center;
    }

    .co-num span{
      margin: 0 10px;
      display: inline-block;
      color: #fd7676;
      font-weight: bold;
    }
    /*一定加上这句*/
    .bg-wrapper {
      box-sizing: border-box;
    }
  </style>
</head>

<body data-role="page">
<div class="bg-wrapper pg9">
  <div class="wd8"><img width="50%" src="<%=application.getContextPath()%>/WeiXin/img/word-08.png" alt=""></div>
  <br>
  <div class="users">

    <div class="shadow-qblock">
      <div class="co-num">合作伙伴人数:<span>${userscount}</span></div>

      <table>

        <tr>
          <td><img src="<%=application.getContextPath()%>/WeiXin/img/pro1.png" width="100%" alt=""></td>
          <td><img src="<%=application.getContextPath()%>/WeiXin/img/pro2.png" width="100%" alt=""></td>

        </tr>

        <tr>

          <td><br>专属定制<br>月子餐手册</td>
          <td><br>禅心月子<br>调理餐食盒</td>
        </tr>

        <tr>

          <td class="user-num"><br><span>${canceNum}</span>本</td>
          <td class="user-num"><br><span>${canheNum}</span>个</td>
        </tr>
      </table>
    </div>

  </div>
</div>
<script src="<%=application.getContextPath()%>/WeiXin/js/jquery-1.9.0.js"></script>
<script>
  $(function() {
    $(".ctct>img").delay(400).fadeIn(500);

  })
</script>
</body>

</html>


