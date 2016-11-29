<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>体质评估</title>
    <link rel="stylesheet" href="<%=application.getContextPath()%>/Web/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/Web/css/question-style.css"/>
    <link href="<%=application.getContextPath()%>/Web/css/question-responsive.css" rel="stylesheet" media="screen"/>
    <link rel="stylesheet" href="<%=application.getContextPath()%>/Web/jquery-sidr/stylesheets/jquery.sidr.dark.css"/>
    <link rel="stylesheet" href="<%=application.getContextPath()%>/Web/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=application.getContextPath()%>/Web/jquery-ui/jquery-ui.min.css"/>
    <link rel="stylesheet"
          href="<%=application.getContextPath()%>/Web/jquery-ui-slider-pips/jquery-ui-slider-pips.css"/>
</head>
<body>
<div class="header2">
    <div class="container">
        <div class="header-text">
            <div class="logo2">
                <h3 class="text-head">体质评估</h3>
                <p class="small-text2">第一页</p>
            </div>

            <div class="button-section">
                <a class="top-button"></a>
            </div>
        </div>
    </div>
</div>

<div class="services" id="services">
    <div class="container">
        <form:form class="form-horizontal" role="form" modelAttribute="answersModel"
                   action="" method="post" novalidate="novalidate">
            <ul class="basic-list">
                <%
                    int i = 0;
                %>
                <c:forEach items="${Question1List}" var="question1">
                    <li>
                        <input name="answers[<%=i%>].question1Id" type="hidden" value="${question1.id}">
                        <div>${question1.question}</div>
                        <div>
                            <input name="answers[<%=i%>].answer" type="radio" value="1" id="${question1.id}1">
                            <label for="${question1.id}1">A: ${question1.option1}</label>
                        </div>
                        <div>
                            <input name="answers[<%=i%>].answer" type="radio" value="2" id="${question1.id}2">
                            <label for="${question1.id}2">B: ${question1.option2}</label>
                        </div>
                        <div>
                            <input name="answers[<%=i%>].answer" type="radio" value="3" id="${question1.id}3">
                            <label for="${question1.id}3">C: ${question1.option3}</label>
                        </div>
                        <div>
                            <input name="answers[<%=i%>].answer" type="radio" value="4" id="${question1.id}4">
                            <label for="${question1.id}4">D: ${question1.option4}</label>
                        </div>
                        <div>
                            <input name="answers[<%=i%>].answer" type="radio" value="5" id="${question1.id}5">
                            <label for="${question1.id}5">E: ${question1.option5}</label>
                        </div>
                        <div>
                            <input name="answers[<%=i%>].answer" type="radio" value="6" id="${question1.id}6">
                            <label for="${question1.id}6">F: ${question1.option6}</label>
                        </div>
                        <div>
                            <input name="answers[<%=i%>].answer" type="radio" value="7" id="${question1.id}7">
                            <label for="${question1.id}7">G: ${question1.option7}</label>
                        </div>
                        <div>
                            <input name="answers[<%=i%>].answer" type="radio" value="8" id="${question1.id}8">
                            <label for="${question1.id}8">H: ${question1.option8}</label>
                        </div>
                        <div>
                            <input name="answers[<%=i%>].answer" type="radio" value="9" id="${question1.id}9">
                            <label for="${question1.id}9">I: ${question1.option9}</label>
                        </div>
                    </li>
                    <%
                        i++;
                    %>
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
<script src="<%=application.getContextPath()%>/Web/jquery/jquery.min.js"></script>
<script src="<%=application.getContextPath()%>/Web/jquery-sidr/jquery.sidr.min.js"></script>
<script type='text/javascript' src="<%=application.getContextPath()%>/Web/bootstrap/js/bootstrap.js"></script>
<script src="<%=application.getContextPath()%>/Web/jquery-ui/jquery-ui.min.js"></script>
<script src="<%=application.getContextPath()%>/Web/jquery-ui-slider-pips/jquery-ui-slider-pips.js"></script>
</body>
</html>
