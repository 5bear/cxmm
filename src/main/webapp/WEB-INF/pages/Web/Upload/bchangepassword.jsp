<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>后台管理</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/Web/Upload/back/css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="<%=request.getContextPath()%>/Web/Upload/back/css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/back/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/back/js/jquery.uniform.min.js">
    </script>
  </head>

  <body>

    <div id="wrapper">

      <!-- Sidebar -->
          <jsp:include page="../Backstage/NavigationBar.jsp">
              <jsp:param name="pageName" value="changepwd"></jsp:param>
          </jsp:include>

      <div id="page-wrapper">

        <div class="row">
		  <div class="col-lg-12">
            <ol class="breadcrumb">
              <li><a href="#"><i class="icon-dashboard"></i>修改密码</a></li>
           <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
            </ol>
          </div>
		  <div class="form-group">
                          <label class="control-label col-md-3">旧密码</label>
                          <div class="col-md-7">
                            <input type="text" name="opsw" class="form-control"/>
                          </div>
                      </div><br><br><br>
                      <div class="form-group">
                          <label class="control-label col-md-3">新密码</label>
                          <div class="col-md-7">
                            <input type="text" name="npsw" class="form-control"/>
                          </div>
                      </div><br><br>
                      <div class="form-group">
                          <label class="control-label col-md-3">重复新密码</label>
                          <div class="col-md-7">
                            <input type="text" name="rppsw" class="form-control"/>
                          </div>
                      </div><br><br>
                      <div class="modal-footer">
              <input type="submit" class="btn btn-success" value="提交" onclick=""/>
            </div>
        </div><!-- /.row -->

      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->
    <script src="<%=request.getContextPath()%>/Web/Upload/back/js/jquery-1.10.2.js"></script>
    <script src="<%=request.getContextPath()%>/Web/Upload/back/js/bootstrap.js"></script>
    <script>
   $(function(){
      $("#history").dropdown('toggle');
      }); 
</script>

  </body>
</html>