<%@ page import="com.springapp.entity.Admin" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/10
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

  String name= (String) request.getAttribute("name");
  String fromDatetime= (String) request.getAttribute("fromDatetime");
  String toDatetime= (String) request.getAttribute("toDatetime");
  String status= (String) request.getAttribute("status");
  Admin admin= (Admin) session.getAttribute("admin");
  if(admin==null)
  {
    response.sendRedirect(request.getContextPath()+"/login");
    return;
  }
  int totalPage= (Integer) request.getAttribute("totalPage");
  int currentPage= (Integer) request.getAttribute("totalPage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>禅心评估</title>

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/Web/Upload/back/css/bootstrap.css" rel="stylesheet">

  <!-- Add custom CSS here -->
  <link href="<%=request.getContextPath()%>/Web/Upload/back/css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/back/font-awesome/css/font-awesome.min.css">
  <script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/back/js/jquery.uniform.min.js">
  </script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/back/css/style.css">
</head>

<body>

<div id="wrapper">

  <!-- Sidebar -->
 <jsp:include page="../Backstage/NavigationBar.jsp">
   <jsp:param name="pageFather" value="Evaluate"></jsp:param>
   <jsp:param name="pageName" value="evaluate3"></jsp:param>
 </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="#"><i class="icon-dashboard"></i>会所评估</a></li>
          <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
        </ol>
      </div>
      <form class="form-horizontal" id="add_admin" action=""  novalidate="novalidate">
        <div class="modal-body">

          <div class="form-wizard">
            <div class="form-body">
              <div class="form-group">
                <label class="control-label col-md-3">会员名</label>
                <div class="col-md-7">
                  <input type="text" name="username" id="name" class="form-control" placeholder="姓名" />
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">评估时间</label>
                <div class="col-md-3">
                  <input type="text" data-language="en" id="fromDatetime" class="form-control datepicker-here" placeholder="年/月/日">
                </div>
                <label class="control-label col-md-1">到</label>
                <div class="col-md-3">
                  <input type="text" data-language="en" id="toDatetime" class="form-control datepicker-here" placeholder="年/月/日">
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">状态</label>
                <div class="col-md-2">
                  <select class="form-control" name="state" id="status">
                    <c:forEach items="${evaluationStatuses}" var="item">
                      <option value='${item.id}'>${item.name}</option>
                    </c:forEach>
                  </select>

                </div>
              </div>
            </div>
          </div>

        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-success" value="查找" onclick=""/>
        </div>
      </form>
      <div class="col-md-12">
        <table class="table table-striped table-bordered table-hover table-checkable" cellspacing="0" width="100%">
          <thead>
          <tr>
            <th class="checkbox-column">
              <input type="checkbox" class="uniform" id="checkAll">
            </th>
            <th>
              编号
            </th>
            <th>
              会员名
            </th>
            <th>
              评估时间
            </th>
            <th>
              状态
            </th>
            <th>
              一分钟评测结果
            </th>
            <th>
              五分钟评测结果
            </th>
          </tr>
          </thead>
          <tbody>
        <c:forEach items="${list}" var="evaluation" varStatus="num">
          <tr>
            <td class="checkbox-column"><input type="checkbox" class="uniform" name="subBox"></td>
            <td>${num.count}</td>
            <td>${evaluation.name}</td>
            <td>${evaluation.time}</td>
            <td>${evaluation.evaluationStatus}</td>
            <td>
              <label data-toggle="modal" data-target="#CheckModal"><a>查看</a></label>
            </td>
            <td>
              <label data-toggle="modal" data-target="#CheckModal"><a>查看</a></label>
            </td>
          </tr>
        </c:forEach>
          </tbody>
        </table>
        <jsp:include page="../Backstage/page.jsp" flush="true">
          <jsp:param name="currentPage" value="<%=currentPage%>"></jsp:param>
          <jsp:param name="totalPage" value="<%=totalPage%>"></jsp:param>
          <jsp:param name="url" value="Evaluate/evaluate3?name=<%=name%>&fromDatetime=<%=fromDatetime%>&toDatetime=<%=toDatetime%>&status=<%=status%>"></jsp:param>
        </jsp:include>
      </div>
    </div><!-- /.row -->

  </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- Add Modal -->
<div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="FindModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="AddModalLabel">快递信息</h4>
      </div>
      <form:form class="form-horizontal" id="add" novalidate="novalidate">
        <div class="modal-body">
          <div class="form-group">
            <label class="control-label col-md-3">快递单号</label>
            <div class="col-md-5">
              <input type="text" name="username" class="form-control" placeholder="快递单号" />
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3">快递公司</label>
            <div class="col-md-5">
              <input type="text" name="username" class="form-control" placeholder="快递公司" />
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3">发货时间</label>
            <div class="col-md-5">
              <input type="text" name="username" class="form-control" placeholder="发货时间" />
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3">收件人姓名</label>
            <div class="col-md-5">
              <input type="text" name="username" class="form-control" placeholder="收件人姓名" />
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3">收件人联系方式</label>
            <div class="col-md-5">
              <input type="text" name="username" class="form-control" placeholder="手机号码" />
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-success" value="添加" onclick=""/>
        </div>
      </form:form>
    </div>
  </div>
</div>

<!-- Check Modal -->
<div class="modal fade" id="CheckModal" tabindex="-1" role="dialog" aria-labelledby="FindModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="CheckModalLabel">体质报告</h4>
      </div>
      <form:form class="form-horizontal" id="check" novalidate="novalidate">
        <div class="form-body">
          <div class="form-group">
            <label class="control-label col-md-3">您的体质是：</label>
            <p>XX型</p>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3">专家意见：</label>
            <p>多喝热水多运动，少发脾气（或者这里换成图片也行，因为不知道具体内容，所以暂时这么排版了）</p>
          </div>
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
  function find(){
    var name=$("#name").val()
    var fromDatetime=$("#fromDatetime").val();
    var toDatetime=$("#toDatetime").val();
    var status=$("#status").val()
    location.href="<%=request.getContextPath()%>/Evaluate/evaluate3?name="+name+"&fromDatetime="+fromDatetime+"&toDatetime="+toDatetime+"&status="+status+"&pn=<%=currentPage%>"
  }

  $(function() {
    $("#checkAll").click(function() {
      // 	alert($("input[name='subBox']").length);
      if($("input[name='subBox']").length == $("input[name='subBox']:checked").length){
        $("input[name='subBox']").prop("checked",false);
      }else{
        $("input[name='subBox']").prop("checked",true);
      }

    });
    $("input[name='subBox']").click(function(){
      //	alert($("input[name='subBox']").length+" "+$("input[name='subBox']:checked").length);
      $("#checkAll").prop("checked",$("input[name='subBox']").length == $("input[name='subBox']:checked").length ? true : false);
    });
  });
</script>

</body>
</html>
