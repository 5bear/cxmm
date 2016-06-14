<%@ page import="com.springapp.entity.Admin" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Admin admin= (Admin) session.getAttribute("admin");
    if(admin==null)
    {
        response.sendRedirect(request.getContextPath()+"/login");
        return;
    }
    int totalPage= (Integer) request.getAttribute("totalPage");
    int currentPage= (Integer) request.getAttribute("currentPage");
    String name= (String) request.getAttribute("name");
    if(name==null)
        name="";
    String status= (String) request.getAttribute("status");
    if(status==null)
        status="";
    String fromDatetime= (String) request.getAttribute("fromDatetime");
    if(fromDatetime==null)
        fromDatetime="";
    String toDatetime= (String) request.getAttribute("toDatetime");
    if(toDatetime==null)
        toDatetime="";
    String url="certi?name="+name+"&fromDatetime="+fromDatetime+"&toDatetime="+toDatetime+"&status="+status+"&";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>证书管理</title>

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
        <jsp:param name="pageName" value="certi"></jsp:param>
    </jsp:include>
    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="#"><i class="icon-dashboard"></i>证书管理</a></li>
                    <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
                </ol>
            </div>
            <div class="form-horizontal">
                <div class="modal-body">

                    <div class="form-wizard">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-3">姓名</label>
                                <div class="col-md-7">
                                    <input type="text" name="username" id="name" class="form-control" placeholder="姓名"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">状态</label>
                                <div class="col-md-2">
                                    <select class="form-control" name="state" id="status">
                                        <option value='已报名'>已报名</option>
                                        <option value='已培训'>已培训</option>
                                        <option value='已发证'>已发证</option>
                                        <option value='失效'>失效</option>
                                    </select>

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3"> 时间</label>
                                <div class="col-md-3">
                                    <input type="text" id="fromDatetime" data-language="en" class="form-control datepicker-here"
                                           placeholder="年/月/日">
                                </div>
                                <label class="control-label col-md-1">到</label>
                                <div class="col-md-3">
                                    <input type="text" id="toDatetime" data-language="en" class="form-control datepicker-here"
                                           placeholder="年/月/日">
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-success" value="设置为已培训" onclick="setType(0)"/>
                    <input type="button" class="btn btn-success" value="设置为已发证" onclick="setType(1)"/>
                    <input type="button" class="btn btn-success" value="设置为失效" onclick="setType(2)"/>
                    <input type="button" class="btn btn-success" value="查找" onclick="find()"/>
                </div>
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
                            编号
                        </th>
                        <th>
                            姓名
                        </th>
                        <th>
                            手机号
                        </th>
                        <th>
                            状态
                        </th>
                        <th>
                            培训时间
                        </th>
                        <th>
                            查看证书
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <c:forEach items="${list}" var="train">
                    <tr>
                        <td class="checkbox-column"><input type="checkbox" class="uniform" name="subBox"></td>
                        <td>${train.id}</td>
                        <td>${train.name}</td>
                        <td>${train.phoneNum}</td>
                        <td>${train.status}</td>
                        <td>${train.trainTime}</td>
                        <td><label data-toggle="modal" data-target="#AddModal"><a onclick="certi('${train.id}','${train.name}','${train.sex}','${train.trainTime}','${train.licenseTime}','${train.licenseNum}')">添加/修改</a></label><label style="display: ${train.status=="已发证"?"":"none"}"><a href="<%=request.getContextPath()%>/Train/certinfo?id=${train.id}" target="_blank">查看</a></label></td>
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
<div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="FindModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="AddModalLabel">添加证书信息</h4>
            </div>
            <div class="form-horizontal">
                <div class="modal-body">
                    <div class="form-wizard">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="control-label col-md-3">姓名</label>
                                <div class="col-md-5">
                                    <input type="text" name="username" id="username" class="form-control" placeholder="姓名"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">性别</label>
                                <div class="col-md-5">
                                    <input type="text" name="username" id="sex" class="form-control" placeholder="性别"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">培训时间</label>
                                <div class="col-md-5">
                                    <input type="text" id="trainTime" data-language="en" class="form-control datepicker-here"
                                           placeholder="年/月/日">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">发证时间</label>
                                <div class="col-md-5">
                                    <input type="text" data-language="en" id="licenseTime" class="form-control datepicker-here"
                                           placeholder="年/月/日">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3">证书编号</label>
                                <div class="col-md-5">
                                    <input type="text" name="username" id="licenseNum" class="form-control" placeholder="证书编号"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-success" value="添加" onclick="addCertiInfo()"/>
                </div>
           </div>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script src="<%=request.getContextPath()%>/Web/Upload/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/Web/Upload/js/jquery-1.10.2.js"></script>
<link href="<%=request.getContextPath()%>/Web/Upload/dist/css/datepicker.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/Web/Upload/dist/js/datepicker.js"></script>
<script src="<%=request.getContextPath()%>/Web/Upload/dist/js/i18n/datepicker.en.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/js/eModal.js"></script>
<script type="text/javascript">
    var idForEdit;
    function find(){
        var name=$("#name").val()
        var fromDatetime=$("#fromDatetime").val();
        var toDatetime=$("#toDatetime").val();
        var status=$("#status").val()
        location.href="<%=request.getContextPath()%>/Train/certi?name="+name+"&fromDatetime="+fromDatetime+"&toDatetime="+toDatetime+"&status="+status+"&pn=<%=currentPage%>"
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
    function certi(id,name,sex,trainTime,licenseTime,licenseNum){
        idForEdit=id
        $("#username").val(name);
        $("#sex").val(sex)
        $("#trainTime").val(trainTime);
        $("#licenseTime").val(licenseTime);
        $("#licenseNum").val(licenseNum);
    }
    /*设置状态*/
    function setType(type) {
        var status;
        if(type==0)
            status="已培训"
        else if(type==1)
            status="已发证"
        else
            status="失效"
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
                url: "changeStatus",
                data: {infoList: infoList, status: status},
                success: function (result) {
                    if (result == "success") {
                        $(idList).each(function (index, data) {
                            if (data.checked) {
                                $(data).parent().parent().find('td:eq(4)').html(status);
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
    /*添加证书信息*/
    function addCertiInfo() {
        var sex=$("#sex").val();
        var trainTime=$("#trainTime").val();
        var licenseTime=$("#licenseTime").val();
        var licenseNum=$("#licenseNum").val();
        $.ajax({
            url:"addCertiInfo",
            type:"post",
            data:{id:idForEdit,sex:sex,trainTime:trainTime,licenseTime:licenseTime,licenseNum:licenseNum},
            success:function(data){
                location.reload(true)
            }
        })
    }
</script>

</body>
</html>