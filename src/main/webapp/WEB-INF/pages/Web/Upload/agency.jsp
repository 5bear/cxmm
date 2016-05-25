<%@ page import="com.springapp.entity.Admin" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("login");
        return;
    }
    int totalPage = (Integer) request.getAttribute("totalPage");
    int currentPage = (Integer) request.getAttribute("currentPage");
%>
<!DOCTYPE html>
<html lang="zh" class="no-js demo1">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>代理点管理</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/Web/Upload/back/css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="<%=request.getContextPath()%>/Web/Upload/back/css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/back/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/back/js/jquery.uniform.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/js/My97DatePicker4.7.2/WdatePicker.js"></script>
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
    <jsp:include page="../Backstage/NavigationBar.jsp">
        <jsp:param name="pageName" value="Agency"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="#"><i class="icon-dashboard"></i>代理点管理</a></li>
                    <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
                </ol>
            </div>
            <form class="form-horizontal" novalidate="novalidate">
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#BalanceModal">
                        结算
                    </button>
                    <input type="button" class="btn btn-success" value="可用" onclick="validChoose()"/>
                    <input type="button" class="btn btn-success" value="失效" onclick="invalidChoose()"/>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#FindModal">
                        查找
                    </button>
                    <button type="button" class="btn btn-success" onclick="deleteChoose()">
                        删除
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
                            编号
                        </th>
                        <th>
                            代理点名称
                        </th>
                        <th>
                            手机号
                        </th>
                        <th>
                            邮箱
                        </th>
                        <th>
                            用户数量
                        </th>
                        <th>
                            餐册购买数量
                        </th>
                        <th>
                            餐盒购买数量
                        </th>
                        <th>
                            查看二维码
                        </th>
                        <th>
                            状态
                        </th>
                    </tr>
                    </thead>
                    <tbody id="myTbody">
                    <c:forEach items="${list}" var="agent">
                        <tr>
                            <td class="checkbox-column"><input type="checkbox" class="uniform" name="subBox"></td>
                            <td>${agent.id}</td>
                            <td>${agent.agent}</td>
                            <td>${agent.phoneNum}</td>
                            <td>${agent.email}</td>
                            <td>${agent.userNum}</td>
                            <td>${agent.canceNum}</td>
                            <td>${agent.canheNum}</td>
                            <td><label data-toggle="modal" data-target="#CommentModal"><a
                                    onclick="setImgpath('${agent.id}')">查看</a></label></td>
                            <td>${agent.status}</td>
                            <%--<td><label data-toggle="modal" data-target="#EditModal"><a
                                    onclick="setEditid('${agent.id}','${agent.agent}','${agent.phoneNum}','${agent.email}','${agent.account}','${agent.password}','${agent.qrcode}','${agent.status}')">修改</a></label>
                            </td>--%>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <jsp:include page="../Backstage/page.jsp" flush="true">
                    <jsp:param name="currentPage" value="<%=currentPage%>"></jsp:param>
                    <jsp:param name="totalPage" value="<%=totalPage%>"></jsp:param>
                    <jsp:param name="url" value="Agency"></jsp:param>
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
                <h4 class="modal-title" id="AddModalLabel">添加</h4>
            </div>
            <form:form class="form-horizontal" id="add" novalidate="novalidate" modelAttribute="agent"
                       action="Agency/add" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="form-wizard">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-3">代理点名称</label>
                                <div class="col-md-5">
                                    <input type="text" name="agent" class="form-control" placeholder="代理点"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">登陆账号</label>
                                <div class="col-md-5">
                                    <input type="text" name="account" class="form-control" placeholder="登陆账号"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">密码</label>
                                <div class="col-md-5">
                                    <input type="text" name="password" class="form-control" placeholder="密码"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">手机号</label>
                                <div class="col-md-5">
                                    <input type="text" name="phoneNum" class="form-control" placeholder="手机号码"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">邮箱</label>
                                <div class="col-md-5">
                                    <input type="text" name="email" class="form-control" placeholder="邮箱"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">上传二维码</label>
                                <div class="col-md-5">
                                    <input type="file" name="file"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">状态</label>
                                <div class="col-md-3">
                                    <select class="form-control col-md-3" name="status">
                                        <option value="可用">可用</option>
                                        <option value="失效">失效</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-success sort" value="添加" onclick=""/>
                </div>
            </form:form>
        </div>
    </div>
</div>

<!-- Find Modal -->
<div class="modal fade" id="FindModal" tabindex="-1" role="dialog" aria-labelledby="AddModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="FindModalLabel">查找</h4>
            </div>
            <form:form class="form-horizontal" id="find" novalidate="novalidate">
                <div class="modal-body">
                    <div class="form-wizard">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-3">代理点名称</label>
                                <div class="col-md-5">
                                    <input type="text" id="findAgent" name="phonenumber" class="form-control"
                                           placeholder="代理点"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">状态</label>
                                <div class="col-md-3">
                                    <select class="form-control col-md-3" name="state" id="findStatus">
                                        <option value=""></option>
                                        <option value="可用">可用</option>
                                        <option value="失效">失效</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-success sort" value="查找" onclick="findRecord()"/>
                </div>
            </form:form>
        </div>
    </div>
</div>

<!-- Balance Modal -->
<div class="modal fade" id="BalanceModal" tabindex="-1" role="dialog" aria-labelledby="AddModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="BalanceModalLabel">结算</h4>
            </div>
            <div class="form-horizontal" >
                <div class="modal-body">
                    <div class="form-wizard">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-3">代理点</label>
                                <div class="col-md-3">
                                  <select class="form-control" id="agentId">
                                     <c:forEach items="${list}" var="agent">
                                         <option value="${agent.id}">${agent.agent}</option>
                                     </c:forEach>
                                  </select>
                                </div>
                                <label class="control-label col-md-3">书提成比例</label>
                                <div class="col-md-3">
                                    <input type="text"  id="canceRate" class="form-control" value="0.2">
                                </div>
                                <label class="control-label col-md-3">盒提成比例</label>
                                <div class="col-md-3">
                                    <input type="text" id="canheRate" class="form-control" value="0.3">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">开始月</label>
                                <div class="col-md-3">
                                    <input type="text" id="startDate" class="form-control" placeholder="年/月" onfocus="WdatePicker({dateFmt:'yyyy/MM'})">
                                </div>
                                <label class="control-label col-md-3">结束月</label>
                                <div class="col-md-3">
                                    <input type="text" id="endDate" class="form-control" placeholder="年/月" onfocus="WdatePicker({dateFmt:'yyyy/MM'})">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="结算"
                                       onclick="balance()"/>
                            </div>
                        </div>
                    </div>
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
            <form:form class="form-horizontal" id="edit" novalidate="novalidate" modelAttribute="agent"
                       action="Agency/edit/" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="form-wizard">
                        <div class="form-body">
                            <div class="form-group" style="display: none">
                                <label class="control-label col-md-3">代理点名称</label>
                                <div class="col-md-5">
                                    <input name="id" class="form-control" placeholder="代理点">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">代理点名称</label>
                                <div class="col-md-5">
                                    <input name="agent" id="agent" class="form-control" placeholder="代理点">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">登陆账号</label>
                                <div class="col-md-5">
                                    <input name="account" id="account" class="form-control" placeholder="登陆账号">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">密码</label>
                                <div class="col-md-5">
                                    <input name="password" id="password" class="form-control" placeholder="密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">手机号</label>
                                <div class="col-md-5">
                                    <input type="text" name="phoneNum" id="phoneNum" class="form-control"
                                           placeholder="手机号码"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">邮箱</label>
                                <div class="col-md-5">
                                    <input type="text" name="email" id="email" class="form-control" placeholder="邮箱"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">上传二维码</label>
                                <div class="col-md-5">
                                    <input type="file" name="file"/>
                                    <img src="" id="imgid" width="200" height="200">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">状态</label>
                                <div class="col-md-3">
                                    <select class="form-control col-md-3" name="status" id="status">
                                        <option value="可用">可用</option>
                                        <option value="失效">失效</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-success sort" value="保存修改" onclick=""/>
                </div>
            </form:form>
        </div>
    </div>
</div>


<!-- Comment Modal -->
<div class="modal fade" id="CommentModal" tabindex="-1" role="dialog" aria-labelledby="AddModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="CommentModalLabel">二维码</h4>
            </div>
            <img src="<%=request.getContextPath()%>/Web/Upload/images/erweima.jpg" id="qrcode" width="200"
                 height="200"/>
        </div>
    </div>
</div>


<script src="<%=request.getContextPath()%>/Web/Upload/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/Web/Upload/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/js/eModal.js"></script>
<script type="text/javascript">

    function balance(){
        var agentId=$("#agentId").val();
        var canheRate=$("#canheRate").val();
        var canceRate=$("#canceRate").val();
        var startDate=$("#startDate").val();
        var endDate=$("#endDate").val();
       window.open("Agency/balance?agentId="+agentId+"&canheRate="+canheRate+"&canceRate="+canceRate+"&startDate="+startDate+"&endDate="+endDate);
    }

    function findRecord() {
        var club = $("#findAgent").val();
        var status = $("#findStatus").val();
        $.ajax({
            url: "<%=request.getContextPath()%>/Agency/find",
            type: "post",
            data: {club: club, status: status},
            dataType: "json",
            success: function (data) {
                var result = "";
                $(data).each(function (index, item) {
                    result += "<tr> " +
                            "<td class='checkbox-column'><input type='checkbox' class='uniform' name='subBox'></td> " +
                            "<td>" + item.id + "</td>" +
                            "<td>" + item.agent + "</td>" +
                            "<td>" + item.phoneNum + "</td>" +
                            "<td>" + item.email + "</td>" +
                            "<td>" + item.userNum + "</td>" +
                            "<td>" + item.canceNum + "</td>" +
                            "<td>" + item.canheNum + "</td>" +
                            "<td><label data-toggle='modal' data-target='#CommentModal'><a onclick='setImgpath('" + item.id + "')'>查看</a></label></td>" +
                            "<td>" + item.status + "</td></tr>";
                })
                $("#myTbody").html(result)
            }
        })
    }

    function setEditid(id, agent, phoneNum, email, images, status) {
        $("[name='id']").val(id);
        $("#agent").val(agent);
        $("#phoneNum").val(phoneNum);
        $("#email").val(email);
        $("#imgid").attr("src", "<%=request.getContextPath()%>/Web/Upload/qrcode/" + images);
        $("#status").find("option[value=" + status + "]").attr("selected", true);
    }

    function setImgpath(path) {
        console.log(path)
        $('#qrcode').attr('src', "<%=request.getContextPath()%>/WeiXin/AgentQRCode/" + path + ".jpg")
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
                url: "Agency/delete",
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
    /*失效*/
    function invalidChoose() {
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
                url: "Agency/changeStatus",
                data: {infoList: infoList, type: 1},
                success: function (result) {
                    if (result == "success") {
                        $(idList).each(function (index, data) {
                            if (data.checked) {
                                $(data).parent().parent().find('td:eq(9)').html("失效");
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
    /*可用*/
    function validChoose() {
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
                url: "Agency/changeStatus",
                data: {infoList: infoList, type: 0},
                success: function (result) {
                    if (result == "success") {
                        $(idList).each(function (index, data) {
                            if (data.checked) {
                                $(data).parent().parent().find('td:eq(9)').html("可用");
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