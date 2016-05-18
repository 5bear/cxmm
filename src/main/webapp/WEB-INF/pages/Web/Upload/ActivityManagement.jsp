<%@ page language="java" import="com.springapp.entity.Admin" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%
    Admin admin= (Admin) session.getAttribute("admin");
    if(admin==null)
    {
        response.sendRedirect("login");
        return;
    }
    int totalPage= (Integer) request.getAttribute("totalPage");
    int currentPage= (Integer) request.getAttribute("totalPage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>活动管理</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=application.getContextPath()%>/Web/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Add custom CSS here -->
    <link href="<%=application.getContextPath()%>/Web/Upload/back/css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/Web/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/Web/Upload/back/css/style.css">
    <link href="../suyati-line-control/editor.css" type="text/css" rel="stylesheet"/>
</head>

<body>

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="../Backstage/NavigationBar.jsp">
        <jsp:param name="pageName" value="Activity"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="newsm.html"><i class="icon-dashboard"></i>活动管理</a></li>
                </ol>
            </div>
            <div class="col-lg-12">
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#AddModal">
                    添加
                </button>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#FindModal">
                    查找
                </button>
                <button type="button" class="btn btn-success">
                    删除
                </button>
            </div>
            <div class="col-md-12">
                <table class="table table-striped table-bordered table-hover table-checkable" cellspacing="0"
                       width="100%">
                    <thead>
                    <tr>
                        <th class="checkbox-column">
                            <input type="checkbox" class="uniform" name="check" onclick="cli('check');" id="checkAll">
                        </th>
                        <th>
                            标题
                        </th>
                        <th>
                            状态
                        </th>
                        <th>
                            链接
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${activityList}" var="news">
                        <tr>
                            <td class="checkbox-column">
                                <input type="checkbox" class="uniform" name="subBox">
                            </td>

                            <td>
                                    ${news.title}
                            </td>
                            <td>
                                    ${news.newsStatusE}
                            </td>
                            <td>
                                ${news.url}
                            </td>
                            <td>
                                <a href="Detail/${news.id}" target="_blank">查看</a>
                                <a href="Edit/${news.id}">编辑</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <jsp:include page="../Backstage/page.jsp" flush="true">
                    <jsp:param name="currentPage" value="<%=currentPage%>"></jsp:param>
                    <jsp:param name="totalPage" value="<%=totalPage%>"></jsp:param>
                    <jsp:param name="url" value="ActivityManagement"></jsp:param>
                </jsp:include>
            </div>
        </div><!-- /.row -->

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- Find Modal -->
<div class="modal fade" id="FindModal" tabindex="-1" role="dialog" aria-labelledby="FindModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="FindModalLabel">查找</h4>
            </div>
            <form class="form-horizontal" id="find_admin" novalidate="novalidate">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label col-md-3">标题</label>
                        <div class="col-md-5">
                            <input type="text" name="title" class="form-control" placeholder="标题"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">状态</label>
                        <div class="col-md-3">
                            <select class="form-control" name="newsStatusE">
                                    <option value='可用'>可用</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer"><input type="button" class="btn btn-success" value="查找" onclick=""/>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Add Modal -->
<div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="AddModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="AddModalLabel">添加</h4>
            </div>
            <form:form class="form-horizontal" id="add_admin" novalidate="novalidate" method="post" action="./Add"
                       enctype="multipart/form-data" modelAttribute="news" accept-charset="utf-8">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label col-md-3">标题</label>
                        <div class="col-md-7">
                            <input type="text" name="title" class="form-control" placeholder="标题" id="title"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">状态</label>
                        <div class="col-md-3">
                            <select class="form-control" name="newsStatusE" id="newsStatus">
                                <option value="可用">可用</option>
                                <option value="失效">失效</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">上传图片</label>
                        <div class="col-md-5">
                            <input type="file" name="file"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">摘要</label>
                        <div class="col-md-5">
                            <input type="text" name="summary" class="form-control" placeholder="摘要" id="summary"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">活动链接</label>
                        <div class="col-md-5">
                            <input type="text" name="url" class="form-control" placeholder="活动链接" id="link"/>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-success" value="保存" onclick=""/>
                </div>
            </form:form>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script src="<%=application.getContextPath()%>/Web/jquery/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/Web/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../jquery.uniform/jquery.uniform.min.js"></script>
<script src="../suyati-line-control/editor.js"></script>
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