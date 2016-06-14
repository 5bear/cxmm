<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/17
  Time: 16:36
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
    <link href="css/laydate.css" rel="stylesheet">
</head>

<body data-role="page">
<form action="" method="post" name="myForm">
<div class="bg-wrapper pg3">
  <div class="captain">完善信息，提高评估准确度</div>
  <div class="qblock">

      <label for="">预产期</label> <input id="ExpectingDate" name="ExpectingDate" readonly type="text" value=""><br>
      <hr>
      <label for="">孕前体重</label> <input style="width:45%" name="Weight" id="Weight" type="text" value=""><span>KG</span><br>
      <hr>
      <label for="">当前体重</label> <input style="width:45%" name="AfterWeight" id="AfterWeight" type="text" value=""><span>KG</span><br>
      <hr>
      <label for="">身高</label> <input style="width:45%" name="Height" id="Height" type="text" value=""><span>CM</span><br>
      <hr>
      <label for="">年龄</label> <input style="width:45%" name="Age" id="Age" type="text" value=""><span>周岁</span><br>
      <hr>
      <label for="">胎次</label> <input name="Birthorder" id="Birthorder" type="text" value=""><br>
      <hr>
      <label for="">希望</label> <input name="eutocia" type="radio" value="1">顺产 <input name="eutocia" type="radio" value="2">剖产<br>
      <hr>
      <label for="">希望</label> <input name="feed" type="radio" value="1">哺乳 <input name="feed" type="radio" value="2">非哺乳<br>
      <hr>
      <label for="">手机</label> <input style="width:45%" name="phone" id="phone" type="text" value=""><br>
  </div>

  <input type="button" class="btn" value="开始提交" onclick="check()">
</div>
  </form>
<script src="js/jquery-1.9.0.js"></script>
<script src="js/laydate.dev.js"></script>
<script>
    function check(){
        for (var i=0;i<document.myForm.length;i++ )
        {
            if (document.myForm.elements[i].value=="")
            {
                if(!(remind(i)=="success")){
                    document.myForm.elements[i].focus();
                    alert(remind(i))
                    return false
                }

            }
        }
        var myForm=document.getElementsByName("myForm");
        myForm[0].submit()
    }
    function remind(i){
        switch (i){
            case 0:
                return ("预产期未填写")
                break
            case 1:
                return ("孕前体重未填写")
                break
            case 2:
                return("当前体重未填写")
                break
            case 3:
                return ("身高未填写")
                break
            case 4:
                return ("年龄未填写")
                break
            case 5:
                return ("胎次未填写")
                break
            case 6:
                return ("顺产/剖产未选择")
                break
            case 7:
                return ("哺乳/非哺乳未选择")
                break
            case 8:
                return ("手机未填写")
                break
        }
        return "success"
    }
    laydate({
        elem: '#ExpectingDate'
    });
</script>
</body>

</html>

