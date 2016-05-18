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
  <title>培训信息</title>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Web/Upload/img/style.css"/>
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
  </style><!-- #38C8AA -->
</head>
<body class="login">
    <div style="background-image: url(<%=request.getContextPath()%>/Web/Upload/images/pic1.PNG);"class="flexslider">
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
      <br>
      <h2 class="title4"><font color="#38C8AA">培训课程介绍</font></h2>
      <div class="title5">基础课程包括三门课程： 普通心理学、社会心理学、发展心理学</div>
      <p>１．普通心理学：</br>

        　　是一门讲述心理活动最普遍、最一般规律的学科，是心理咨询学习中最基础的课程。通过普通心理学的学习，我们能够更科学的描述求助者自身的人格特点及其所面临的问题和困扰，能够从整体上对求助者的情况有比较准确把握。</br>

        ２．社会心理学：</br>

        　　 学习目标是为了了解和解释个体的思想、感情和行为怎样受他人存在的影响而发生变化的，研究领域涉及个体、团体、社会三个层面。通过社会心理学的学习，我们可以更清楚地从求助者所生存的社会环境去了解并理解求助者，分析可能造成求助者困扰的原因，进而帮助求助者提高社会适应能力。</br>

        ３．发展心理学：</br>

        　　是研究心理的发生发展规律的学科。通过发展心理学的学习，我们能够发现求助者成长过程中的非正常现象，了解求助者出现困扰的心理发展历史上的原因，引导求助者认识到自己困扰的根源，平稳度过非常时期。</p>
      <h2 class="title4"><font color="#38C8AA">合作院校</font></h2>
      <div class="title5"></div>
      <p align="center">华威大学</br>
        意大利教育联盟</br>
        德国富克旺根艺术大学</br>
        香港知专设计学院HKDI</br>
        香港高等科技教育学院</br>
        费城大学</p>
      <br><br>
      <h2 class="title4"><a href="/Train/sign"><div class="pic"><img src="<%=request.getContextPath()%>/Web/Upload/images/signin.png" width="100" height="100"/></div></a></h2>
      <h2 class="title4"><font color="#38C8AA">在线报名</font></h2>
      <br><br>
      <h2 class="title4"><h2 class="title4"><a href="/Train/license"><div class="pic"><img src="<%=request.getContextPath()%>/Web/Upload/images/license.png" width="100" height="100"/></div></a></h2></h2>
      <h2 class="title4"><font color="#38C8AA">证书查询</font></h2>
      <br><br><br><br>
    </div>
  </div>
  <div class="clear"></div>
</div>

</body>
</html>

