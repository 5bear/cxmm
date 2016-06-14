<!DOCTYPE html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>欢迎光临</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/Web/Upload/css/bootstrap.css">
		<style type="text/css">
			html, body {
				width: 100%;
				height: 100%;
			}
			body {
				background: url("<%=request.getContextPath()%>/Web/Upload/images/manindex.jpg");
				background-size: auto 100%;
				background-repeat: no-repeat;
				background-position: center;
			}

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
				width:14.3%;
				text-align: center;
				cursor:pointer;
			}
			.js-drop-list {
				padding: 0;
				margin: 0;;
			}
			.js-drop-list li {
				list-style-type: none;
			}
			.js-drop-list a:hover {
				text-decoration: none;
			}
		</style>
	<style type="text/css">
	html, body {
		height: 100%;
	}
	body {
		position: relative;
	}
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
 		 padding-top: 60px;
  	 	 padding-left: 100px;
  	 	 padding-right: 100px;
	}
	div#div3{
  	 	 position: absolute;
		 bottom: 40px;
  	 	 font-size:8px;
		 color: black;
		 text-align: center;
		 display: block;
		 width: 100%;
	}
	</style>		
	</head>
<script type='text/javascript'>
	(function(m, ei, q, i, a, j, s) {
		m[a] = m[a] || function() {
			(m[a].a = m[a].a || []).push(arguments)
		};
		j = ei.createElement(q),
				s = ei.getElementsByTagName(q)[0];
		j.async = true;
		j.charset = 'UTF-8';
		j.src = i + '?v=' + new Date().getUTCDate();
		s.parentNode.insertBefore(j, s);
	})(window, document, 'script', '//static.meiqia.com/dist/meiqia.js', '_MEIQIA');
	_MEIQIA('entId', 18060);
</script>

	<body>
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
					<a><font color="#fff">关于</font></a>&nbsp;&nbsp;&nbsp;<a><font color="#fff">&copy;2016月子餐</font></a>&nbsp;&nbsp;&nbsp;<a><font color="#fff">闵ICP备&nbsp;05021777号</font></a>&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/login"><font color="#fff">加盟代理</font></a>
					</div>
					</div>
	<script>
		var img = ["url(\"<%=request.getContextPath()%>/Web/Upload/images/manindex.jpg\")", "url(\"<%=request.getContextPath()%>/Web/Upload/images/womanindex.jpg\")"]

		changeBg();

		function changeBg() {
			var i=0;
			setInterval(function(){
				$("body").css("backgroundImage", img[i])
				i = (i+1) % img.length;
			}, 5000);
		}
	</script>
	</body>
</html>

