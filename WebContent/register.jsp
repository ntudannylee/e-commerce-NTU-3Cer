<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>註冊...</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="New Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'><!--//fonts-->
<!-- start menu -->
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>
<script src="js/simpleCart.min.js"> </script>
</head>
<body>
<!--header-->
<div class="header">
	<div class="header-top">
		<div class="container">
			<div class="search">
					<form>
						<input type="text" value="在想甚麼嗎？... " onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '在想甚麼嗎？...';}">
						<input type="submit" value="立即搶購！">
					</form>
			</div>
			<div class="header-left">		
					<ul>
						<li ><a href="login.jsp"  >登入</a></li>
						<li><a  href="register.jsp"  >馬上註冊</a></li>

					</ul>
					<div class="cart box_1">
						<a href="checkout.jsp">
						<h3> 
							<img src="images/cart.png" alt=""/></h3>
						</a>
						

					</div>
					<div class="clearfix"> </div>
			</div>
				<div class="clearfix"> </div>
		</div>
		</div>
		<div class="container">
			<div class="head-top">
				<div class="logo">
					<a href="index.jsp"><img src="images/logo.png" alt=""></a>	
				</div>
		  <div class=" h_menu4">
				<ul class="memenu skyblue">
					  <li class="active grid"><a class="color8" href="index.jsp">Home</a></li>	
				      <li><a class="color1" href="#">Buy</a>
				      	<div class="mepanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="products.jsp?id=laptop">筆電｜專區</a></li>
										<li><a href="products.jsp?id=desktop">桌電｜專區</a></li>
										<li><a href="products.jsp?id=phone">手機｜專區</a></li>
										<li><a href="products.jsp?id=tv">電視｜專區</a></li>
										<li><a href="products.jsp?id=ipad">平板｜專區</a></li>
										<li><a href="products.jsp?id=ear">耳機｜專區</a></li>
										<li><a href="products.jsp?id=camera">相機｜專區</a></li>
										<li><a href="products.jsp?id=disk">硬碟｜專區</a></li>

									</ul>	
								</div>							
							</div>
						  </div>
						</div>
					</li>
				<li><a class="color2" href="sell.jsp">sell</a></li>
				<li><a class="color6" href="contact.jsp">Contact</a></li>
			  </ul> 
			</div>
				<div class="clearfix"> </div>
		</div>
		</div>

	</div>
	
<!--content-->
<div class=" container">
<div class=" register">

			  <% String info = (String)request.getAttribute("info");
		  	  if("unsame".equals(info)){%><h1><font color="#FF0000">前後輸入的密碼不一致，請重新輸入！</font></h1>
		  	  <%}if("samename".equals(info)){%><h1><font color="#FF0000">此帳戶已有人使用，請重新註冊！</font></h1>
		  	  <%}if("registered!".equals(info)){%><h1><font color="#FF0000">恭喜您註冊成功！</font></h1>
		  	  <%}else{%><h1>歡迎加入 NTU 3Cer！</h1><%}%>
		  	  
		  	  <form name="register1" action="Register" method="post"> 
				 <div class="col-md-6 register-top-grid">
					<h3>個人資料</h3>
					 <div>
						<span>姓名</span>
						<input type="text" name="name" required> 
					 </div>
					 <div>
						<span>電話(選填)</span>
						<input type="text" name="phone"> 
					 </div>
					 <div>
						 <span>信箱(選填)</span>
						 <input type="text" name="email"> 
					 </div>
					   <a class="news-letter" href="#">
						 <label class="checkbox"><input type="checkbox" name="subscription" checked="checked" ><i> </i>我要訂閱電子報！</label>
					   </a>
					 </div>
					 
				     <div class="col-md-6 register-bottom-grid">
						    <h3>登入資訊</h3>
							 <div>
								<span>密碼</span>
								<input type="password" name="password" required>
							 </div>
							 <div>
								<span>請再輸入一次密碼</span>
								<input type="password" name="password2" required>
								
							 </div>
							 
							 <input type="reset" name="reset" value="重設">
							 <input type="submit" name="sub" value="馬上註冊！">
							
					 </div>
					 <div class="clearfix"> </div>
				</form>
			</div>
</div>
<!--//content-->
<div class="footer">
				<div class="container">
			<div class="footer-top-at">
			
				<div class="col-md-4 amet-sed">
				<h4>關於更多</h4>
				<ul class="nav-bottom">
						<li><a href="contact.jsp">如何購買</a></li>
						<li><a href="contact.jsp">如何選購</a></li>
						<li><a href="contact.jsp">地點</a></li>
						<li><a href="contact.jsp">成立宗旨</a></li>	
					</ul>	
				</div>
				<div class="col-md-4 amet-sed ">
				<h4>聯絡我們</h4>
				
	
					<p>專業台大3C俱樂部</p>
					<p>電子信箱: a12345678@yahoo.com.tw</p>
					<p>總經理電話:  +889 092120792</p>
					<ul class="social">
						<li><a href="#"><i> </i></a></li>						
						<li><a href="#"><i class="twitter"> </i></a></li>
						<li><a href="#"><i class="rss"> </i></a></li>
						<li><a href="#"><i class="gmail"> </i></a></li>
						
					</ul>
				</div>
				<div class="col-md-4 amet-sed">
					<h4>想對我們說什麼呢？</h4>
					<p>你們的支持是我持續的最大動力！</p>
					<form>
						<input type="text" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
						<input type="submit" value="送出">
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<div class="footer-class">
		<p >© 2018 NTU 3CER All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
		</div>
		</div>
</body>
</html>
			