<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>书库管理</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/Web/Upload/back/css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="<%=request.getContextPath()%>/Web/Upload/back/css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/back/font-awesome/css/font-awesome.min.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/back/js/jquery.uniform.min.js">
    </script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/back/css/style.css">
    <style type="text/css">
        .fileUpload {
            position: relative;
            overflow: hidden;
            margin: 10px;
        }

        .fileUpload input.upload {  position: absolute;
            top: 0;
            right: 0;
            margin: 0;
            padding: 0;
            font-size: 20px;
            cursor: pointer;
            opacity: 0;
            filter: alpha(opacity=0);
        }
    </style>
</head>

<body>

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="../Backstage/NavigationBar.jsp">
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
                <form action = "uploadFile" enctype = "multipart/form-data" method = "POST">
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-success" value="上传"/>
                    </div>
                    <table class="table table-striped table-bordered table-hover table-checkable" cellspacing="0" width="100%">
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
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input1" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file1" onchange="input1.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <!--div class="fileUpload">
                                    <label for="file2" class="btn btn-success">选择文件</label>
                                    <input type="file" class="upload" name="file" id="file2"/>
                                </div-->
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input2" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file2" onchange="input2.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input3" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file3" onchange="input3.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input4" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file4" onchange="input4.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input5" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file5" onchange="input5.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input6" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file6" onchange="input6.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input7" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file7" onchange="input7.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input8" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file8" onchange="input8.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input9" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file9" onchange="input9.value=this.value"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第二周
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input10" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file10" onchange="input10.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input11" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file11" onchange="input11.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input12" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file12" onchange="input12.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input13" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file13" onchange="input13.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input14" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file14" onchange="input14.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input15" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file15" onchange="input15.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input16" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file16" onchange="input16.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input17" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file17" onchange="input17.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input18" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file18" onchange="input18.value=this.value"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第三周
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input19" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file19" onchange="input19.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input20" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file20" onchange="input20.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input21" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file21" onchange="input21.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input22" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file22" onchange="input22.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input23" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file23" onchange="input23.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input24" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file24" onchange="input24.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input25" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file25" onchange="input25.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input26" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file26" onchange="input26.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input27" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file27" onchange="input27.value=this.value"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第四周
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input28" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file28" onchange="input28.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input29" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file29" onchange="input29.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input30" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file30" onchange="input30.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input31" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file31" onchange="input31.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input32" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file32" onchange="input32.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input33" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file33" onchange="input33.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input34" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file34" onchange="input34.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input35" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file35" onchange="input35.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input36" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file36" onchange="input36.value=this.value"/>
                                </div>
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
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input37" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file37" onchange="input37.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input38" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file38" onchange="input38.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input39" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file39" onchange="input39.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input40" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file40" onchange="input40.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input41" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file41" onchange="input41.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input42" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file42" onchange="input42.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input43" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file43" onchange="input43.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input44" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file44" onchange="input44.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input45" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file45" onchange="input45.value=this.value"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第二周
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input46" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file46" onchange="input46.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input47" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file47" onchange="input47.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input48" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file48" onchange="input48.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input49" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file49" onchange="input49.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input50" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file50" onchange="input50.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input51" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file51" onchange="input51.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input52" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file52" onchange="input52.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input53" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file53" onchange="input53.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input54" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file54" onchange="input54.value=this.value"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第三周
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input55" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file55" onchange="input55.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input56" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file56" onchange="input56.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input57" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file57" onchange="input57.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input58" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file58" onchange="input58.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input59" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file59" onchange="input59.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input60" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file60" onchange="input60.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input61" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file61" onchange="input61.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input62" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file62" onchange="input62.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input63" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file63" onchange="input63.value=this.value"/>
                                </div>
                            </td>
                        <tr>
                            <td>
                                第四周
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input64" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file64" onchange="input64.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input65" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file65" onchange="input65.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input66" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file66" onchange="input66.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input67" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file67" onchange="input67.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input68" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file68" onchange="input68.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input69" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file69" onchange="input69.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input70" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file70" onchange="input71.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input71" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file71" onchange="input71.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input72" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file72" onchange="input72.value=this.value"/>
                                </div>
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
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input73" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file73" onchange="input73.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input74" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file74" onchange="input74.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input75" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file75" onchange="input75.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input76" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file76" onchange="input76.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input77" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file77" onchange="input77.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input78" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file78" onchange="input78.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input79" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file79" onchange="input79.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input80" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file80" onchange="input80.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input81" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file81" onchange="input81.value=this.value"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第二周
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input82" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file82" onchange="input82.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input83" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file83" onchange="input83.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input84" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file84" onchange="input84.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input85" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file85" onchange="input85.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input86" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file86" onchange="input86.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input87" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file87" onchange="input87.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input88" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file88" onchange="input88.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input89" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file89" onchange="input89.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input90" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file90" onchange="input90.value=this.value"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第三周
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input91" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file91" onchange="input91.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input92" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file92" onchange="input92.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input93" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file93" onchange="input93.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input94" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file94" onchange="input94.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input95" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file95" onchange="input95.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input96" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file96" onchange="input96.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input97" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file97" onchange="input97.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input98" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file98" onchange="input98.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input99" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file99" onchange="input99.value=this.value"/>
                                </div>
                            </td>
                        <tr>
                            <td>
                                第四周
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input100" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file100" onchange="input100.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input101" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file101" onchange="input101.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input102" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file102" onchange="input102.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input103" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file103" onchange="input103.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input104" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file104" onchange="input104.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input105" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file105" onchange="input105.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input106" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file106" onchange="input106.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input107" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file107" onchange="input107.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input108" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file108" onchange="input108.value=this.value"/>
                                </div>
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
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input109" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file109" onchange="input109.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input110" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file110" onchange="input110.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input111" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file111" onchange="input111.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input112" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file112" onchange="input112.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input113" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file113" onchange="input113.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input114" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file114" onchange="input114.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input115" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file115" onchange="input115.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input116" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file116" onchange="input116.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input117" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file117" onchange="input117.value=this.value"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第二周
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input118" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file118" onchange="input118.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input119" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file119" onchange="input119.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input120" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file120" onchange="input120.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input121" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file121" onchange="input121.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input122" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file122" onchange="input122.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input123" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file123" onchange="input123.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input124" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file124" onchange="input124.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input125" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file125" onchange="input125.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input126" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file126" onchange="input126.value=this.value"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第三周
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input127" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file127" onchange="input127.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input128" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file128" onchange="input128.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input129" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file129" onchange="input129.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input130" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file130" onchange="input130.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input131" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file131" onchange="input131.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input132" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file132" onchange="input132.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input133" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file133" onchange="input133.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input134" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file134" onchange="input134.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input135" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file135" onchange="input135.value=this.value"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                第四周
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input136" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file136" onchange="input136.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input137" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file137" onchange="input13.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input138" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file138" onchange="input138.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input139" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file139" onchange="input139.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input140" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file140" onchange="input140.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input141" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file141" onchange="input141.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input142" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file142" onchange="input142.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input143" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file143" onchange="input143.value=this.value"/>
                                </div>
                            </td>
                            <td>
                                <div class="fileUpload">
                                    <input class="btn btn-success" type="button" id="input144" value="选择文件"/>
                                    <input type="file" class="upload" name="file" id="file144" onchange="input144.value=this.value"/>
                                </div>
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
<script src="<%=request.getContextPath()%>/Web/Upload/js/jquery.min.js" type="text/javascript"></script>
<%--<script>window.jQuery || document.write('<script src='<%=request.getContextPath()%>/Web/Upload/js/jquery-2.1.1.min.js\"><script>')</script>--%>
<script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Web/Upload/js/eModal.js"></script>
<script type="text/javascript">
    $(document).ready( function() {

        $("#txtEditor").Editor();

    });
    $('.sort').click(function () {
        return eModal.alert({
            title: '二维码',
            message:  '<form class="form-horizontal" id="add_admin" novalidate="novalidate"><div class="modal-body"><div class="form-group"><label class="control-label col-md-3">新闻标题</label><div class="col-md-5"><input type="text" name="username" class="form-control" placeholder="标题" /></div></div><div class="form-group"><label class="control-label col-md-3">状态</label><div class="col-md-3"><select class="form-control" name="state"><option value=\'Y\' >可用</option><option value=\'N\' >失效</option></select></div></div></div><div class="modal-footer"><input type="button" class="btn btn-success sort" value="查找" onclick=""/></div></form>',
        });
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

</body>
</html>