<%--
  Created by IntelliJ IDEA.
  User: 11369
  Date: 2016/11/22
  Time: 12:46
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
    <link href="css/dt.css" rel="stylesheet">
</head>

<body data-role="page">
<div class="bg-wrapper pg3">
    <div class="captain" style="margin-top: 200px">自定义金额</div>
    <div class="qblock">
        <form action="" method="get" >
            <label for="">支付金额</label> <input id="amount" type="text" value="" placeholder="请输入数字金额，单位元" onkeyup="checkNum(this)"><br>
            <input type="button" class="btn" value="确认支付" onclick="tgSubmit(this)">
        </form>
    </div>

</div>
<script src="js/jquery-1.9.0.js"></script>
<script>
    function tgSubmit(obj) {
        var amount = document.getElementById("amount").value
        if(amount == "")
            return false
        $(obj).attr("disabled",true)
        $.ajax({
            url:"<%=request.getContextPath()%>/Wx/PayWithAmount",
            type:"post",
            data:{openid:'${openid}',amount:amount},
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
                    $(obj).attr("disabled",false)
                    if(res.err_msg=="get_brand_wcpay_request:ok"){
                        return true
                    }
                })
            }
        })
    }
    function checkNum(obj) {
        //检查是否是非数字值
        if (isNaN(obj.value)) {
            obj.value = "";
        }
        if (obj != null) {
            //检查小数点后是否对于两位
            if (obj.value.toString().split(".").length > 1 && obj.value.toString().split(".")[1].length > 2) {
                alert("小数点后多于两位！");
                obj.value = "";
            }
        }
    };
</script>
</body>

</html>


