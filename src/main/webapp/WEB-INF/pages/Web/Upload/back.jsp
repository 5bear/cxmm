<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>后台管理</title>

    <!-- Bootstrap core CSS -->
    <link href="back/css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="back/css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="back/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="back/js/jquery.uniform.min.js">
    </script>
  </head>

  <body>

    <div id="wrapper">

      <!-- Sidebar -->
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="back.html">后台管理</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li class="dropdown"><a href="/Upload/back"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="dropdown">
                    <a href="/Upload/agency"><i class="fa fa-bar-chart-o"></i>代理点管理</a>
                </li>
                <li class="dropdown">
                    <a href="/Upload/club"><i class="fa fa-bar-chart-o"></i>会所管理</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-table"></i> 评估记录 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/Upload/btestreport1">禅心评估</a></li>
                        <li><a href="/Upload/btestreport2">代理点评估</a></li>
                        <li><a href="/Upload/btestreport3">会所评估</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="/Upload/certi"><i class="fa fa-bar-chart-o"></i> 证书管理</a>
                </li>
                <li class="dropdown">
                    <a href="/Upload/professorm"><i class="fa fa-bar-chart-o"></i> 专家管理</a>
                </li>
                <li class="active">
                    <a href="/Upload/uploadFile"><i class="fa fa-bar-chart-o"></i>书库管理</a>
                </li>
                <li class="dropdown">
                    <a href="/Upload/newsm"><i class="fa fa-bar-chart-o"></i> 新闻管理</a>
                </li>
                <li class="dropdown">
                    <a href="/Upload/bchangepassword"><i class="fa fa-bar-chart-o"></i> 修改密码</a>
                </li>
                <li class="dropdown">
                    <a href="/Upload/index"><i class="fa fa-bar-chart-o"></i> 注销</a>
                </li>
            </ul>

          <ul class="nav navbar-nav navbar-right navbar-user">
          <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">管理员 <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#"><i class="fa fa-user"></i> 用户名</a></li>
                <li class="divider"></li>
                <li><a href="index"><i class="fa fa-power-off"></i> 注销</a></li>
              </ul>
            </li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </nav>

      <div id="page-wrapper">

        <div class="row">
          <div class="col-lg-12">
            <ol class="breadcrumb">
              <li><a href="back.html"><i class="icon-dashboard"></i>首页</a></li>
           <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
            </ol>
          </div>
		  <div class="pic"><!-- 表格 -->
		  <!--  img src="images/index.jpg" width="100%"/-->
		  </div>
        </div><!-- /.row -->

      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->
    <script src="back/js/jquery-1.10.2.js"></script>
    <script src="back/js/bootstrap.js"></script>
    <script>
   $(function(){
      $("#history").dropdown('toggle');
      }); 
</script>

  </body>
</html>