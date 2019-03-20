<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id = "user" class = "Controller.Login" scope = "session"/>
<html>
<head>
<title>首頁</title>
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
						<c:choose>
						<c:when test="${name==null}">
						<li><a  href="login.jsp">登入</a></li>
						<li><a  href="register.jsp">馬上註冊</a></li>
						</c:when>
						<c:otherwise>
						<li><a  href="userinfo.jsp">${name}</a></li>
						<li><a  href="LogOut.jsp">登出</a></li>
						</c:otherwise>
						</c:choose>
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

	<div class="banner">
		<div class="container">
			  <script src="js/responsiveslides.min.js"></script>
  <script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	nav: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
  </script>
			<div  id="top" class="callbacks_container">
			<ul class="rslides" id="slider">
			    <li>
					
						<div class="banner-text">
							<h3> NTU 3C ONLINE MARKET  </h3>
						<p>全台大唯一的3C交流俱樂部，每一個人都可以將自己用不到的3C產品上來拍賣，以及在最低價的時候趕快入手！還在等甚麼，今日馬上註冊！</p>
						<a href="register.jsp">了解更多</a>
						</div>
				
				</li>
				<li>
					
						<div class="banner-text">
							<h3>laptop on sale now!! </h3>
						<p>現今大學生人手一台電腦，你/妳趕緊把握機會，來搶購超低價的筆電吧，不要讓別人搶在前面！</p>
												<a href="products.jsp?id=laptop">了解更多</a>

						</div>
					
				</li>
				<li>
						<div class="banner-text">
							<h3>Who are we？</h3>
						<p>本製作團隊致力於開發一個屬於台大的3C網路市集，有意合作者請點選以下連結。</p>
								<a href="contact.jsp">了解更多</a>

						</div>
					
				</li>
			</ul>
		</div>

	</div>
	</div>

<!--content-->
<div class="content">
	<div class="container">
	<div class="content-top">
		<h1>想要什麼嗎？趕快瀏覽以下商品！</h1>
		<div class="grid-in">
			<div class="col-md-4 grid-top">
				<a href="products.jsp?id=phone" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/pi.jpg" alt="">
							<div class="b-wrapper">
									<h3 class="b-animate b-from-left    b-delay03 ">
										<span>手機</span>	
									</h3>
								</div>
				</a>
		


			</div>
			<div class="col-md-4 grid-top">
				<a href="products.jsp?id=laptop" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/pi1.jpg" alt="">
					<div class="b-wrapper">
									<h3 class="b-animate b-from-left    b-delay03 ">
										<span>筆電</span>	
									</h3>
								</div>
				</a>

			</div>
			<div class="col-md-4 grid-top">
				<a href="products.jsp?id=desktop" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/pi2.jpg" alt="">
					<div class="b-wrapper">
									<h3 class="b-animate b-from-left    b-delay03 ">
										<span>桌電</span>	
									</h3>
								</div>
				</a>
	
			</div>
					<div class="clearfix"> </div>
		</div>
		<div class="grid-in">
			<div class="col-md-4 grid-top">
				<a href="products.jsp?id=ear" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/pi3.jpg" alt="">
					<div class="b-wrapper">
									<h3 class="b-animate b-from-left    b-delay03 ">
										<span>耳機</span>	
									</h3>
								</div>
				</a>

			</div>
			<div class="col-md-4 grid-top">
				<a href="products.jsp?id=camera" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/pi4.jpg" alt="">
					<div class="b-wrapper">
									<h3 class="b-animate b-from-left    b-delay03 ">
										<span>相機</span>	
									</h3>
								</div>
				</a>

			</div>
			<div class="col-md-4 grid-top">
				<a href="products.jsp?id=tv" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/pi5.jpg" alt="">
					<div class="b-wrapper">
									<h3 class="b-animate b-from-left    b-delay03 ">
										<span>電視</span>	
									</h3>
								</div>
				</a>
			</div>
					<div class="clearfix"> </div>
		</div>
	</div>
	<!----->
	

				<div class="clearfix"> </div>
			</div>
		</div>
		<div class="clearfix"> </div>
	</div>
	</div>
	<!---->
	<div class="content-bottom">
		<ul>
			<li><img class="img-responsive" src="images/lo.png" alt=""></a></li>
			<li><img class="img-responsive" src="images/lo1.png" alt=""></a></li>
			<li><img class="img-responsive" src="images/lo2.png" alt=""></a></li>
			<li><img class="img-responsive" src="images/lo3.png" alt=""></a></li>
			<li><img class="img-responsive" src="images/lo4.png" alt=""></a></li>
			<li><img class="img-responsive" src="images/lo5.png" alt=""></a></li>
			<a href="a_login.jsp">admin_login</a>
		<div class="clearfix"> </div>
		</ul>
	</div>
</div>
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
			