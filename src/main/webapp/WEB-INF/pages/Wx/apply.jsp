<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/17
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>禅心妈妈</title>
    <meta name="viewport"
          content="target-densitydpi=device-dpi, width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <link href="<%=application.getContextPath()%>/Wx/css/style.css" rel="stylesheet">
    <link href="<%=application.getContextPath()%>/Wx/css/normalize.css" rel="stylesheet">
    <link href="<%=application.getContextPath()%>/Wx/css/test.css" rel="stylesheet">
</head>

<body data-role="page">
<div class="bg-wrapper pg3">
    <div class="captain">申请成为禅心伙伴</div>
    <form action="<%=application.getContextPath()%>/Wx/Apply" method="post" name="myForm">
        <div class="qblock">
            <label for="agent">姓名</label> <input name="agent" id="agent" type="text" value=""><br>
            <hr>
            <label for="phoneNum">手机</label> <input name="phoneNum" id="phoneNum" type="text" value=""><br>
            <hr>
            <label for="recommend">推荐人</label>
            <input name="recommend" id="recommend" list="lista">
            <datalist id="lista">
                <option value="禅心妈妈">禅心妈妈</option>
                <c:forEach var="agent" items="${list}">
                    <option value="${agent.agent}">${agent.agent}</option>
                </c:forEach>
            </datalist>
        </div>
        <input type="button" class="btn" value="点击申请" onclick="submitForm()">
    </form>
</div>
<script src="<%=application.getContextPath()%>/Wx/js/jquery-1.9.0.js"></script>
</body>
<script>
    function beforeSubmit(){

    }
    function submitForm(){
        var myForm=document.getElementsByName("myForm");
        var agent=$("#agent").val()
        var phoneNum=$("#phoneNum").val()
        var recommend=$("#recommend").val()
        if(agent==""||phoneNum==""||recommend==""){
            alert("姓名,手机和推荐人必填！")
            return false
        }
        $.ajax({
            url:"<%=request.getContextPath()%>/Wx/isIn",
            type:"post",
            data:{agent:agent,recommend:recommend},
            success:function(data){
                if(data=="isIn"){
                    alert("该代理点已存在")
                    return false
                }else if(data=="fail"){
                    alert("该推荐人不存在")
                    return false
                }
                myForm[0].submit();
            }
        })

    }
</script>
</html>
