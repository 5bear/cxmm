<%--
  Created by IntelliJ IDEA.
  User: 11369
  Date: 2016/12/27
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
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
            </div>

        </div>
    </div>
</div>
<div class="services"   style="text-align: center">
    <div id="container" style="width: 1000px; height: 400px; margin: 0 auto"></div>
    <div class="button-section">
        <a class="top-button" href="<%=request.getContextPath()%>/Question2/Result?evaluationId=${EvaluationId}">填写详细信息</a>
    </div>
</div>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
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
                var ele = new Object();
                ele.name =element.bodyCondition
                ele.y = element.score
                ele.drilldown = null
                content.push(ele);
            })
            console.log(content)
        }
    })
    $(function () {
        // Create the chart
        Highcharts.chart('container', {
            chart: {
                type: 'column'
            },
            title: {
                text: '体质偏向'
            },
            xAxis: {
                type: 'category',
            },
            yAxis: {
                title: {
                    text: '得分情况'
                }
            },
            /* legend: {
             layout: 'vertical',
             backgroundColor: '#FFFFFF',
             floating: true,
             align: 'left',
             verticalAlign: 'top',
             x: 90,
             y: 45,
             //labelFormat: '<span style="{color}">{name} (click to hide or show)</span>'
             },*/
            plotOptions: {
                series: {
                    /*events: {
                     legendItemClick: function(e) {
                     var index = this.index;

                     var series = this.chart.series;

                     if (!series[index].visible) {

                     for (var i = 0; i < series.length; i++) {

                     var s = series[i];

                     i === index ? s.show() : s.hide();
                     }
                     }

                     return false;
                     }
                     },*/
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                    }
                }
            },

            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}<br/>'
            },

            series: [{
                name: '体质情况',
                colorByPoint: true,
                data: content,
            }]
        });
    });

</script>
</body>
</html>
