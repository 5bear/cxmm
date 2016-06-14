<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/10
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
  table
  {
    border-left: 1px solid #fff;
    border-right: 1px solid #fff;
    border-top: 1px solid #fff;
    border-bottom: 1px solid #fff;
  }
  td
  {
    font-family: "Roboto Slab", sans-serif;
    font-size: 18px;
    font-weight: 900;
    color: #f1715e;
    border-right: 0px solid #fff;
    padding: 15px 30px;
    text-align: center;
    width:300px;
    cursor:pointer;
  }
  .js-drop-list {
    position: absolute;
    background: rgba(255, 255, 255, 0.8);
    width: 100%;
    margin-top: 15px;
    margin-left: -30px;
    visibility: hidden;
  }
  .js-drop-list a {
    display: block;
    line-height: 30px;
  }
  .js-drop-list a:hover {
    background: #FFcccc;
  }
</style>
<td onclick="window.location.href='<%=request.getContextPath()%>/index'">首页</td>
<td onclick="window.location.href='<%=request.getContextPath()%>/Evaluate'">体质评估</td>
<td onclick="window.location.href='<%=request.getContextPath()%>/Professor/List'">权威专家</td>

<td class="dropnews" style="position:relative;">禅心新闻
  <ul class="js-drop-list">
    <li><a href="<%=request.getContextPath()%>/Activity/List">企业动态</a></li>
    <li><a href="<%=request.getContextPath()%>/Share/List">禅心分享</a></li>
  </ul>
</td>
<td onclick="window.location.href='<%=request.getContextPath()%>/Club/clubIndex'">月子会所</td>
<td onclick="window.location.href='<%=request.getContextPath()%>/Train'">教育培训</td>
<script src="<%=request.getContextPath()%>/Web/Upload/js/jquery-1.10.2.js"></script>
<script>
  $(".fh5co-text td").on("mouseover", navHover);
  $(".fh5co-text td").on("mouseout", navUnhover);
  $(".dropnews").on("mouseover", function() {
    $(".js-drop-list").css("visibility", "visible");
  })
  $(".dropnews").on("mouseout", function() {
    $(".js-drop-list").css("visibility", "hidden");
  })

  function navHover() {
    $(this).css("backgroundColor", "#FFcccc");
  }

  function navUnhover() {
    $(this).css("backgroundColor", "");
  }
</script>