<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/17
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
  <div class="captain">收货人信息</div>
  <div class="qblock">
    <form:form name="myForm" action="" method="post" modelAttribute="order">

      <label for="">姓名</label> <input name="name" type="text" id="name" ><br>
      <hr>
      <label for="">电话</label> <input name="phoneNum" type="text" id="phoneNum" value=""><br>
      <hr>
      <label for="">收货地址</label> <input name="address" id="address" type="text" value=""><br>
      <hr>
      <label for="">餐册</label>
      <div class="tr"><input name="canceNums"  value="1" type="checkbox">第一月</div>
      <div class="tr"><input name="canceNums"  value="2" type="checkbox">第二月</div>
      <div class="tr"><input name="canceNums"  value="3" type="checkbox">第三月</div>

      <hr>
      <label for="">配套食材</label>
      <div class="tr"><input name="canheNums"  value="1" type="checkbox">第一月</div>
      <div class="tr"><input name="canheNums"  value="2" type="checkbox">第二月</div>
      <div class="tr"><input name="canheNums"  value="3" type="checkbox">第三月</div>

      <hr>

      <%--<div class="total">共计：<span class="price">125</span>元</div>--%>

    </form:form>
  </div>

  <input type="button" onclick="ensure()" class="btn" value="开始支付">
</div>
<script src="js/jquery-1.9.0.js"></script>
<script>
</script>
</body>
<script>
  function ensure(){
    var canceNum=0;
    var cance=document.getElementsByName("canceNums");
    for(var i=0;i<cance.length;i++){
      if(cance[i].checked==true)
      canceNum++;
    }
    var canheNum=0;
    var canhe=document.getElementsByName("canheNums");
    for(i=0;i<cance.length;i++){
      if(canhe[i].checked==true)
        canheNum++;
    }
    var name=$("#name").val();
    var phoneNum=$("#phoneNum").val();
    var address=$("#address").val();
    if(name==null||name==""){
      alert("姓名必填")
      return true
    }
    if(phoneNum==null||phoneNum==""){
      alert("手机号必填")
      return true
    }
    if(address==null||address==""){
      alert("地址必填")
      return true
    }
    $.ajax({
      url:"<%=request.getContextPath()%>/WeiXin/ensure",
      type:"post",
      data:{canceNum:canceNum,canheNum:canheNum},
      dataType:"json",
      success: function (data) {
        WeixinJSBridge.invoke('getBrandWCPayRequest',{
          "appId":data.appId,
          "timeStamp":data.timeStamp,
          "nonceStr":data.nonce_str,
          "package":data.package,
          "signType":"MD5",
          "paySign":data.paySign
        }, function (res) {
          if(res.err_msg=="get_brand_wcpay_request:ok"){
            submitForm();
          }
        })
      }
    })
  }
  function submitForm(){
    var myForm=document.getElementsByName("myForm")[0];
    myForm.submit();
  }
</script>
</html>
