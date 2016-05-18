<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>体质评估</title>
    <link rel="stylesheet" href="<%=application.getContextPath()%>/Web/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/Web/css/question-style.css">
    <link href='http://fonts.useso.com/css?family=Open+Sans:400,700,800,600,300,200' rel='stylesheet' type='text/css'>
    <link href="<%=application.getContextPath()%>/Web/css/question-responsive.css" rel="stylesheet" media="screen" type="text/css">
    <link rel="stylesheet" href="<%=application.getContextPath()%>/Web/jquery-sidr/stylesheets/jquery.sidr.dark.css">
    <script src="<%=application.getContextPath()%>/Web/jquery/jquery.min.js"></script>
    <script src="<%=application.getContextPath()%>/Web/jquery-sidr/jquery.sidr.min.js"></script>
    <link href="<%=application.getContextPath()%>/Web/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type='text/javascript' src="<%=application.getContextPath()%>/Web/bootstrap/js/bootstrap.js"></script>
    <!-- include the jQuery and jQuery UI scripts -->
    <script src="<%=application.getContextPath()%>/Web/jquery-ui/jquery-ui.min.js"></script>

    <!-- plus a jQuery UI theme, here I use "flick" -->
    <link rel="stylesheet" href="<%=application.getContextPath()%>/Web/jquery-ui/jquery-ui.min.css">

    <link href="<%=application.getContextPath()%>/Web/jquery-ui-slider-pips/jquery-ui-slider-pips.css" rel="stylesheet">
    <script src="<%=application.getContextPath()%>/Web/jquery-ui-slider-pips/jquery-ui-slider-pips.js"></script>
</head>
<body>
<div class="header2">
    <div class="container">
        <div class="header-text">
            <div class="logo2">
                <!--<h1><a href="#">体质评估</a></h1>-->
                <h3 class="text-head">专家意见</h3>
                <p class="small-text3">我们提供权威意见、贴心服务我们提供权威意见、贴心服务我们提供权威意见、贴心服务我们提供权威意见、贴心服务我们提供权威意见、贴心服务</p>
            </div>

        </div>
    </div>
</div>

<div class="contact" id="contact">
    <div class="container"><!--
        <h3 class="text-head">专家意见</h3>
        <p class="box-desc">我们提供权威意见、贴心服务我们提供权威意见、贴心服务我们提供权威意见、贴心服务我们提供权威意见、贴心服务我们提供权威意见、贴心服务</p>
        -->
        <div class="contact-section">

            您的体质是${BodyCondition}

            <form>
                <input type="text" name="Name" placeholder="Name"/>
                <textarea placeholder="Suggestion" rows="6"></textarea>
                <table align="right">
                    <tr>
                        <td width="40%">
                            <div class="button-section"><a href="..\create\ph.pdf" target="_blank" class="top-button3">下载菜单</a></div>
                        </td>
                        <td width="10%">

                        </td>
                        <td width="40%">
                            <!--<button type="submit" class="submit" ><a href="index.html" >返回评估</a></button>-->
                            <div class="button-section"><a href="<%=application.getContextPath()%>/Question1/Test" class="top-button3">返回评估</a></div>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>
