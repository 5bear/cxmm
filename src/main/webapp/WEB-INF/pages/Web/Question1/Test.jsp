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
                                    <div class="opt"><input type="radio" class="q${question.type}a" name="q${count.count}" value="A"><label>A.没有&nbsp;</div>
                                    <div class="opt"><input type="radio" name="q${count.count}" value="B" class="q${question.type}b"><label>B.有些&nbsp;</div>
                                    <div class="opt"><input type="radio" name="q${count.count}" value="C" class="q${question.type}c"><label>C.符合&nbsp;</div>
                                    <%--<div class="opt"><input type="radio" name="q1" value="D" id="q1d"><label for="q1d">D.大寒&nbsp;</div><br><br>--%>
                                </div>
                            </c:forEach>
                            <%--<div class="form-group left-inner-addon">
                                <br>	1、“冬与春交替，星同月俱存。明朝换新律，梅柳待阳春。”这首诗描绘的是哪个节气？<br><br>
                                <div class="opt"><input type="radio" id="q1a" name="q1" value="A"><label for="q1a">A.冬至&nbsp;</div>
                                <div class="opt"><input type="radio" name="q1" value="B" id="q1b"><label for="q1b">B.立冬&nbsp;</div>
                                <div class="opt"><input type="radio" name="q1" value="C" id="q1c"><label for="q1c">C.小寒&nbsp;</div>
                                <div class="opt"><input type="radio" name="q1" value="D" id="q1d"><label for="q1d">D.大寒&nbsp;</div><br><br>
                            </div>
                            <div class="form-group left-inner-addon">
                                2、“敖包”，意为石堆或鼓包，本是路标或界标，后来被赋予了宗教内容，成为祭祀山神或路神的活动场所。请问，祭敖包是哪个民族的民间祭祀节日?<br><br>
                                <div class="opt">	<input type="radio" name="q2" value="A" id="q2a"><label for="q2a">A.赫哲族&nbsp;</div>
                                <div class="opt"><input type="radio" name="q2" value="B" id="q2b"><label for="q2b">B.蒙古族&nbsp;</div>
                                <div class="opt"><input type="radio" name="q2" value="C" id="q2c"><label for="q2c">C.撒拉族&nbsp;</div>
                                <div class="opt"><input type="radio" name="q2" value="D" id="q2d"><label for="q2d">D.侗族&nbsp;</div><br><br>
                            </div>
                            <div class="form-group left-inner-addon">
                                3、下列称谓中，哪个不属于谦称？<br><br>
                                <div class="opt"><input type="radio" name="q3" value="A" id="q3a"><label for="q3a">A.家慈&nbsp;</div>
                                <div class="opt"><input type="radio" name="q3" value="B" id="q3b"><label for="q3b">B.拙荆&nbsp;</div>
                                <div class="opt"><input type="radio" name="q3" value="C" id="q3c"><label for="q3c">C.令堂&nbsp;</div>
                                <div class="opt"><input type="radio" name="q3" value="D" id="q3d"><label for="q3d">D.舍弟&nbsp;</div><br><br>
                            </div>
                            <div class="form-group left-inner-addon">
                                4、对于祝寿，特定年龄有特定的称呼，“期颐之寿”是对哪个年龄的称呼?<br><br>
                                <div class="opt"><input type="radio" name="q4" value="A" id="q4a"><label for="q4a">A.六十岁&nbsp;</div>
                                <div class="opt"><input type="radio" name="q4" value="B" id="q4b"><label for="q4b">B.七十岁&nbsp;</div>
                                <div class="opt"><input type="radio" name="q4" value="C" id="q4c"><label for="q4c">C.八十岁&nbsp;</div>
                                <div class="opt"><input type="radio" name="q4" value="D" id="q4d"><label for="q4d">D.百岁&nbsp;</div><br><br>
                            </div>
                            <div class="form-group left-inner-addon">
                                5、送彩礼是整个婚礼中非常重要的一环。秦以前多采用名贵的玄熏、束帛、俪皮，寓意幸福吉祥。汉代多用金银之类。其后，风俗日盛，礼物日重。请问，送彩礼是古代婚姻六礼中的哪个环节？
                                <br><br>
                                <div class="opt"><input type="radio" name="q5" value="A" id="q5a"><label for="q5a">A.纳采&nbsp;</div>
                                <div class="opt"><input type="radio" name="q5" value="B" id="q5b"><label for="q5b">B.纳吉&nbsp;</div>
                                <div class="opt"><input type="radio" name="q5" value="C" id="q5c"><label for="q5c">C.纳征&nbsp;</div>
                                <div class="opt"><input type="radio" name="q5" value="D" id="q5d"><label for="q5d">D.亲迎&nbsp;</div><br><br>
                            </div>
                            <div class="form-group left-inner-addon">
                                6、“门当”与“户对”是古民居建筑中大门的组成部分。“门当”是指古时富贵人家门前精雕细刻的两面石鼓门枕。通过“门当”上雕刻的纹饰，就能了解对方家所从事的行当。观察下面两户人家的门当，哪一户是官宦府邸之家呢？
                                <br><br>
                                <div class="opt"><input type="radio" name="q6" value="A" id="q6a"><label for="q6a">A.<img src="images/6-1.png" style="width:80px;height:80px"></div>
                                <div class="opt"><input type="radio" name="q6" value="B" id="q6b"><label for="q6b">B.<img src="images/6-2.png" style="width:80px;height:80px"></div><br><br>
                            </div>
                            <div class="form-group left-inner-addon">
                                7、传说天帝怕妖魔鬼怪到人间作祟，派了两名神将神荼和郁垒，把住从仙山到人间的天然大门。于是人们每逢过年，便用桃木刻上这两位神的名字，挂在门的两边，以示去灾压邪。到了唐代，门神换成了两位开国功臣的名字，他们是：<br>
                                <br>
                                <div class="opt" style="width:100%"><input type="radio" name="q7" value="A" id="q7a"><label for="q7a">A.尉迟恭、长孙无忌&nbsp;</div>
                                <div class="opt" style="width:100%">	<input type="radio" name="q7" value="B" id="q7b"><label for="q7b">B.尉迟恭、秦叔宝&nbsp;</div>
                                <div class="opt" style="width:100%">	<input type="radio" name="q7" value="C" id="q7c"><label for="q7c">C.长孙无忌、秦叔宝&nbsp;</div>
                                <div class="opt" style="width:100%">	<input type="radio" name="q7" value="D" id="q7d"><label for="q7d">D.程咬金、房玄龄&nbsp;</div><br><br>
                            </div>
                            <div class="form-group left-inner-addon">
                                8、菜系，又称“帮菜”，是指在选料、切配、烹饪等技艺方面，经长期演变而自成体系，具有鲜明的地方风味特色，并为社会所公认的中国饮食的菜肴流派。下列不属于八大菜系的是
                                <br><br>
                                <div class="opt"><input type="radio" name="q8" value="A" id="q8a"><label for="q8a">A.山东菜系&nbsp;</div>
                                <div class="opt"><input type="radio" name="q8" value="B" id="q8b"><label for="q8b">B.四川菜系&nbsp;</div>
                                <div class="opt"><input type="radio" name="q8" value="C" id="q8c"><label for="q8c">C.赣菜系&nbsp;</div>
                                <div class="opt"><input type="radio" name="q8" value="D" id="q8d"><label for="q8d">D.湘菜系&nbsp;</div>
                            </div>
                            <div class="form-group left-inner-addon">
                                9、中国刺绣是在布上“以针代笔，以线晕色”的艺术，我国的刺绣驰名世界，被誉为“东方艺术明珠”，四大名绣不包括：
                                <br><br>
                                <div class="opt"><input type="radio" name="q9" value="A" id="q9a"><label for="q9a">A.苏绣&nbsp;</div>
                                <div class="opt"><input type="radio" name="q9" value="B" id="q9b"><label for="q9b">B.顾绣&nbsp;</div>
                                <div class="opt"><input type="radio" name="q9" value="C" id="q9c"><label for="q9c">C.蜀绣&nbsp;</div>
                                <div class="opt"><input type="radio" name="q9" value="D" id="q9d"><label for="q9d">D.湘绣&nbsp;</div><br><br>
                            </div>
                            <div class="form-group left-inner-addon">
                                10、京剧脸谱，是一种具有中国文化特色的特殊化妆方法。由于每个历史人物或某一种类型的人物都有一种大概的谱式，就像唱歌、奏乐都要按照乐谱一样，所以称为“脸谱”。下列脸谱中，哪个脸谱是曹操呢？
                                <br><br>
                                <div></div>
                                <div class="opt"><input type="radio" name="q10" value="A" id="q10a"><label for="q10a" >A.<img src="images/10-1.png" style="width:40%"></div>
                                <div class="opt"><input type="radio" name="q10" value="B" id="q10b"><label for="q10b" >B.<img src="images/10-2.png" style="width:40%"></div>
                                <div class="opt"><input type="radio" name="q10" value="C" id="q10c"><label for="q10c" >C.<img src="images/10-3.png" style="width:40%"></div>
                                <div class="opt"><input type="radio" name="q10" value="D" id="q10d"><label for="q10d" >D.<img src="images/10-4.png" style="width:40%"></div><br><br>
                            </div>--%>
                        </div>
                        <%--<div class="form-group left-inner-addon">
                            <button  class="btn btn-primary" onclick="change()" >提交</button>
                            <button type="reset" class="btn btn-default float_r">重做</button>
                        </div>--%>
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
        for(i=1;i<=9;i++){
           int_array[i] = 0;
        }
        for(i=1;i<=9;i++){
            var radioObjectA = document.getElementsByClassName("q" + i + "a");
            var radioObjectB = document.getElementsByClassName("q" + i + "b");
            var radioObjectC = document.getElementsByClassName("q" + i + "c");
            $(radioObjectA).each(function (index, element) {
                if(element.checked){
                    int_array[i] += 1
                }
            })
            $(radioObjectB).each(function (index, element) {
                if(element.checked){
                    int_array[i] += 2
                }
            })
            $(radioObjectC).each(function (index, element) {
                if(element.checked){
                    int_array[i] += 5
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
