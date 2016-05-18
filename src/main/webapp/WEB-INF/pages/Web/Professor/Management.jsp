<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>专家管理</title>
    <!-- Bootstrap core CSS -->
    <link href="<%=application.getContextPath()%>/Web/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Add custom CSS here -->
    <link href="<%=application.getContextPath()%>/Web/Upload/back/css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/Web/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/Web/Upload/back/css/style.css">
</head>

<body>

<div id="wrapper">
    <!-- Sidebar -->
    <jsp:include page="../Backstage/NavigationBar.jsp">
        <jsp:param name="pageName" value="professor"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="professorm.html"><i class="icon-dashboard"></i>专家管理</a></li>
                </ol>
            </div>
            <div class="col-lg-12">
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#AddModal">
                    添加
                </button>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#FindModal">
                    查找
                </button>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#DeleteModal">
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
                        <!--禁止删除此列，也不要添加其他内容进去。-->
                        <th style="display: none"></th>
                        <th>
                            专家名称
                        </th>
                        <th>
                            手机号码
                        </th>
                        <th>
                            邮箱
                        </th>
                        <th>
                            推荐链接
                        </th>
                        <th>
                            状态
                        </th>
                        <th>

                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${ProfessorList}" var="professor">
                        <tr>
                            <td class="checkbox-column">
                                <input type="checkbox" class="uniform" name="subBox">
                            </td>
                            <!--禁止删除此列，也不要添加其他内容进去。-->
                            <td style="display: none">
                                    ${professor.id}
                            </td>
                            <td>
                                    ${professor.name}
                            </td>
                            <td>
                                    ${professor.phone}
                            </td>
                            <td>
                                    ${professor.email}
                            </td>
                            <td>
                                    ${professor.link}
                            </td>
                            <td>
                                    ${professor.professor_status.name}
                            </td>
                            <td>
                                <a href="Edit/${professor.id}">编辑</a>
                            </td>
                        </tr>
                    </c:forEach>
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

<!-- Find Modal -->
<div class="modal fade" id="FindModal" tabindex="-1" role="dialog" aria-labelledby="FindModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="FindModalLabel">查找</h4>
            </div>
            <form class="form-horizontal" novalidate="novalidate" method="post"
                  action="<%=application.getContextPath()%>/Professor/Management">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label col-md-3">专家姓名</label>
                        <div class="col-md-5">
                            <input type="text" name="name" class="form-control" placeholder="姓名"/>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-success" value="查找" onclick=""/>
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
                       enctype="multipart/form-data" modelAttribute="professor" accept-charset="utf-8">
                <div class="modal-body">
                    <div class="form-group"><label class="control-label col-md-3">专家姓名</label>
                        <div class="col-md-7">
                            <input type="text" name="name" class="form-control" placeholder="姓名"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">手机号码</label>
                        <div class="col-md-7">
                            <input type="text" name="phone" class="form-control" placeholder="手机号码"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">邮箱</label>
                        <div class="col-md-7">
                            <input type="text" name="email" class="form-control" placeholder="邮箱"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">推荐链接</label>
                        <div class="col-md-7">
                            <input type="text" name="link" class="form-control" placeholder="推荐链接"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">职称</label>
                        <div class="col-md-7">
                            <input type="text" name="title" class="form-control" placeholder="职称"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">简介</label>
                        <div class="col-md-7">
                            <textarea type="text" name="introduction" class="form-control" placeholder="简介"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">上传照片</label>
                        <div class="col-md-5">
                            <input type="file" name="file"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">状态</label>
                        <div class="col-md-3">
                            <select class="form-control" name="professorStatus">
                                <c:forEach items="${ProfessorStatusList}" var="professorStatus">
                                    <option value='${professorStatus.professorStatusId}'>${professorStatus.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-success" value="添加" onclick=""/>
                </div>
            </form:form>
        </div>
    </div>
</div>

<!-- Delete Modal -->
<div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog" aria-labelledby="DeleteModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="DeleteModalLabel">删除</h4>
            </div>
            <div class="modal-body">
                <h3>确认删除选中项？</h3>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" onclick="deleteChoose()">删除</button>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script src="<%=application.getContextPath()%>/Web/jquery/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/Web/bootstrap/js/bootstrap.min.js"></script>
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
            if ($("input[name='subBox']").length == $("input[name='subBox']:checked").length) {
                $("input[name='subBox']").prop("checked", false);
            } else {
                $("input[name='subBox']").prop("checked", true);
            }
        });
        $("input[name='subBox']").click(function () {
            $("#checkAll").prop("checked", $("input[name='subBox']").length == $("input[name='subBox']:checked").length ? true : false);
        });
    });
</script>
<script>
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
                url: "<%=application.getContextPath()%>/Professor/Delete",
                data: {infoList: infoList, type: 0},
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