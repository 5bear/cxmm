<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>菜单</title>

    <!-- Bootstrap core CSS -->
    <link href="Upload/back/css/bootstrap.css" rel="stylesheet">
      <link href="Upload/menu/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <!-- Add custom CSS here -->
    <link href="Upload/back/css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="Upload/back/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="Upload/back/js/jquery.uniform.min.js">
    </script>
    <link rel="stylesheet" href="Upload/back/css/style.css">
  </head>

  <body>

    <div id="wrapper">

      <!-- Sidebar -->
        <jsp:include page="../Backstage/NavigationBar.jsp">
            <jsp:param name="pageName" value=""></jsp:param>
        </jsp:include>

      <div id="page-wrapper">

        <div class="row">
          <div class="col-lg-12">
            <ol class="breadcrumb">
              <li><i class="icon-dashboard"></i>菜单</li>
           <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
            </ol>
          </div>
            <form:form class="form-horizontal" role="form" modelAttribute="menuModel"
                       action="" method="post" novalidate="novalidate">
            <div class="modal-footer">
                <div class="col-md-3">
                    <select class="form-control" name="month" id="month">
                        <option value='month1'>第一月</option>
                        <option value='month2'>第二月</option>
                        <option value='month3'>第三月</option>
                    </select>
                </div>
                <input type="submit" class="btn btn-success" value="提交" onclick=""/>
            </div>
                    <div class="col-md-12">
                        <table class="table table-striped table-bordered table-hover table-checkable" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th>
                                    方案
                                </th>
                                <th>
                                    周次
                                </th>
                                <th>
                                    <select class="form-control" name="BCList1" id="BCList1">
                                        <c:forEach items="${list}" var="bclist">
                                            <option value='${bclist.bCid}'>${bclist.name}</option>
                                        </c:forEach>
                                    </select>
                                </th>
                                <th>
                                    <select class="form-control" name="BCList2" id="BCList2">
                                        <c:forEach items="${list}" var="bclist">
                                            <option value='${bclist.bCid}'>${bclist.name}</option>
                                        </c:forEach>
                                    </select>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- 方案A -->
                            <tr>
                                <td rowspan="4">
                                    A
                                </td>
                                <td>
                                    第一周
                                </td>
                                <td>
                                    <input type="radio" value="1" name="week1"/>
                                </td>
                                <td>
                                    <input type="radio" value="2" name="week1"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    第二周
                                </td>
                                <td>
                                    <input type="radio" value="1" name="week2"/>
                                </td>
                                <td>
                                    <input type="radio" value="2" name="week2"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    第三周
                                </td>
                                <td>
                                    <input type="radio" value="1" name="week3"/>
                                </td>
                                <td>
                                    <input type="radio" value="2" name="week3"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    第四周
                                </td>
                                <td>
                                    <input type="radio" value="1" name="week4"/>
                                </td>
                                <td>
                                    <input type="radio" value="2" name="week4"/>
                                </td>
                            </tr>
                            <!-- 方案B -->
                            <tr>
                                <td rowspan="4">
                                    B
                                </td>
                                <td>
                                    第一周
                                </td>
                                <td>
                                    <input type="radio" value="3" name="week1"/>
                                </td>
                                <td>
                                    <input type="radio" value="4" name="week1"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    第二周
                                </td>
                                <td>
                                    <input type="radio" value="3" name="week2"/>
                                </td>
                                <td>
                                    <input type="radio" value="4" name="week2"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    第三周
                                </td>
                                <td>
                                    <input type="radio" value="3" name="week3"/>
                                </td>
                                <td>
                                    <input type="radio" value="4" name="week3"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    第四周
                                </td>
                                <td>
                                    <input type="radio" value="3" name="week4"/>
                                </td>
                                <td>
                                    <input type="radio" value="4" name="week4"/>
                                </td>
                            </tr>
                            <!-- 方案C -->
                            <tr>
                                <td rowspan="4">
                                    C
                                </td>
                                <td>
                                    第一周
                                </td>
                                <td>
                                    <input type="radio" value="5" name="week1"/>
                                </td>
                                <td>
                                    <input type="radio" value="6" name="week1"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    第二周
                                </td>
                                <td>
                                    <input type="radio" value="5" name="week2"/>
                                </td>
                                <td>
                                    <input type="radio" value="6" name="week2"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    第三周
                                </td>
                                <td>
                                    <input type="radio" value="5" name="week3"/>
                                </td>
                                <td>
                                    <input type="radio" value="6" name="week3"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    第四周
                                </td>
                                <td>
                                    <input type="radio" value="5" name="week4"/>
                                </td>
                                <td>
                                    <input type="radio" value="6" name="week4"/>
                                </td>
                            </tr>
                            <!-- 方案D -->
                            <tr>
                                <td rowspan="4">
                                    D
                                </td>
                                <td>
                                    第一周
                                </td>
                                <td>
                                    <input type="radio" value="7" name="week1"/>
                                </td>
                                <td>
                                    <input type="radio" value="8" name="week1"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    第二周
                                </td>
                                <td>
                                    <input type="radio" value="7" name="week2"/>
                                </td>
                                <td>
                                    <input type="radio" value="8" name="week2"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    第三周
                                </td>
                                <td>
                                    <input type="radio" value="7" name="week3"/>
                                </td>
                                <td>
                                    <input type="radio" value="8" name="week3"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    第四周
                                </td>
                                <td>
                                    <input type="radio" value="7" name="week4"/>
                                </td>
                                <td>
                                    <input type="radio" value="8" name="week4"/>
                                </td>
                            </tr>
                            </tbody>
                            </table>
                    </div>
            </form:form>
        </div><!-- /.row -->

      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->
    <script src="Upload/back/js/jquery-1.10.2.js"></script>
    <script src="Upload/back/js/bootstrap.js"></script>
    <script src="Upload/js/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
	<link href="Upload/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
	<script src="Upload/dist/js/datepicker.js"></script>
	<script src="Upload/dist/js/i18n/datepicker.en.js"></script>
	<script type="text/javascript" src="Upload/js/bootstrap.min.js"></script>
    <script src="Upload/menu/js/fileinput.js" type="text/javascript"></script>
    <script src="Upload/menu/js/fileinput_locale_zh.js" type="text/javascript"></script>
	<script type="text/javascript" src="Upload/js/eModal.js"></script>
	<script type="text/javascript">
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