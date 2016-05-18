<%@ page import="com.springapp.entity.BodyCondition" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/17
  Time: 16:49
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
  <link href="css/test.css" rel="stylesheet">
</head>
<%
  List result= (List) request.getAttribute("result");
  String show="";String tendency="在产后有";
  if(result.size()==5){
    show="抱歉，您的体质较为复杂，请完成5分钟评测，便于我们更准确的判断。";
    tendency="";
  }else{
    for(int n=0;n<result.size();n++){
      Object [] resultTemp=(Object[])result.get(n);
      int subBCname=(Integer) resultTemp[0];
      List<BodyCondition>bodyConditions= (List<BodyCondition>) request.getAttribute("bodyConditions");
      BodyCondition bodyCondition=bodyConditions.get(subBCname);
      String subTendency=(String)resultTemp[1];
      if(bodyCondition.getName().equals("平和")){
        if(result.size()==1)
          show=bodyCondition.getName()+","+bodyCondition.getTendency()+"。";
        tendency="";
      }else{
        show+=bodyCondition.getName()+"体质"+",";
        tendency+=bodyCondition.getTendency()+",";
      }
      if(n==1)break;
    }
  }
  if(show.endsWith(","))
  {
    int end=show.length();
    show=show.substring(0, end-1);
  }
  if(tendency.endsWith(","))
  {
    int end=tendency.length();
    tendency=tendency.substring(0, end-1);
    tendency+="风险";
  }
%>
<body data-role="page">
<div class="bg-wrapper pg3">
  <div class="shadow-qblock">
    <p>您的体质偏向：<%=show+tendency%></p>
    <p><span class="txt-red">坐月子是女人改变体质的黄金期,</span>也是妇科，内分泌等慢性疾病很容易埋下隐患的敏感期，建议您依据体质，合理规划好产后饮食调理。</p>
  </div>
  <div class="lp"><img src="img/long-pic.png" alt="">
    <a href="<%=request.getContextPath()%>/WeiXin/menu" class="btn">去看看</a>
  </div>

</div>
<script src="js/jquery-1.9.0.js"></script>
<script>
</script>
</body>

</html>
