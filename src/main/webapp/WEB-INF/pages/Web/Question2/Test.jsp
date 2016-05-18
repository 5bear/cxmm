<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>体质评估</title>
    <link rel="stylesheet" href="<%=application.getContextPath()%>/Web/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/Web/css/question-style.css">
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
                <h3 class="text-head">体质评估</h3>
                <p class="small-text2">${BodyCondition}</p>
            </div>

            <div class="button-section">
                <a class="top-button"></a>
            </div>
        </div>
    </div>
</div>

<div class="services" id="services">
    <div class="container">
        <a href="./Clear?evaluationId=${EvaluationId}">重新测试</a>
        <form:form class="form-horizontal" role="form" modelAttribute="answersModel"
                   action="" method="post" novalidate="novalidate">
            <ul class="basic-list">
                <c:forEach items="${Question2List}" var="question2">
                    <li>
                        <div>
                            <input name="answers" type="checkbox" value="${question2.id}" id="${question2.id}"/>
                            <label for="${question2.id}">${question2.question}</label>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <input class="btn btn-default" type="submit" value="提交"/>
                </div>
            </div>
        </form:form>
    </div>
</div>

<div class="footer">
    <div class="container">
        <div class="infooter">
            <p class="copyright">Copyright &copy; 2015.Company name All rights reserved.</p>
        </div>
    </div>
</div>
</body>
</html>
