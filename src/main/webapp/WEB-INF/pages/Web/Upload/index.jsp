<!DOCTYPE html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>欢迎光临</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/css/bootstrap.css">
	<style type="text/css">
	table
	{
         border-left: 1px solid #fff;
         border-right: 1px solid #fff;
         border-top: 1px solid #fff;
         border-bottom: 1px solid #fff;
         width:100%;
         background-image: linear-gradient( to right, rgba( 245, 0, 0, 0.4 ) 0%, rgba( 245, 245, 0, 0.3 ) 40%, rgba(0, 245, 0, 0.4 ) 100%, #FFFFFF 100% );
    }
    td
    {
         font-family: "Roboto Slab", sans-serif;
         font-size: 1.5vw;    
         font-weight: 900;
         color: #fff;
         border-right: 0px solid #fff;
         padding: 15px 30px;
         width:12.5%;
	text-align: center;
         cursor:pointer;
    }
	</style><!-- 1715e   38C8AA #38C8AA --><!-- font-size=16px -->
	<style>
	div#div1{
	     position:fixed;
		 top:0;
		 left:0;
		 right:0;
		 bottom:0;
		 z-index:-1;
	}
	div#div1>img{
		 height:100%;
		 Width:100%;
		 border:0;
	}
	</style>
	<style>
	div#div2{
 		 padding-top: 191px;
  	 	 padding-left: 100px;
  	 	 padding-right: 100px;
	}
	div#div3{
  	 	 padding-top: 270px;
  	 	 font-size:8px;
	}
	</style>		
	</head>
	<body>
	<div id="div1"><img src="<%=request.getContextPath()%>/Web/Upload/images/homepage.jpg"/></div>
					<div id="div2">
						<div align="center">
							<table>
							<tr>
								<jsp:include page="../Backstage/Navi.jsp"></jsp:include>
							</tr>
							</table>
						</div>
					</div>
					<div id="div3">
					<div align="center">
					<a><font color="#fff">关于</font></a>&nbsp;&nbsp;&nbsp;<a><font color="#fff">&copy;2016月子餐</font></a>&nbsp;&nbsp;&nbsp;<a><font color="#fff">闵ICP备&nbsp;05021777号</font></a><%--&nbsp;&nbsp;&nbsp;<a href="/agentLogin"><font color="#fff">加盟代理</font></a>--%>
					</div>
					</div>
		</body>		
</html>

