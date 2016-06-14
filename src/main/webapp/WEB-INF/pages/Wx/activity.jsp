<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/20
  Time: 16:09
  To change this template use File | Settings | File Templates.
  企业动态
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0">
  <title>禅心妈妈</title>
  <style type="text/css">
    *{margin:0;padding:0;}
    li{list-style:none;}
    a{text-decoration:none;}
    images,div,input{border:0 none;}
    .box{overflow:hidden;position:relative;width:100%;height:auto;}
    .box .banner{overflow:hidden;position:relative;width:100%;height:auto;}
    .box .banner li{width:100%;height:auto;}
    .box .banner li a{display:none;width:100%;height:auto;}
    .box .banner li a images{display:block;width:100%;height:auto; background-size: cover;}
    .prev,.next{display:block;text-align:center;background:#666;position:absolute;color:#fff;opacity:0.5;}
    .prev{top:50%;left:10%;}
    .next{top:50%;right:10%;}
    .prev:hover,.next:hover{opacity:1;}
    .div{width:100%;height:30px;position:absolute;bottom:0;left:0;background:#333;opacity:0.5;z-index:8;}
    ul.btn{text-align:center;position:absolute;width:100%;bottom:7px;left:50%;margin-left:-50%;z-index:9;}
    ul.btn li{width:15px;height:15px;background:#ccc;border-radius:8px;font:12px/15px 宋体;display:inline-block;cursor:pointer;}
    ul.btn li.on{opacity:0.5;background:#D50A0E;color:#ff0;}

    .minBox{width:100%;margin-top:15px;margin-bottom:55px;}
    .minBox .list{width:96%;margin:0 auto;}
    .minBox .list ul{width:100%;}
    .minBox .list ul li{width:100%;height:auto;background: #ffffff; overflow:hidden;margin-bottom:10px;padding-top:10px;padding-bottom:10px;}
    .minBox .list ul li .images{width:6em;height:6.5em;float:left;margin-left:5px;margin-right:5px;}
    .minBox .list ul li .images img{-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;}
    .minBox .list ul li .content{float:left;color:#C0191B;}
    .minBox .list ul li .content h2{color:#C0191B;font:1.25em 微软雅黑;}
    .minBox .list ul li .content  p{color:#2B2628;font:1em 微软雅黑;}
    @media screen and (min-width:280px) and (max-width: 640px){
      .prev,.next{width:30px;height:30px;font:24px/30px 宋体;border-radius:15px;margin-top:-15px;}
      .minBox .list ul li .content{width:60%;}
    }
    @media screen and (min-width:641px) and (max-width:960px){
      .prev,.next{width:50px;height:50px;font:30px/50px 宋体;border-radius:25px;margin-top:-25px;}
      .minBox .list ul li .content{width:70%;}
    }
    @media screen and (min-width:961px) and (max-width:1920px){
      .prev,.next{width:65px;height:65px;font:35px/65px 宋体;border-radius:33px;margin-top:-25px;}
      .minBox .list ul li .content{width:89%;}
    }
    /*footer*/
  </style>
</head>
<body>
<%--<div class="box">
  <ul class="banner">
    <c:forEach items="${list}" var="item" varStatus="count">
      <li><a  ${count.count==1?'style="display:block;"':""}  href="${item.url}"><img src="<%=request.getContextPath()%>/Web/UserFile/ActivityPicture/${item.showPicture}" width="100%"></a></li>
    </c:forEach>
    &lt;%&ndash;<li><a style="display:block;" href="#"><img src="images/banner1.jpg" width="100%" ></a></li>&ndash;%&gt;
  </ul>
  <a class="prev" href="javascript:void(0)"><</a>
  <a class="next" href="javascript:void(0)">></a>
  <div class="div"></div>
  <ul class="btn">
   &lt;%&ndash; <li class="on">1</li>&ndash;%&gt;
     <c:forEach items="${list}" var="item" varStatus="count">
       <li>${count.count}</li>
     </c:forEach>
  </ul>
</div>--%>
<div class="minBox">
  <div class="list">
    <ul>
      <c:forEach items="${list}" var="item">
        <li>
          <div class="images"><img src="<%=request.getContextPath()%>/Web/UserFile/ActivityPicture/${item.showPicture}" width="80" height="80"></div>
          <div class="content">
            <h2><a href="<%=request.getContextPath()%>/Wx/showActivity?id=${item.id}">${item.title}</a></h2>
            <p>
              ${item.summary}
            </p>
          </div>
        </li>
      </c:forEach>
    </ul>
  </div>

</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/WeiXin/js/jquery.js"></script>
<script type="text/javascript">
  $(function(){
    /*四秒钟换一张*/
    var a = 0;

    $(".btn li").click(function(){
      $(".btn li").removeClass("on");
      $(this).addClass("on");
      a=$(this).index();
      $(".banner li a").hide();
      $(".banner li a").eq(a).show();
    });
  /*  function sroll(){
      if(a<5){
        a++;
      }else{
        a=0;
      }
      on();
    }
    var timer=setInterval(sroll,4000);*/
    /*$(".banner,.prev,.next").mouseover(function(){
      clearInterval(timer);
    }).mouseout(function(){
      timer=setInterval(sroll,4000);
    })*/
    $(".prev").click(function(){
      if(a>0){
        a--;
      }else{
        a=5;
      }
      on();

    })
    $(".next").click(function(){

      if(a<5){
        a++;
      }else{
        a=0;
      }
      on();

    });

    function on(){
      $(".btn li").removeClass("on");
      $(".btn li").eq(a).addClass("on");
      $(".banner li a").hide();
      $(".banner li a").eq(a).show();
    }
  })
</script>
</body>
</html>
