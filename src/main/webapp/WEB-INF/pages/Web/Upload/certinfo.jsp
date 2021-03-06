<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/25
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>证书</title>
  <style>
    *{
      zoom: 0.95;
    }
    body,
    html {
      margin: 0;
      box-sizing: border-box;
      font-family: "Times New Roman",Georgia,"Microsoft Yahei";
      height: 100%;
    }
    body {
      background-image:url('<%=request.getContextPath()%>/Web/Upload/images/bg.jpg');
      background-repeat:no-repeat;
      background-size:100% 100%;

    }

    .container {
      padding: 50px;
    }

    .wrapper {
      height: auto;
      overflow: auto;
    }

    .photo {
      height: 160px;
      width: 120px;
      margin: auto;
      border: 1px solid #000;
      margin-bottom: 50px;
    }

    .block {

      box-sizing: border-box;
      display: inline-block;
      padding: 8%;
      padding-bottom: 2%;
      margin-top: 0px;
      width: 50%;
    }

    span.name {
      display: inline-block;
      width: 80px;
      border-bottom: 1px solid #000;
    }

    .left {
      line-height: 2em;
      font-size:20px;
      text-align: center;
      float: left;
    }

    .right {
      line-height:1.8em;
      font-size: 16px;
    }

    .right span {
      display: inline-block;
    }

    span.line {
      text-align: center;
      display: inline-block;

      padding: 0 10px;
      position: relative;

      margin: 0 16px;
      vertical-align: baseline;
    }

    .bottom-info {

      text-align: right;
      position: absolute;
      bottom: 15%;
      right: 8%;
    }
    .bottom-info  div:first-child {
      font-size:30px;
      font-weight: bold;
      font-family: "华文行楷","Microsoft Yahei";
    }
  </style>
</head>

<body>
<div class="container">
  <div class="wrapper">
    <div class="left block">
      <%--<div class="photo">
        <img src="" alt="照片">
      </div>--%>
      <div><strong>特聘</strong> <span class="name">${train.name}</span> <strong>女士为
        <br>禅心妈妈【月子药膳调理师】</strong></div>
      <div>Distinguished you to chanxin mother Month DIet conditioning division</div>
    </div>
    <div class="right block">
      <div><span><strong>姓名:</strong><br>Full Name</span> <span class="line"> ${train.name}<br>___________</span> </div>
      <br>

      <div><span><strong>性别:</strong><br>Gender</span> <span class="line"> ${train.sex}<br>_________</span></div>
      <br>
      <div><span><strong>受聘时间:</strong><br>Issuing Date</span> <span class="line"> ${train.licenseTime.year+1900}<br>_________</span> <span><strong>年</strong><br>Year</span> <span class="line"> ${train.licenseTime.month+1}<br>_________</span> <span><strong>月</strong><br>Month</span></div>
      <br>
      <div></div><span><strong>聘书编号:</strong><br>Appointment letter Number</span> <span class="line"> ${train.licenseNum}<br>_______________</span>
    </div>
  </div>
  <div class="bottom-info">
    <div>上海悦禅心医疗科技有限公司</div>
    <div>SHANGHAI YUE ZEN MEDICAL TECHNOLOGY CO LTD</div>
  </div>
</div>
</body>

</html>

