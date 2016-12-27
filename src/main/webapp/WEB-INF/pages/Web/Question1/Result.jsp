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
            <div class="logo2" >
                <h3 class="text-head">测试结果</h3>
                <div class="button-section">
                    <a class="top-button" href="<%=request.getContextPath()%>/Question2/Result?evaluationId=${EvaluationId}">填写详细信息</a>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="services"   style="text-align: center">
    <div id="chart2" style="width:1000px;margin: 0 auto;">

    </div>
</div>
<script type="text/javascript" src="<%=application.getContextPath()%>/Web/Question1/jQuery.js"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/Web/Question1/jqplot.js"></script>
<script type="text/javascript" src="<%=application.getContextPath()%>/Web/Question1/m_jqplot.js"></script>
<script>
    var content = new Array();
    $.ajax({
        url:"<%=request.getContextPath()%>/getClubResult",
        type:"post",
        data:{EvaluationId:'${EvaluationId}'},
        dataType:"json",
        async:false,
        success:function (data) {
            $(data).each(function (index,element) {
                var ele_array = new Array();
                ele_array.push(element.bodyCondition,element.score);
                content.push(ele_array);
            })
            console.log(content)
        }
    })
    $(document).ready(function() {
        var line1 = content;
        $('#chart2').jqplot([line1], {
            title:'体质偏向',
            seriesDefaults:{
                renderer:$.jqplot.BarRenderer,
                rendererOptions: {
                    // Set the varyBarColor option to true to use different colors for each bar.
                    // The default series colors are used.
                    varyBarColor: true
                }
            },
            axes:{
                xaxis:{
                    renderer: $.jqplot.CategoryAxisRenderer
                }
            }
        });
    });

</script>
</body>
</html>
