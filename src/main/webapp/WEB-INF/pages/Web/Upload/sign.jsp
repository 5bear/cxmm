<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/10
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
  <title>培训报名</title>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Web/Upload/img/style.css"/>
  <link href="<%=request.getContextPath()%>/Web/Upload/back/css/bootstrap.css" rel="stylesheet">
  <link href="http://mat1.gtimg.com/www/base/base.css" rel="stylesheet" type="text/css">
  <link href="http://health.qq.com/css/index2014/css_07.css" rel="stylesheet" type="text/css">
  <script src="http://mat1.gtimg.com/joke/Koala/Qfast1.0.1.js" type="text/javascript"></script>
  <script src="http://mat1.gtimg.com/www/js/Koala/Koala.min.1.5.js" type="text/javascript"></script>
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
  </style>
</head>
<body>
<div class="main">
  <div  id="fh5co-home">
    <div style="background-image: url(<%=request.getContextPath()%>/Web/Upload/images/pic1.PNG);"class="flexslider">
      <div class="fh5co-overlay"></div>
      <div class="fh5co-text">
        <br> <br> <br>
        <div>
          <div align="center">
            <table>
              <tr>
               <jsp:include page="../Backstage/Navi.jsp"></jsp:include>
              </tr>
            </table>
          </div>
          </nav>
        </div>
        <br><br><br>
      </div>
    </div>
  </div>
  <div class="bar"><b>培训报名</b></div>
  <div class="left">
    <div class="main_content">
      <h2 class="title4">报名培训</h2>
      <div class="title5">请填写报名信息，我们将在几个工作日内给您回复</div>
     <from:form class="form-horizontal" id="add_admin" novalidate="novalidate" modelAttribute="train" action="" method="post">
       <div class="modal-body">
         <div class="form-group">
           <label class="control-label col-md-3">姓名</label>
           <div class="col-md-5">
             <input type="text" name="name" class="form-control" placeholder="姓名" />
           </div>
         </div>
         <div class="form-group">
           <label class="control-label col-md-3">性别</label>
           <div class="col-md-5">
             <select class="form-control" name="sex">
               <option value="男">男</option>
               <option value="女">女</option>
             </select>
           </div>
         </div>
         <div class="form-group">
           <label class="control-label col-md-3">联系方式</label>
           <div class="col-md-7">
             <input type="text" name="phoneNum" class="form-control" placeholder="电话" />
           </div>
         </div>
         <div class="form-group">
           <label class="control-label col-md-3">家庭住址</label>
           <div class="col-md-7">
             <input type="text" name="address" class="form-control" placeholder="家庭住址" />
           </div>
         </div>
         <div class="form-group">
           <label class="control-label col-md-3">自我介绍</label><br>
           <div class="col-md-12">
             &nbsp;&nbsp;&nbsp;<textarea cols="47" rows="7" placeholder="自我介绍" name="remo"></textarea>
           </div>
           <br><br>
           <div class="modal-footer">
             <input type="submit" class="btn btn-success" value="提交" onclick=""/>
           </div>
         </div>

       </div>
     </from:form>
    </div>
  </div>
  <div class="clear"></div>
</div>
</body>
</html>