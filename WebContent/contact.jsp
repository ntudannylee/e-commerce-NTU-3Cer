<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="DB.DB"%>
<%@ page import="Model.Account" %>
<jsp:useBean id = "user" class = "Controller.Login" scope = "session"/>
<!DOCTYPE html>
<html>
<head>
<title>聯絡資訊</title>
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

	
<!--content-->
<div class="contact">
			
			<div class="container">
				<h1>聯絡表單</h1>
			<div class="contact-form">
				
				<div class="col-md-8 contact-grid">
				
					<form action = "contact.jsp">	
						<input type="text" id="name" name="name" value="name" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Name';}">
					
						<input type="text" id="email" name="email" value="email" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Email';}">
						<input type="text" id="subject" name="subject" value="subject" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Subject';}" required>
						
						<textarea cols="77" rows="6" id="message" name="message" onfocus="this.value='';" onblur="if (this.value == '') {this.value = 'Message';}" required>想說甚麼呢?</textarea>
						<div class="send"> <input type="submit" name="submit" value="送出">
						</div>
					</form>
			
				</div>
				<%   
			
					Account random = new Account();
					String randomnum = random.randomNum();
					String name = request.getParameter("name");
					String email=request.getParameter("email");
					String subject =request.getParameter("subject");
					String message =request.getParameter("message");
						try {
							
							Connection con = DB.getConnection();
							PreparedStatement ps = (PreparedStatement) con.prepareStatement
									("insert into contact values(?,?,?,?,?)");
							ps.setString(1, randomnum);
							ps.setString(2, name);
							ps.setString(3, email);
							ps.setString(4, subject);
							ps.setString(5, message);
							int i =ps.executeUpdate();
							if(i>0){
								con.close();
							}
						}
						catch(Exception e){
							e.printStackTrace();
						}
				if(message!=null){%>
				<h1><font color="#FF0000">訊息已送出</font></h1><%} %>
				
				<div class="col-md-4 contact-in">

						
					
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="map">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d37494223.23909492!2d103!3d55!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x453c569a896724fb%3A0x1409fdf86611f613!2sRussia!5e0!3m2!1sen!2sin!4v1415776049771"></iframe>
			</div>
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
			