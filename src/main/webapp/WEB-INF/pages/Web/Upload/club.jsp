<%@ page import="com.springapp.entity.Admin" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    Admin admin= (Admin) session.getAttribute("admin");
    if(admin==null)
    {
        response.sendRedirect(request.getContextPath()+"/login");
        return;
    }
    int totalPage= (Integer) request.getAttribute("totalPage");
    int currentPage= (Integer) request.getAttribute("currentPage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>会所管理</title>

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
    <jsp:include page="../Backstage/NavigationBar.jsp">
        <jsp:param name="pageName" value="Club"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="#"><i class="icon-dashboard"></i>会所管理</a></li>
                    <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
                </ol>
            </div>
            <form class="form-horizontal" id="add_admin" novalidate="novalidate">
                <div class="modal-footer">
                    <input type="button" class="btn btn-success" value="可用" onclick="validChoose()"/>
                    <input type="button" class="btn btn-success" value="失效" onclick="invalidChoose()"/>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#AddModal">
                        添加
                    </button>
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
                            会所名称
                        </th>
                        <th>
                            地址
                        </th>
                        <th>
                            联系电话
                        </th>
                        <th>
                            账号
                        </th>
                        <th>
                            密码
                        </th>
                        <th>
                            状态
                        </th>
                        <th>
                            到期时间
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                    </thead>
                    <tbody id="myTbody">
                    <c:forEach items="${list}" var="club">
                        <tr>
                            <td class="checkbox-column"><input type="checkbox" class="uniform" name="subBox"></td>
                            <td>${club.id}</td>
                            <td>${club.club}</td>
                            <td>${club.address}</td>
                            <td>${club.linkNo}</td>
                            <td>${club.account}</td>
                            <td>${club.password}</td>
                            <td>${club.status}</td>
                            <td>${club.invalidDate}</td>
                            <td><label data-toggle="modal" data-target="#EditModal"><a
                                    onclick="setEditid('${club.id}','${club.club}','${club.address}','${club.linkNo}','${club.account}','${club.password}','${club.invalidDate}','${club.status}')">修改</a></label>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <jsp:include page="../Backstage/page.jsp" flush="true">
                    <jsp:param name="currentPage" value="<%=currentPage%>"></jsp:param>
                    <jsp:param name="totalPage" value="<%=totalPage%>"></jsp:param>
                    <jsp:param name="url" value="Club"></jsp:param>
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
<div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="FindModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="AddModalLabel">添加</h4>
            </div>
            <form:form class="form-horizontal" id="add" novalidate="novalidate" modelAttribute="club" action="Club/add"
                       method="post">
                <div class="modal-body">
                    <div class="form-wizard">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-3">会所名称</label>
                                <div class="col-md-5">
                                    <input type="text" name="club" class="form-control" placeholder="会所名称"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">地址</label>
                                <div class="col-md-5">
                                    <input type="text" name="address" class="form-control" placeholder="地址"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">联系电话</label>
                                <div class="col-md-5">
                                    <input type="text" name="linkNo" class="form-control" placeholder="电话号码"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">账号</label>
                                <div class="col-md-5">
                                    <input type="text" name="account" class="form-control" placeholder="账号"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">密码</label>
                                <div class="col-md-5">
                                    <input type="text" name="password" class="form-control" placeholder="密码"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">到期时间</label>
                                <div class="col-md-5">
                                    <input type="text" data-language="en" name="invalidDate"
                                           class="form-control datepicker-here" placeholder="年/月/日">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">状态</label>
                                <div class="col-md-3">
                                    <select class="form-control" name="status">
                                        <option value="可用">可用</option>
                                        <option value="失效">失效</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-success" value="添加"/>
                </div>
            </form:form>
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
                                <label class="control-label col-md-3">会所名称</label>
                                <div class="col-md-5">
                                    <input type="text" name="club" id="findClub" class="form-control" placeholder="会所名称"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">状态</label>
                                <div class="col-md-3">
                                    <select class="form-control" name="status" id="findStatus">
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
                    <input type="button" class="btn btn-success" data-dismiss="modal"   value="查找" onclick="findRecord()"/>
                </div>
       </div>
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
            <form:form class="form-horizontal" id="banlance" novalidate="novalidate">
                <div class="modal-body">
                    <div class="form-wizard">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-3">书提成比例</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" value="0.2">
                                </div>
                                <label class="control-label col-md-3">盒提成比例</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" value="0.3">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">开始月</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" placeholder="年/月">
                                </div>
                                <label class="control-label col-md-3">结束月</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" placeholder="年/月">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="结算"
                                       onclick=alert('1月份　卖了10书，20盒，获得提成2030元。'+'\n'+'2月份　卖了10书，20盒，获得提成2030元。'+'\n'+'总计：卖了10书，20盒，获得提成2030元。')/>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>

<!-- Edit Modal -->
<div class="modal fade" id="EditModal" tabindex="-1" role="dialog" aria-labelledby="EditModalLabel">
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
                                <label class="control-label col-md-3">会所名称</label>
                                <div class="col-md-5">
                                    <input type="text" id="club" name="club" class="form-control" placeholder="会所名称"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">地址</label>
                                <div class="col-md-5"><input type="text" id="address" name="address"
                                                             class="form-control" placeholder="地址"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">联系电话</label>
                                <div class="col-md-5">
                                    <input type="text" name="linkNo" id="linkNo" class="form-control"
                                           placeholder="电话号码"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">账号</label>
                                <div class="col-md-5">
                                    <input type="text" name="account" id="account" class="form-control"
                                           placeholder="账号"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">密码</label>
                                <div class="col-md-5">
                                    <input type="text" name="password" id="password" class="form-control"
                                           placeholder="密码"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">到期时间</label>
                                <div class="col-md-5">
                                    <input type="text" name="invalidDate" id="invalidDate" data-language="en"
                                           class="form-control datepicker-here" placeholder="年/月/日">
                                </div>
                            </div>
                                <%--  <div class="form-group"><label class="control-label col-md-3">上传二维码</label>
                                      <div class="col-md-5">
                                          <input type="file" name="uploadfile"/>
                                      </div>
                                  </div>--%>
                            <div class="form-group">
                                <label class="control-label col-md-3">状态</label>
                                <div class="col-md-3">
                                    <select class="form-control" name="status" id="status">
                                        <option value="可用">可用</option>
                                        <option value="失效">失效</option>
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


<!-- Comment Modal -->
<div class="modal fade" id="CommentModal" tabindex="-1" role="dialog" aria-labelledby="AddModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="CommentModalLabel">结算</h4>
            </div>
            <img src="<%=request.getContextPath()%>/Web/images/erweima.jpg" width=\'200\' height=\'200\'/>
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
    function findRecord(){
        var club=$("#findClub").val();
        var status=$("#findStatus").val();
        $.ajax({
            url:"<%=request.getContextPath()%>/Club/find",
            type:"post",
            data:{club:club,status:status},
            dataType:"json",
            success: function (data) {
                var result="";
                $(data).each(function (index, item) {
                    result+="<tr> " +
                    "<td class='checkbox-column'><input type='checkbox' class='uniform' name='subBox'></td> " +
                    "<td>"+item.id+"</td>"+
                    "<td>"+item.club+"</td>"+
                    "<td>"+item.address+"</td>"+
                    "<td>"+item.linkNo+"</td>"+
                    "<td>"+item.account+"</td>"+
                    "<td>"+item.password+"</td>"+
                    "<td>"+item.status+"</td>"+
                    "<td>"+item.invalidDate+"</td>"+
                    "<td><label data-toggle='modal' data-target='#EditModal'><a " +
                    "onclick='setEditid('"+item.id+"','"+item.club+"','"+item.address+"','"+item.linkNo+"','"+item.account+"','"+item.password+"','"+item.invalidDate+"','"+item.status+"')'>" +
                    "修改</a></label> </td> </tr>"
                })
                $("#myTbody").html(result)
            }
        })
    }

    function setEditid(id, name, address, linkNo, account, password, invalidDate, status) {
        $("[name='id']").val(id);
        $("#club").val(name);
        $("#address").val(address);
        $("#linkNo").val(linkNo);
        $("#account").val(account);
        $("#password").val(password);
        $("#invalidDate").val(invalidDate);
        $("#status").find("option[value=" + status + "]").attr("selected", true);
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
                url: "Club/delete",
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
                url: "Club/changeStatus",
                data: {infoList: infoList, type: 0},
                success: function (result) {
                    if (result == "success") {
                        $(idList).each(function (index, data) {
                            if (data.checked) {
                                $(data).parent().parent().find('td:eq(7)').html("失效");
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
                url: "Club/changeStatus",
                data: {infoList: infoList, type: 1},
                success: function (result) {
                    if (result == "success") {
                        $(idList).each(function (index, data) {
                            if (data.checked) {
                                $(data).parent().parent().find('td:eq(7)').html("可用");
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