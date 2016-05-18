<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.springapp.entity.Agent" %>
<%
    Agent agent= (Agent) session.getAttribute("agent");
    if(agent==null){
        response.sendRedirect("agentLogin");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>代理者管理</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/Web/Upload/back/css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="<%=request.getContextPath()%>/Web/Upload/back/css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/back/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/back/js/jquery.uniform.min.js">
    </script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/back/css/style.css">
        <script>
      $(document).ready(function() {
        $("#datepicker").datepicker({defaultDate:+0,showOtherMonths:true,autoSize:true,dateFormat:"yy-mm-dd"});
      });
    </script>
  </head>

  <body>

    <div id="wrapper">

      <!-- Sidebar -->
     <jsp:include page="../Backstage/agentNavi.jsp">
         <jsp:param name="pageName" value="joinerm"></jsp:param>
     </jsp:include>

      <div id="page-wrapper">

        <div class="row">
          <div class="col-lg-12">
            <ol class="breadcrumb">
              <li><a href="#"><i class="icon-dashboard"></i>评估记录</a></li>
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
                                    <input type="text" name="username" class="form-control" placeholder="姓名" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">代理点名称</label>
                                <div class="col-md-7">
                                    <input type="text" name="username" class="form-control" placeholder="代理点" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">评估时间</label>
                                <div class="col-md-3">
                                    <input type="text" data-language="en" class="form-control datepicker-here" placeholder="年/月/日">
                                </div>
                                <label class="control-label col-md-1">到</label>
                                <div class="col-md-3">
                                    <input type="text" data-language="en" class="form-control datepicker-here" placeholder="年/月/日">
                                </div>

                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">状态</label>
                                <div class="col-md-2">
                                    <select class="form-control" name="state">
                                        <option value='N' >只评估</option>
                                        <option value='Y' >已打印</option>
                                        <option value='Y' >已购买</option>
                                    </select>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-success" value="查找" onclick=""/>
                    <input type="button" class="btn btn-success" value="订单升级" onclick=""/>
                    <input type="button" class="btn btn-success" value="生成文件" onclick=""/>
                    <input type="button" class="btn btn-success wlxx" value="添加物流信息" onclick=""/>
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
                            代理点
                        </th>
                        <th>
                            评估时间
                        </th>
                        <th>
                            状态
                        </th>
                        <th>
                            查看报告
                        </th>
                        <th>
                            添加菜单
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                  <c:forEach items="${list}" var="evaluation">
                      <tr>
                          <td class="checkbox-column"><input type="checkbox" class="uniform" name="subBox"></td>
                          <td>${evaluation.id}</td>
                          <td>${evaluation.uid.agent}</td>
                          <td>${evaluation.time}</td>
                          <td>${evaluation.evaluation_status.name}</td>
                          <td>
                              <a class="tzbg">查看</a>
                          </td>
                          <td>
                              <a href="menu.html"> 添加</a>
                          </td>
                      </tr>
                  </c:forEach>
                    <tr>
                        <td class="checkbox-column">
                            <input type="checkbox" class="uniform" name="subBox">
                        </td>

                        <td>
                            001
                        </td>
                        <td>
                            李四
                        </td>
                        <td>
                            浦东区代理点
                        </td>
                        <td>
                            2016/3/29
                        </td>
                        <td>
                            已打印
                        </td>
                        <td>
                            <a class="tzbg">查看</a>
                        </td>
                        <td>
                            <a href="menu.html"> 添加</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
             <section class="archive-pages">
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
		  </section>
                    </div>
        </div><!-- /.row -->

      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->
    <script src="<%=request.getContextPath()%>/Web/Upload/back/js/jquery-1.10.2.js"></script>
    <script src="<%=request.getContextPath()%>/Web/Upload/back/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/Web/Upload/js/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
	<link href="<%=request.getContextPath()%>/Web/Upload/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
	<script src="<%=request.getContextPath()%>/Web/Upload/dist/js/datepicker.js"></script>
	<script src="<%=request.getContextPath()%>/Web/Upload/dist/js/i18n/datepicker.en.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/js/eModal.js"></script>
	<script type="text/javascript">
	 $('.wlxx').click(function () {
		 return eModal.alert({
             title: '快递信息',
             message:  '<form class="form-horizontal" id="add_admin" action=""  novalidate="novalidate"><div class="modal-body"><div class="form-group"><label class="control-label col-md-3">快递单号</label><div class="col-md-5"><input type="text" name="username" class="form-control" placeholder="快递单号" /></div></div><div class="form-group"><label class="control-label col-md-3">快递公司</label><div class="col-md-5"><input type="text" name="username" class="form-control" placeholder="快递公司" /></div></div><div class="form-group"><label class="control-label col-md-3">发货时间</label><div class="col-md-5"><input type="text" name="username" class="form-control" placeholder="发货时间" /></div></div><div class="form-group"><label class="control-label col-md-3">收件人姓名</label><div class="col-md-5"><input type="text" name="username" class="form-control" placeholder="收件人姓名" /></div></div><div class="form-group"><label class="control-label col-md-3">收件人联系方式</label><div class="col-md-5"><input type="text" name="username" class="form-control" placeholder="手机号码" /></div></div></div><div class="modal-footer"><input type="button" class="btn btn-success" value="添加" onclick=""/></div></form>',
         });
     });
	 $('.tzbg').click(function () {
		 return eModal.alert({
             title: '体质报告',
             message:  '<div class="form-body"><div class="form-group"><label class="control-label col-md-3">您的体质是：</label><p>XX型</p></div><div class="form-group"><label class="control-label col-md-3">专家意见：</label><p>多喝热水多运动，少发脾气（或者这里换成图片也行，因为不知道具体内容，所以暂时这么排版了）</p></div></div>',
             });
     });
     $('.jiesuan').click(function () {
         return eModal.alert({
             title: '结算',
             message:  '<form class="form-horizontal" id="add_admin" novalidate="novalidate"><div class="modal-body"><div class="form-wizard"><div class="form-body"><div class="form-group"><label class="control-label col-md-3">书提成比例</label><div class="col-md-3"><input type="text" class="form-control" value="0.2"></div><label class="control-label col-md-3">盒提成比例</label><div class="col-md-3"><input type="text" class="form-control" value="0.3"></div></div><div class="form-group"><label class="control-label col-md-3">开始月</label><div class="col-md-3"><input type="text" class="form-control" placeholder="年/月"></div><label class="control-label col-md-3">结束月</label><div class="col-md-3"><input type="text" class="form-control" placeholder="年/月"></div></div><div class="modal-footer"><input type="submit" class="btn btn-success" value="结算" onclick="alert(\'1月份　卖了10书，20盒，获得提成2030元。\'+\'\\n\'+\'2月份　卖了10书，20盒，获得提成2030元。\'+\'\\n\'+\'总计：卖了10书，20盒，获得提成2030元。\')"/></div></form>',
         });
     });
   $(function(){
      $("#data").dropdown('toggle');
      }); 
</script>
<script type="text/javascript">
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