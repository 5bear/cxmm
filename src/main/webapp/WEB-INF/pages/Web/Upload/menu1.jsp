<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>菜单</title>

    <!-- Bootstrap core CSS -->
    <link href="back/css/bootstrap.css" rel="stylesheet">
      <link href="menu/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <!-- Add custom CSS here -->
    <link href="back/css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="back/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="back/js/jquery.uniform.min.js">
    </script>
    <link rel="stylesheet" href="back/css/style.css">
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
          <a class="navbar-brand" href="menu.html">菜单</a>
        </div>


      </nav>

      <div id="page-wrapper">

        <div class="row">
          <div class="col-lg-12">
            <ol class="breadcrumb">
              <li><a href="menu.html"><i class="icon-dashboard"></i>菜单</a></li>
           <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
            </ol>
          </div>            
          <form class="form-horizontal" id="add_admin" action=""  novalidate="novalidate">
            <div class="modal-body">
              
                <div class="form-wizard">
                  <div class="form-body">
                      <div class="form-group">
                          <label class="control-label col-md-3">周数</label>
                           <div class="col-md-2">
							<select class="form-control" name="state">
                            <option value='N' onclick="document.getElementById('a').disabled='false'">4周</option>
                            <option value='Y' >8周</option>
                            <option value='Y' >12周</option>
                                <option value='Y' >16周</option>
                                <option value='Y' >自定义 </option>
                            </select>
                          </div>
                      </div>
                      </div>
                </div>
              
            </div>
            <div class="modal-footer">
              <input type="button" class="btn btn-success" value="提交" onclick=""/>
            </div>
            </form>         
                    <div class="col-md-12">
                            <form enctype="multipart/form-data">
                                <div class="form-group">
                                    <label class="control-label col-md-3">1-4周</label>
                                    <input class="file-1" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="4" data-max-file-count="4" id="a">
                                </div>
                                <hr>
                                <hr>
                            </form>
                        <form enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="control-label col-md-3">5-8周</label>
                                <input class="file-1" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="4" data-max-file-count="4" disabled="true" id="b">
                            </div>
                            <hr>
                            <hr>
                        </form>
                        <form enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="control-label col-md-3">9-12周</label>
                                <input class="file-1" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="4" data-max-file-count="4" disabled="true" id="c">
                            </div>
                            <hr>
                            <hr>
                        </form>
                        <form enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="control-label col-md-3">13-16周</label>
                                <input class="file-1" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="4" data-max-file-count="4" disabled="true" id="d">
                            </div>
                            <hr>
                            <hr>
                        </form>
                    </div>
        </div><!-- /.row -->

      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->

    <!-- JavaScript -->
    <script src="back/js/jquery-1.10.2.js"></script>
    <script src="back/js/bootstrap.js"></script>
    <script src="js/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
	<link href="dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
	<script src="dist/js/datepicker.js"></script>
	<script src="dist/js/i18n/datepicker.en.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script src="menu/js/fileinput.js" type="text/javascript"></script>
    <script src="menu/js/fileinput_locale_zh.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/eModal.js"></script>
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
    <script>
        $(".file-1").fileinput({
            uploadUrl: '#', // you must set a valid URL here else you will get an error
            allowedFileExtensions : ['jpg', 'png','gif'],
            overwriteInitial: false,
            maxFileSize: 1000,
            maxFilesNum: 4,
            //allowedFileTypes: ['image', 'video', 'flash'],
            slugCallback: function(filename) {
                return filename.replace('(', '_').replace(']', '_');
            }
        });
        $(document).ready(function() {
            $("#test-upload").fileinput({
                'showPreview' : false,
                'allowedFileExtensions' : ['jpg', 'png','gif'],
                'elErrorContainer': '#errorBlock'
            });
        });
    </script>
  </body>
</html>