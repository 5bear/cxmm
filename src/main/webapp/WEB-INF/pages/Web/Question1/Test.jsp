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
                <%--<%
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
                </c:forEach>--%>
                    <div class="row"  style="color:black">
                        <div class="col-md-12">
                            <c:forEach items="${Question1List}" var="question" varStatus="count">
                                <div class="form-group left-inner-addon">
                                    <br>	${count.count}、${question.question}<br><br>
                                    <div class="opt"><input type="radio" class="q${question.type}a" name="${count.count}" value="A"><label>A.没有&nbsp;</div>
                                    <div class="opt"><input type="radio" name="${count.count}" value="B" class="q${question.type}b"><label>B.有些&nbsp;</div>
                                    <div class="opt"><input type="radio" name="${count.count}" value="C" class="q${question.type}c"><label>C.符合&nbsp;</div>
                                    <%--<div class="opt"><input type="radio" name="q1" value="D" id="q1d"><label for="q1d">D.大寒&nbsp;</div><br><br>--%>
                                </div>
                            </c:forEach>
                        </div>
                    </div> <!-- row -->
            </ul>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <input class="btn btn-default" type="button" onclick="submitResult()" value="提交"/>
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
<script>
    function submitResult() {
        var int_array = new Array();
        var i;
        //10：79 11：4139 12：56
        for(i=1;i<=12;i++){
           int_array[i] = 0;
        }
        for(i=1;i<=12;i++){
            var type = i;
            if(i==10)
                type=79;
            if(i==11)
                type=4139;
            if(i==12)
                type = 56;
            var radioObjectA = document.getElementsByClassName("q" + type + "a");
            var radioObjectB = document.getElementsByClassName("q" + type + "b");
            var radioObjectC = document.getElementsByClassName("q" + type + "c");
            /*$(radioObjectA).each(function (index, element) {
                if(element.checked&&element.name<46){
                    int_array[i] += 0
                }else{
                    if(type==79){
                        int_array[7] += 0;
                        int_array[9] += 0;
                    }else if(type==4139){

                    }
                }
            })*/
            $(radioObjectB).each(function (index, element) {
                if(element.checked) {
                    if (element.name < 46) {
                        int_array[i] += 2
                    } else {
                        if (type == 79) {
                            int_array[7] += 1;
                            int_array[9] += 1;
                        } else if (type == 4139) {
                            int_array[4] += 1;
                            int_array[1] += 1;
                            int_array[3] += 1;
                            int_array[9] += 1;
                        } else if (type == 56) {
                            int_array[5] += 1;
                            int_array[6] += 1;
                        } else {
                            int_array[type] += 1;
                        }
                    }
                }
            })
            $(radioObjectC).each(function (index, element) {
                if(element.checked) {
                    if (element.name < 46) {
                        int_array[i] += 4
                    } else {
                        if (type == 79) {
                            int_array[7] += 2;
                            int_array[9] += 2;
                        } else if (type == 4139) {
                            int_array[4] += 2;
                            int_array[1] += 2;
                            int_array[3] += 2;
                            int_array[9] += 2;
                        } else if (type == 56) {
                            int_array[5] += 2;
                            int_array[6] += 2;
                        } else {
                            int_array[type] += 2;
                        }
                    }
                }
            })
        }
        $.ajax({
            url:"<%=request.getContextPath()%>/Question1/Test",
            type:"post",
            traditional:true,
            data:{score:int_array},
            dataType:"json",
            success:function (data) {
                if(data.status=="success"){
                    console.log(data.guid)
                    location.href = "Result?evaluationId=" + data.guid;
                }
            }
        })
    }
</script>
</body>
</html>
