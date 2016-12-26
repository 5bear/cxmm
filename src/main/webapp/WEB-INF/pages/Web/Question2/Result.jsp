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
    <script src="<%=application.getContextPath()%>/Web/Upload/js/My97DatePicker4.7.2/WdatePicker.js"></script>
    <!-- plus a jQuery UI theme, here I use "flick" -->
    <link rel="stylesheet" href="<%=application.getContextPath()%>/Web/jquery-ui/jquery-ui.min.css">

    <link href="<%=application.getContextPath()%>/Web/jquery-ui-slider-pips/jquery-ui-slider-pips.css" rel="stylesheet">
    <script src="<%=application.getContextPath()%>/Web/jquery-ui-slider-pips/jquery-ui-slider-pips.js"></script>
    <style>
        .radio-row {
            margin: 20px 0;
        }
        .radio-row label {
            width: 45%;
        }
    </style>
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
<%--
            您的体质是${BodyCondition}
--%>
            <form method="post" action="" name="myForm">
                <div>
                    <input type="text" name="name" placeholder="姓名"/>
                    <input type="text" name="address" placeholder="地址"/>
                    <input type="text" name="phone" placeholder="电话"/>
                </div>
                <div>
                    <input type="text" name="ExpectingDate" onclick="WdatePicker({dateFmt: 'yyyy-MM-dd'})" placeholder="预产期"/>
                    <input type="text" name="Weight" placeholder="孕前体重(KG)"/>
                    <input type="text" name="AfterWeight" placeholder="当前体重(KG)"/>
                </div>
                <div>
                    <input type="text" name="height" placeholder="身高(CM)"/>
                    <input type="text" name="age" placeholder="年龄"/>
                    <input type="text" name="Birthorder" placeholder="第几胎"/>
                </div>
                <div class="radio-row">
                    <label><input type="radio" name="eutocia" value="1"/>希望顺产</label>
                    <label><input type="radio" name="eutocia" value="2"/>剖产</label>
                </div>
                <div class="radio-row">
                    <label><input type="radio" name="feed" value="1"/>希望哺乳</label>
                    <label><input type="radio" name="feed" value="2"/>非哺乳</label>
                </div>
                <textarea placeholder="专家意见" rows="6" name="suggestion"></textarea>
                <textarea placeholder="备注" rows="5" name="notes"></textarea>
                <input type="button" value="保存" onclick="check()"/>
               <%-- <table align="right">
                    <tr>
                        <td width="40%">
                            <div class="button-section"><a href="<%=request.getContextPath()%>/Question2/purchase" target="_blank" class="top-button3">购买</a></div>
                        </td>
                        <td width="10%">

                        </td>
                        <td width="40%">
                            <!--<button type="submit" class="submit" ><a href="index.html" >返回评估</a></button>-->
                            <div class="button-section"><a href="<%=application.getContextPath()%>/Question1/Test" class="top-button3">返回评估</a></div>
                        </td>
                    </tr>
                </table>--%>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    function check(){
        for (var i=0;i<document.myForm.length;i++ )
        {
            if (document.myForm.elements[i].value=="")
            {
                if(!(remind(i)=="success")){
                    document.myForm.elements[i].focus();
                    alert(remind(i))
                    return false
                }
            }
        }
        var myForm=document.getElementsByName("myForm");
        myForm[0].submit()
    }
    function remind(i){
        switch (i){
            case 0:
                return ("姓名未填写")
                break
            case 1:
                return ("地址未填写")
                break
            case 2:
                return("电话未填写")
                break
            case 3:
                return ("预产期未填写")
                break
            case 4:
                return ("孕前体重未填写")
                break
            case 5:
                return("当前体重未填写")
                break
            case 6:
                return ("身高未填写")
                break
            case 7:
                return ("年龄未填写")
                break
            case 8:
                return ("胎次未填写")
                break
            case 9:
                return ("顺产/剖产未选择")
                break
            case 10:
                return ("哺乳/非哺乳未选择")
                break
        }
        return "success"
    }
</script>
</html>
