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
  if(name==null)
    name="";
  String fromDatetime= (String) request.getAttribute("fromDatetime");
  if(fromDatetime==null)
    fromDatetime="";
  String toDatetime= (String) request.getAttribute("toDatetime");
  if(toDatetime==null)
    toDatetime="";
  String status= (String) request.getAttribute("status");
  if(status==null)
    status="";
  String agent= (String) request.getAttribute("agent");
  if(agent==null)
    agent="";
  Admin admin= (Admin) session.getAttribute("admin");
  if(admin==null)
  {
    response.sendRedirect(request.getContextPath()+"/login");
    return;
  }
  int totalPage= (Integer) request.getAttribute("totalPage");
  int currentPage= (Integer) request.getAttribute("currentPage");
  String url="evaluate2?name="+name+"&fromDatetime="+fromDatetime+"&toDatetime="+toDatetime+"&status="+status+"&agent="+agent+"&";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>代理点评估</title>

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
    <jsp:param name="pageName" value="evaluate2"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="#"><i class="icon-dashboard"></i>代理点评估</a></li>
          <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
        </ol>
      </div>
      <div class="form-horizontal">
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
                <label class="control-label col-md-3">代理点名称</label>
                <div class="col-md-7">
                  <input type="text" name="username" id="agent" class="form-control" placeholder="代理点" />
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
                  <select class="form-control" name="status" id="status">
                    <option></option>
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
          <input type="button" class="btn btn-success" value="查找" onclick="find()"/>
          <input type="button" class="btn btn-success" value="删除" onclick="deleteChoose()"/>
        </div>
      </div>
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
              查看信息
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
        <c:forEach items="${list}" var="evaluation">
          <tr>
            <td class="checkbox-column"><input type="checkbox" class="uniform" name="subBox"></td>
            <td>${evaluation.id}</td>
            <td>${evaluation.uid.nickname}</td>
            <td>${evaluation.time}</td>
            <td>${evaluation.evaluation_status.name}</td>
            <td><label data-toggle="modal" data-target="#InfoModal"><a onclick="getUserinfo('${evaluation.uid.expectingDate}','${evaluation.uid.weight}','${evaluation.uid.afterWeight}','${evaluation.uid.height}','${evaluation.uid.age}','${evaluation.uid.birthorder}','${evaluation.uid.eutocia==1?"顺产":"剖腹产"}','${evaluation.uid.feed==1?"哺乳":"非哺乳"}')">查看</a></label></td>
            <td>
              <label data-toggle="modal" data-target="#Check1Modal"><a onclick="getResult(1,'${evaluation.uid.uid}')">查看</a></label>
            </td>
            <td>
              <label data-toggle="modal" data-target="#Check5Modal"><a onclick="getResult(5,'${evaluation.uid.uid}')">查看</a></label>
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
      </div>
    </div><!-- /.row -->

  </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->


<!-- Add Modal -->
<div class="modal fade" id="InfoModal" tabindex="-1" role="dialog" aria-labelledby="FindModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >用户填写信息</h4>
      </div>
      <div class="form-horizontal">
        <div class="form-group">
          <label class="control-label col-md-3">预产期</label>
          <label class="control-label col-md-3" id="p1"></label>
        </div>
        <div class="form-group">
          <label class="control-label col-md-3">孕前体重(KG)</label>
          <label class="control-label col-md-3" id="p2"></label>
        </div>
        <div class="form-group">
          <label class="control-label col-md-3">当前体重(KG)</label>
          <label class="control-label col-md-3" id="p3"></label>
        </div>
        <div class="form-group">
          <label class="control-label col-md-3">身高(CM)</label>
          <label class="control-label col-md-3" id="p4"></label>
        </div>
        <div class="form-group">
          <label class="control-label col-md-3">年龄(周岁)</label>
          <label class="control-label col-md-3" id="p5"></label>
        </div>
        <div class="form-group">
          <label class="control-label col-md-3">胎次</label>
          <label class="control-label col-md-3" id="p6"></label>
        </div>
        <div class="form-group">
          <label class="control-label col-md-3">顺产/剖产</label>
          <label class="control-label col-md-3" id="p7"></label>
        </div>
        <div class="form-group">
          <label class="control-label col-md-3">哺乳/非哺乳</label>
          <label class="control-label col-md-3" id="p8"></label>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="Check5Modal" tabindex="-1" role="dialog" aria-labelledby="FindModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="Check5ModalLabel">五分钟评测结果</h4>
      </div>
      <div class="form-horizontal">
        <div class="form-group">
          <label class="control-label col-md-3">您的体质是</label>
          <label class="control-label col-md-3" id="bodyCondition2"></label>
        </div>
        <div id="check5">
          <div class="form-group">
            <label class="control-label col-md-3">这写个体质类型</label>
            <label class="control-label col-md-3">得分</label>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- Check Modal -->
<div class="modal fade" id="Check1Modal" tabindex="-1" role="dialog" aria-labelledby="FindModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="Check1ModalLabel">一分钟评测结果</h4>
      </div>
      <div class="form-horizontal" >
        <div class="form-group">
          <label class="control-label col-md-3">您的体质是</label>
          <label class="control-label col-md-3" id="bodyCondition"></label>
        </div >
        <div id="check1">
          <div class="form-group">
            <label class="control-label col-md-3">这写个体质类型</label>
            <label class="control-label col-md-3">得分</label>
          </div>
        </div>
      </div>
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
  function getUserinfo(p1,p2,p3,p4,p5,p6,p7,p8){
    $("#p1").html(p1)
    $("#p2").html(p2)
    $("#p3").html(p3)
    $("#p4").html(p4)
    $("#p5").html(p5)
    $("#p6").html(p6)
    $("#p7").html(p7)
    $("#p8").html(p8)
  }
  function getResult(type,uid){
    $.ajax({
      url:"<%=request.getContextPath()%>/Evaluate/getResult",
      type:"post",
      data:{type:type,uid:uid},
      dataType:"json",
      success:function(data){
        if(type==1){
          $("#bodyCondition").html(data.result);
          var result="";
          $(data.resultList).each(function(index,element){
            console.log(element.name)
            result+=" <div class='form-group'> " +
            "<label class='control-label col-md-3'>"+element.name+"</label> " +
            "<label class='control-label col-md-3'>"+element.countNum+"</label> " +
            "</div>"
          })
          $("#check1").html(result)
        }else{
          $("#bodyCondition2").html(data.result);
          var result="";
          $(data.resultList).each(function(index,element){
            console.log(element.BCid.name)
            result+=" <div class='form-group'> " +
            "<label class='control-label col-md-3'>"+element.BCid.name+"</label> " +
            "<label class='control-label col-md-3'>"+element.score+"</label> " +
            "</div>"
          })
          $("#check5").html(result)
        }
      }
    })
  }
  function find(){
    var name=$("#name").val()
    var fromDatetime=$("#fromDatetime").val();
    var toDatetime=$("#toDatetime").val();
    var status=$("#status").val()
    var agent=$("#agent").val();
    location.href="<%=request.getContextPath()%>/Evaluate/evaluate2?name="+name+"&agent="+agent+"&fromDatetime="+fromDatetime+"&toDatetime="+toDatetime+"&status="+status+"&pn=1"
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
        url: "<%=request.getContextPath()%>/Evaluate/delete",
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
</script>
</body>
</html>
