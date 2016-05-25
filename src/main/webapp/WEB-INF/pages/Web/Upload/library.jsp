<%@ page import="com.springapp.entity.Admin" %><%
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

    <title>书库管理</title>

    <!-- Bootstrap core CSS -->
    <link href="back/css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="back/css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="back/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="back/js/jquery.uniform.min.js">
    </script>
    <link rel="stylesheet" href="back/css/style.css">
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
    <jsp:include page="../Backstage/NavigationBar.jsp" flush="true">
        <jsp:param name="pageName" value="book"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="#"><i class="icon-dashboard"></i>书库管理</a></li>
                    <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
                </ol>
            </div>

            <div class="col-md-12">
                <form action="uploadFile" enctype="multipart/form-data" method="POST">
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-success" value="上传"/>
                    </div>
                    <table class="table table-striped table-bordered table-hover table-checkable" cellspacing="0"
                           width="100%">
                        <thead>
                        <tr>
                            <th>
                                方案
                            </th>
                            <th>
                                周次
                            </th>
                            <th>
                                气虚
                            </th>
                            <th>
                                阳虚
                            </th>
                            <th>
                                阴虚
                            </th>
                            <th>
                                痰湿
                            </th>
                            <th>
                                特禀
                            </th>
                            <th>
                                平和
                            </th>
                            <th>
                                血瘀
                            </th>
                            <th>
                                湿热
                            </th>
                            <th>
                                气郁
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
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第二周
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第三周
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                        <tr>
                            <td>
                                第四周
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
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
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第二周
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第三周
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                        <tr>
                            <td>
                                第四周
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
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
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第二周
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第三周
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                        <tr>
                            <td>
                                第四周
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
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
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第二周
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第三周
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                        <tr>
                            <td>
                                第四周
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                            <td>
                                <input type="button" class="btn btn-success" value="选择文件" onclick=""/>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div><!-- /.row -->

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="js/jquery.min.js" type="text/javascript"></script>
<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/eModal.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        $("#txtEditor").Editor();

    });
    $('.sort').click(function () {
        return eModal.alert({
            title: '二维码',
            message: '<form class="form-horizontal" id="add_admin" novalidate="novalidate"><div class="modal-body"><div class="form-group"><label class="control-label col-md-3">新闻标题</label><div class="col-md-5"><input type="text" name="username" class="form-control" placeholder="标题" /></div></div><div class="form-group"><label class="control-label col-md-3">状态</label><div class="col-md-3"><select class="form-control" name="state"><option value=\'Y\' >可用</option><option value=\'N\' >失效</option></select></div></div></div><div class="modal-footer"><input type="button" class="btn btn-success sort" value="查找" onclick=""/></div></form>',
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $("#checkAll").click(function () {
            // 	alert($("input[name='subBox']").length);
            if ($("input[name='subBox']").length == $("input[name='subBox']:checked").length) {
                $("input[name='subBox']").prop("checked", false);
            } else {
                $("input[name='subBox']").prop("checked", true);
            }

        });
        $("input[name='subBox']").click(function () {
            //	alert($("input[name='subBox']").length+" "+$("input[name='subBox']:checked").length);
            $("#checkAll").prop("checked", $("input[name='subBox']").length == $("input[name='subBox']:checked").length ? true : false);
        });
    });
</script>

</body>
</html>