<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/10
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>证书信息</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Web/Upload/img/style.css"/>
    <link href="<%=request.getContextPath()%>/Web/Upload/back/css/bootstrap.css" rel="stylesheet">
    <link href="http://mat1.gtimg.com/www/base/base.css" rel="stylesheet" type="text/css">
    <link href="http://health.qq.com/css/index2014/css_07.css" rel="stylesheet" type="text/css">
    <script src="http://mat1.gtimg.com/joke/Koala/Qfast1.0.1.js" type="text/javascript"></script>
    <script src="http://mat1.gtimg.com/www/js/Koala/Koala.min.1.5.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Web/Upload/js/jquery.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Web/Upload/js/jquery-1.10.2.js"></script>
    <style type="text/css">
        table
        {
            border-left: 1px solid #fff;
            border-right: 1px solid #fff;
            border-top: 1px solid #fff;
            border-bottom: 1px solid #fff;
        }
        td
        {
            font-family: "Roboto Slab", sans-serif;
            font-size: 18px;
            font-weight: 900;
            color: #f1715e;
            border-right: 0px solid #fff;
            padding: 15px 30px;
            text-align: center;
            width:300px;
            cursor:pointer;
        }
    </style><!-- #38C8AA -->
</head>
<body class="login">
<div style="background-image: url(<%=request.getContextPath()%>/Web/Upload/images/pic1.png);"class="flexslider">
    <div class="fh5co-overlay"></div>
    <div class="fh5co-text">
        <br> <br> <br><br>
        <div>
            <div align="center">
                <table>
                    <tr>
                        <jsp:include page="../Backstage/Navi.jsp"></jsp:include>
                    </tr>
                </table>
            </div>
        </div>
        <br><br><br><br>
    </div>
</div>

<div style="padding-left:250px;padding-right:250px  ">
    <div class="main_content">
        <form class="form-horizontal" id="add_admin" novalidate="novalidate">
            <div class="modal-body">
                <br><br><br>
                <div class="form-group">
                    <label class="control-label col-md-3">姓名</label>
                    <div class="col-md-5">
                        <input type="text" name="username" id="name" class="form-control" placeholder="姓名" />
                    </div>
                </div>
                <br><br>
                <div class="modal-footer">
                    <input type="button" class="btn btn-success" value="查询" onclick="find()"/>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="clear"></div>
</body>
<script>
    function find(){
        var name=$("#name").val();
        if(name==""){
            alert("姓名不能为空");
            return true
        }
        $.ajax({
            url:"<%=request.getContextPath()%>/Train/getCerti",
            type:"post",
            data:{name:name},
            success:function(data){
                if(data=="NotFound")
                    alert("没找到您的证书");
                else if(data=="fail")
                    alert("暂未发证");
                else
                    window.open("<%=request.getContextPath()%>/Train/certinfo?id="+data)
            }
        })
    }
</script>
</html>

