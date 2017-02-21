<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.springapp.entity.Club" %>
<%--
  Created by IntelliJ IDEA.
  User: 11369
  Date: 2016/6/20
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Club club= (Club) session.getAttribute("club");
  if(club==null)
  {
    response.sendRedirect("clubLogin");
    return;
  }
  int totalPage= (Integer) request.getAttribute("totalPage");
  int currentPage= (Integer) request.getAttribute("currentPage");
  String name= (String) request.getAttribute("name");
  if(name==null)
    name="";
  String express=(String)request.getAttribute("express");
  if(express==null)
    express="";
  String url="clubOrder?name="+name+"&express="+express+"&";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>订单管理</title>

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/Web/Upload/back/css/bootstrap.css" rel="stylesheet">

  <!-- Add custom CSS here -->
  <link href="<%=request.getContextPath()%>/Web/Upload/back/css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/back/font-awesome/css/font-awesome.min.css">
  <script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/back/js/jquery.uniform.min.js">
  </script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/back/css/style.css">
  <script language="javascript">
    function cli(Obj) {
      var collid = document.getElementById("all")
      var coll = document.getElementsByName(Obj)
      if (collid.checked) {
        for (var i = 0; i < coll.length; i++)
          coll[i].checked = true;
      } else {
        for (var i = 0; i < coll.length; i++)
          coll[i].checked = false;
      }
    }
  </script>
</head>

<body>

<div id="wrapper">

  <!-- Sidebar -->
  <jsp:include page="../Backstage/clubNavi.jsp">
    <jsp:param name="pageName" value="order"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="#"><i class="icon-dashboard"></i>订单管理</a></li>
          <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
        </ol>
      </div>
      <form class="form-horizontal" id="add_admin" novalidate="novalidate">
        <div class="modal-footer">
          <button type="button" class="btn btn-success" data-toggle="modal" data-target="#FindModal">
            查找
          </button>
          <button type="button" class="btn btn-success" onclick="changeStatus(0)">
            未发货
          </button>
          <button type="button" class="btn btn-success" onclick="changeStatus(1)">
            已发货
          </button>
          <button type="button" class="btn btn-success" onclick="changeStatus(2)">
            投递成功
          </button>
          <button type="button" class="btn btn-success" onclick="deleteChoose()">
            删除
          </button>
          <button type="button" class="btn btn-success" onclick="outExcel()">
            导出
          </button>
        </div>
      </form>
      <div class="col-md-12">
        <table class="table table-striped table-bordered table-hover table-checkable" cellspacing="0"
               width="100%">
          <thead>
          <tr>
            <th class="checkbox-column">
              <input type="checkbox" class="uniform" name="check" onclick="cli('check');" id="checkAll">
            </th>
            <th>
              订单号
            </th>
            <th>
              姓名
            </th>
            <th>
              购买时间
            </th>
            <th>
              餐册
            </th>
            <th>
              餐盒
            </th>
            <th>
              姓名
            </th>
            <th>
              电话
            </th>
            <th>
              收货地址
            </th>
            <th>
              快递公司
            </th>
            <th>
              快递编号
            </th>
            <th>发货状态</th>
            <th>操作</th>
          </tr>
          </thead>
          <tbody id="myTbody">
          <c:forEach items="${list}" var="order">
            <tr>
              <td class="checkbox-column"><input type="checkbox" class="uniform" name="subBox"></td>
              <td style="display: none">${order.id}</td>
              <td>${order.orderNum}</td>
              <td>${order.name}</td>
              <td>${order.date}</td>
              <td><script>
                if("${order.canceNum}"=="")
                  document.write("无");
                else{
                  var cance="${order.canceNum}".split(",");
                  for(var i=0;i<cance.length;i++){
                    document.write("<input type='button' value='"+cance[i]+"月' onclick=\"outPDF('"+cance[i]+"','${order.guid}')\">");
                  }
                }
              </script></td>

              <td>${order.canheNum==null||order.canheNum==""?"无":order.canheNum}</td>
              <td>${order.name}</td>
              <td>${order.phoneNum}</td>
              <td>${order.address}</td>
              <td>${order.express}</td>
              <td>${order.expressNum}</td>
              <td>${order.deliverStatus}</td>
              <td><label data-toggle="modal" data-target="#AddModal"><a href="#" onclick="setInfo('${order.id}','${order.orderNum}','${order.date}','${order.name}','${order.phoneNum}','${order.address}','${order.express}','${order.expressNum}')">添加/修改物流信息</a></label>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
        <jsp:include page="../Backstage/page.jsp" flush="true">
          <jsp:param name="currentPage" value="<%=currentPage%>"></jsp:param>
          <jsp:param name="totalPage" value="<%=totalPage%>"></jsp:param>
          <jsp:param name="url" value="<%=url%>"></jsp:param>
        </jsp:include>
        <%--分页--%>
        <%--   <section class="archive-pages">
          <ul>
            <li class="first"><a href="#" title="first page">first page</a></li>
            <li class="previous"><a href="#" title="previous page">previous page</a></li>
            <li class="selected">1</li>
            <li><a href="#" title="Pagina 2">2</a></li>
            <li><a href="#" title="Pagina 3">3</a></li>
            <li><a href="#" title="Pagina 4">4</a></li>
            <li><a href="#" title="Pagina 5">5</a></li>
            <li class="next"><a href="#" title="next page">next page</a></li>
            <li class="last"><a href="#" title="last page">last page</a></li>
          </ul>
        </section>--%>
      </div>

    </div><!-- /.row -->

  </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->


<!-- Add Modal -->
<div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="AddModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="AddModalLabel">添加/修改</h4>
      </div>
      <div class="form-horizontal" id="add">
        <div class="modal-body">
          <div class="form-wizard">
            <div class="form-body">
              <div class="form-group">
                <label class="control-label col-md-3">订单号</label>
                <div class="col-md-5">
                  <input type="text" id="orderNum" name="orderNum" class="form-control" placeholder="订单号"/>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">购买时间</label>
                <div class="col-md-5">
                  <input type="text" class="form-control" data-language="en" id="datetime" name="date">
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">收货人姓名</label>
                <div class="col-md-5">
                  <input type="text" name="name" id="name" class="form-control" placeholder="姓名"/>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">联系电话</label>
                <div class="col-md-5">
                  <input type="text" name="phoneNum" id="phoneNum" class="form-control" placeholder="电话号码"/>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">收货地址</label>
                <div class="col-md-5">
                  <input type="text" name="address" id="address" class="form-control" placeholder="收货地址"/>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">快递公司</label>
                <div class="col-md-5">
                  <input type="text" name="express" id="express" class="form-control" placeholder="快递公司"/>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">快递单号</label>
                <div class="col-md-5">
                  <input type="text" name="expressNum" id="expressNum" class="form-control" placeholder="快递单号"/>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-success" onclick="edit()" value="添加"/>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Find Modal -->
<div class="modal fade" id="FindModal" tabindex="-1" role="dialog" aria-labelledby="FindModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="FindModalLabel">查找</h4>
      </div>
      <div class="form-horizontal">
        <div class="modal-body">
          <div class="form-wizard">
            <div class="form-body">
              <div class="form-group">
                <label class="control-label col-md-3">收货人姓名</label>
                <div class="col-md-5">
                  <input type="text" name="name" id="findName" class="form-control" placeholder="收货人姓名"/>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">快递公司</label>
                <div class="col-md-5">
                  <input type="text" name="express" id="findExpress" class="form-control" placeholder="快递公司"/>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-success" data-dismiss="modal"   value="查找" onclick="findRecord()"/>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Edit Modal -->
<div class="modal fade" id="EditModal" tabindex="-1" role="dialog" aria-labelledby="AddModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="EditModalLabel">修改</h4>
      </div>
      <form:form class="form-horizontal" id="edit" novalidate="novalidate" modelAttribute="club"
                 action="Club/edit" method="post">

        <div class="modal-body">
          <div class="form-wizard">
            <div class="form-body">
              <div class="form-group" style="display: none">
                <label class="control-label col-md-3">31321</label>
                <div class="col-md-5">
                  <input name="id" class="form-control" placeholder="321321">
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">订单号</label>
                <div class="col-md-5">
                  <input type="text" name="orderId" class="form-control" placeholder="订单号"/>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">购买时间</label>
                <div class="col-md-5">
                  <input type="text" data-language="en" name="invalidDate"
                         class="form-control datepicker-here" placeholder="年/月/日">
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">收货人姓名</label>
                <div class="col-md-5">
                  <input type="text" name="name" class="form-control" placeholder="姓名"/>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">联系电话</label>
                <div class="col-md-5">
                  <input type="text" name="linkNo" class="form-control" placeholder="电话号码"/>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">收货地址</label>
                <div class="col-md-5">
                  <input type="text" name="address" class="form-control" placeholder="收货地址"/>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">快递公司</label>
                <div class="col-md-5">
                  <input type="text" name="address" class="form-control" placeholder="快递公司"/>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">餐册</label>
                <div class="col-md-3">
                  <select class="form-control" name="status">
                    <option value="1">第一月</option>
                    <option value="2">第二月</option>
                    <option value="3">第三月</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">餐盒</label>
                <div class="col-md-3">
                  <select class="form-control" name="status">
                    <option value="1">第一月</option>
                    <option value="2">第二月</option>
                    <option value="3">第三月</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">发货状态</label>
                <div class="col-md-3">
                  <select class="form-control" name="status">
                    <option value="1">未发货</option>
                    <option value="2">已发货</option>
                    <option value="3">已收货</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <input type="submit" class="btn btn-success" data-dismiss="modal" value="保存修改" onclick=""/>
        </div>
      </form:form>
    </div>
  </div>
</div>
<!-- JavaScript -->
<script src="<%=request.getContextPath()%>/Web/Upload/js/jquery.min.js" type="text/javascript"></script>
<script>window.jQuery || document.write('<script src="<%=request.getContextPath()%>/Web/Upload/js/jquery-2.1.1.min.js"><\/script>')</script>
<link href="<%=request.getContextPath()%>/Web/Upload/dist/css/datepicker.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/Web/Upload/dist/js/datepicker.js"></script>
<script src="<%=request.getContextPath()%>/Web/Upload/dist/js/i18n/datepicker.en.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/js/eModal.js"></script>
<script type="text/javascript">
  var idForEdit=0;
  function outPDF(canceNum,guid){
    $.ajax({
      url:"<%=request.getContextPath()%>/Question2/outPDF",
      type:"post",
      data:{canceNum:canceNum,guid:guid},
      success:function(data){
        window.open("<%=request.getContextPath()%>/PDFs/out/"+data)
      }
    })
  }

  function findRecord(){
    var name=$("#findName").val();
    var express=$("#findExpress").val();
    location.href="<%=request.getContextPath()%>/Club/clubOrder?name="+name+"&express="+express+"&pn=<%=currentPage%>";
  }
  function outExcel(){
    window.open("<%=request.getContextPath()%>/Question2/outExcel");
  }
  function setInfo(id,orderNum,date,name,phoneNum,address,express,expressNum){
    idForEdit=id
    $("#orderNum").val(orderNum)
    $("#datetime").val(date)
    $("#name").val(name)
    $("#phoneNum").val(phoneNum)
    $("#address").val(address)
    $("#express").val(express)
    $("#expressNum").val(expressNum)
  }
  function edit(){
    var express=$("#express").val();
    var expressNum=$("#expressNum").val();
    $.ajax({
      url:"<%=request.getContextPath()%>/Question2/edit",
      type:"post",
      data:{id:idForEdit,express:express,expressNum:expressNum},
      success:function(data){
        location.reload(true)
      }
    })
  }
  $(function () {
    $("#checkAll").click(function () {
      // 	alert($("input[name='subBox']").length);
      if ($("input[name='subBox']").length == $("input[name='subBox']:checked").length) {
        $("input[name='subBox']").prop("checked", false);
      } else {
        $("input[name='subBox']").prop("checked", true);
      }

    });
    /*$("input[name='subBox']").click(function(){
     //	alert($("input[name='subBox']").length+" "+$("input[name='subBox']:checked").length);
     $("#checkAll").prop("checked",$("input[name='subBox']").length == $("input[name='subBox']:checked").length ? true : false);
     });*/
  });

  function deleteChoose() {
    var idList = $("input[name='subBox']");
    var infoList = "";
    var count = 0;
    $(idList).each(function (index, data) {
      if (data.checked) {
        if (count > 0)
          infoList += ",";
        infoList += $(data).parent().parent().find('td:eq(1)').html();
        count++;
      }
    });
    if (infoList != "") {
      $.ajax({
        type: "post",
        url: "<%=request.getContextPath()%>/Question2/delete",
        data: {infoList: infoList},
        success: function (result) {
          if (result == "success") {
            location.reload(true)
          }
        }
      })
    }
    console.log(infoList);
  }
  /*发货状态*/
  function changeStatus(type) {
    var idList = $("input[name='subBox']");
    var infoList = "";
    var count = 0;
    $(idList).each(function (index, data) {
      if (data.checked) {
        if (count > 0)
          infoList += ",";
        infoList += $(data).parent().parent().find('td:eq(1)').html();
        count++;
      }
    });
    if (infoList != "") {
      $.ajax({
        type: "post",
        url: "<%=request.getContextPath()%>/Question2/changeStatus",
        data: {infoList: infoList, type: type},
        success: function (result) {
          if (result == "success") {
            $(idList).each(function (index, data) {
              if (data.checked) {
                if(type==0)
                  $(data).parent().parent().find('td:eq(12)').html("未发货");
                else if(type==1)
                  $(data).parent().parent().find('td:eq(12)').html("已发货");
                else
                  $(data).parent().parent().find('td:eq(12)').html("投递成功");
              }
            });
            $("input[name='subBox']").removeAttr("checked");
            $("input[name='check']").removeAttr("checked");
          }
        }
      })
    }
    console.log(infoList);
  }
</script>

</body>
</html>
