<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>专家管理</title>

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
    <jsp:include page="../Backstage/NavigationBar.jsp">
        <jsp:param name="pageName" value="professor"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="professorm.html"><i class="icon-dashboard"></i>专家管理</a></li>
                    <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
                </ol>
            </div>
            <form class="form-horizontal" id="add_admin" novalidate="novalidate">
                <!--    <div class="modal-body">
                          <div class="form-group">
                                  <label class="control-label col-md-3">专家姓名</label>
                                  <div class="col-md-7">
                                    <input type="text" name="username" class="form-control" placeholder="姓名" />
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="control-label col-md-3">手机号码</label>
                                  <div class="col-md-7">
                                    <input type="text" name="username" class="form-control" placeholder="手机号码" />
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="control-label col-md-3">邮箱</label>
                                  <div class="col-md-7">
                                    <input type="text" name="username" class="form-control" placeholder="邮箱" />
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="control-label col-md-3">状态</label>
                                   <div class="col-md-2">
                                    <select class="form-control" name="state">
                                    <option value='Y' >可用</option>
                                    <option value='N' >失效</option>
                                    </select>
                                  </div>
                        </div>
                    </div>-->
                <div class="modal-footer">
                    <input type="button" class="btn btn-success tjzj" value="添加" onclick=""/>
                    <input type="button" class="btn btn-success sort" value="查找" onclick=""/>
                    <input type="button" class="btn btn-success" value="删除" onclick=""/>
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
                            操作
                        </th>
                        <th>
                            修改照片
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="checkbox-column">
                            <input type="checkbox" class="uniform" name="subBox">
                        </td>

                        <td>
                            001
                        </td>
                        <td>
                            王五
                        </td>
                        <td>
                            ********
                        </td>
                        <td>
                            *****@**.**
                        </td>
                        <td>
                            xxxxxx
                        </td>
                        <td>
                            可用
                        </td>
                        <td>
                            <a class="modify"> 修改</a>
                        </td>
                        <td>
                            <a class="ht"> 修改</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="checkbox-column">
                            <input type="checkbox" class="uniform" name="subBox">
                        </td>

                        <td>
                            002
                        </td>
                        <td>
                            赵六
                        </td>
                        <td>
                            ********
                        </td>
                        <td>
                            *****@**.**
                        </td>
                        <td>
                            xxxxxx
                        </td>
                        <td>
                            失效
                        </td>
                        <td>
                            <a class="modify"> 修改</a>
                        </td>
                        <td>
                            <a class="ht"> 修改</a>
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
<script src="js/jquery.min.js" type="text/javascript"></script>
<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/eModal.js"></script>
<script type="text/javascript">
    $('.tjzj').click(function () {
        return eModal.alert({
            title: '添加专家',
            message: '<form class="form-horizontal" id="add_admin" novalidate="novalidate"><div class="modal-body"><div class="form-group"><label class="control-label col-md-3">专家姓名</label><div class="col-md-7"><input type="text" name="username" class="form-control" placeholder="姓名" /></div></div><div class="form-group"><label class="control-label col-md-3">手机号码</label><div class="col-md-7"><input type="text" name="username" class="form-control" placeholder="手机号码" /></div></div><div class="form-group"><label class="control-label col-md-3">邮箱</label><div class="col-md-7"><input type="text" name="username" class="form-control" placeholder="邮箱" /></div></div><div class="form-group"><label class="control-label col-md-3">推荐链接</label><div class="col-md-7"><input type="text" name="username" class="form-control" placeholder="推荐链接" /></div></div><div class="form-group"><label class="control-label col-md-3">上传照片</label><div class="col-md-5"><input type="file" name="uploadfile"/></div></div><div class="form-group"><label class="control-label col-md-3">状态</label><div class="col-md-3"><select class="form-control" name="state"><option value=\'Y\' >可用</option><option value=\'N\' >失效</option></select></div></div></div><div class="modal-footer"><input type="button" class="btn btn-success" value="添加" onclick=""/></div></form>',
        });
    });
    $('.sort').click(function () {
        return eModal.alert({
            title: '查找专家',
            message: '<form class="form-horizontal" id="add_admin" novalidate="novalidate"><div class="modal-body"><div class="form-group"><label class="control-label col-md-3">专家姓名</label><div class="col-md-7"><input type="text" name="username" class="form-control" placeholder="姓名" /></div></div><div class="form-group"><label class="control-label col-md-3">状态</label><div class="col-md-3"><select class="form-control" name="state"><option value=\'Y\' >可用</option><option value=\'N\' >失效</option></select></div></div></div><div class="modal-footer"><input type="button" class="btn btn-success" value="查找" onclick=""/></div></form>',
        });
    });
    $('.modify').click(function () {
        return eModal.alert({
            title: '修改信息',
            message: '<form class="form-horizontal" id="add_admin" novalidate="novalidate"><div class="modal-body"><div class="form-group"><label class="control-label col-md-3">专家姓名</label><div class="col-md-7"><input type="text" name="username" class="form-control" placeholder="姓名" /></div></div><div class="form-group"><label class="control-label col-md-3">手机号码</label><div class="col-md-7"><input type="text" name="username" class="form-control" placeholder="手机号码" /></div></div><div class="form-group"><label class="control-label col-md-3">邮箱</label><div class="col-md-7"><input type="text" name="username" class="form-control" placeholder="邮箱" /></div></div><div class="form-group"><label class="control-label col-md-3">推荐链接</label><div class="col-md-7"><input type="text" name="username" class="form-control" placeholder="推荐链接" /></div></div><div class="form-group"><label class="control-label col-md-3">上传照片</label><div class="col-md-5"><input type="file" name="uploadfile"/></div></div><div class="form-group"><label class="control-label col-md-3">状态</label><div class="col-md-3"><select class="form-control" name="state"><option value=\'Y\' >可用</option><option value=\'N\' >失效</option></select></div></div></div><div class="modal-footer"><input type="button" class="btn btn-success" value="保存修改" onclick=""/></div></form>',
        });
    });
    $('.ht').click(function () {
        return eModal.alert({
            title: '修改信息',
            message: '<form class="form-horizontal" id="add_admin" novalidate="novalidate"><div class="modal-body"><div class="form-group"><label class="control-label col-md-3">上传照片</label><div class="col-md-5"><input type="file" name="uploadfile"/></div></div><div class="modal-footer"><input type="button" class="btn btn-success" value="保存修改" onclick=""/></div></form>',
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