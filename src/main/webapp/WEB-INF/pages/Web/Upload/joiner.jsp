<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>登陆</title>
<link href="./Wopop_files/style_log.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./Wopop_files/style.css">
<link rel="stylesheet" type="text/css" href="./Wopop_files/userpanel.css">
<link rel="stylesheet" type="text/css" href="./Wopop_files/jquery.ui.all.css">
	<link rel="shortcut icon" href="favicon.ico">
	<!-- Google Fonts -->
	<!--link href='http://fonts.useso.com/css?family=Roboto+Slab:400,700|Roboto:400,300,700' rel='stylesheet' type='text/css'-->
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<link rel="stylesheet" href="login/css/reset.css">
	<link rel="stylesheet" href="login/css/style.css">
	<script src="login/js/modernizr.js"></script> 
	<script src="js/modernizr-2.6.2.min.js"></script>
<style type="text/css">
	table
	{
         border-left: 1px solid #fff;
         border-right: 1px solid #fff;
         border-top: 1px solid #fff;
         border-bottom: 1px solid #fff;
    }
    td
    {
         font-family: "Roboto Slab", sans-serif;
         font-size: 18px;
         font-weight: 900;
         color: #f1715e;
         border-right: 0px solid #fff;
         padding: 15px 30px;
         text-align: center;
         width:300px;
         cursor:pointer;
    }
	</style>
</head>
<body class="login" >
<div class="content" width:1200px; margin:0px auto 0;>

  <div class="main">
<div  id="fh5co-home">
            <div style="background-image: url(images/pic1.png);" class="flexslider">
                <div class="fh5co-overlay"></div>
                <div class="fh5co-text">
                <br> <br>
                    <div>
                        <div align="center">
							<table>
							<tr>
							<td onmouseover="this.style.backgroundColor='#FFcccc'" onmouseout="this.style.backgroundColor=''" onclick="window.location.href='Upload/index.html'">首页</td>
							<td onmouseover="this.style.backgroundColor='#FFcccc'" onmouseout="this.style.backgroundColor=''" onclick="window.location.href='Upload/newslist.html'">新闻</td>
							<td onmouseover="this.style.backgroundColor='#FFcccc'" onmouseout="this.style.backgroundColor=''" onclick="window.location.href='Upload/professor.html'">专家</td>
							<td onmouseover="this.style.backgroundColor='#FFcccc'" onmouseout="this.style.backgroundColor=''" onclick="window.location.href='Upload/test.html'">体质评估</td>
							<td onmouseover="this.style.backgroundColor='#FFcccc'" onmouseout="this.style.backgroundColor=''" onclick="window.location.href='Upload/Wopop.html'">会所</td>
							<td onmouseover="this.style.backgroundColor='#FFcccc'" onmouseout="this.style.backgroundColor=''" onclick="window.location.href='Upload/training.html'">培训</td>
							<td onmouseover="this.style.backgroundColor='#FFcccc'" onmouseout="this.style.backgroundColor=''" onclick="window.location.href='Upload/login.html'">后台</td>
							</tr>
							</table>
						</div>
			</nav>
             </div>
             <br><br>
         </div>
          </div>
	</div>
      </div>
    </div>
  </div>
<div class="login_m">

<!--div class="login_logo"><img src="" width="196" height="46"></div-->
<div class="login_boder">
     <div class="flexslider"> <!--style="background-image: url(images/pic1.png);"-->
<div class="login_padding" id="login_model">

  				<form class="cd-form" action="joinerm.html">
					<p class="fieldset">
						<label class="image-replace cd-username">用户名</label>
						<input class="full-width has-padding has-border" id="signin-email" type="email" placeholder="用户名">
						<span class="cd-error-message">错误的用户信息</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">密码</label>
						<input class="full-width has-padding has-border" id="signin-password" type="password"  placeholder="******">
						<!--<a href="#0" class="hide-password">显示密码</a>-->
						<span class="cd-error-message">错误的用户信息</span>
					</p>
					<p class="fieldset">
						<input class="full-width" type="submit" value="登陆">
					</p>
				</form>
  </div>
</div>
<!--login_padding  Sign up end-->
</div><!--login_boder end-->
</div>
</div><!--login_m end-->
</body>
</html>