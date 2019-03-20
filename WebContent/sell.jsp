<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="DB.DB" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id = "user" class = "Controller.Login" scope = "session"/>
<jsp:useBean id = "product" class = "Controller.Sell" scope = "request"/>
<!DOCTYPE html>
<html>
<head>
<title>販售商品</title>
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
				<li><a class="color2" href="#">sell</a></li>
				<li><a class="color6" href="contact.jsp">Contact</a></li>
			  </ul> 
			</div>
				<div class="clearfix"> </div>
		</div>
		</div>

	</div>

	
<!--content-->
<div class="contact">
	<c:choose>		
			<c:when test="${name==null}">
				<h1><font color="#FF0000">請先登入!</font><a href="register.jsp"><p>還沒有帳號嗎? 點此註冊</p></a></h1>
			</c:when>
			
		<c:otherwise>
			<c:choose>
			<c:when test="${param.pname==null}">
			<form action="Sell" method="post" enctype="multipart/form-data">
			
			<div class="container">
				<h1>想要賣甚麼呢?</h1>
			<div class="contact-form">
			  <div class="col-md-8 contact-grid">
					
						
						<input type="text" name="pname" value="商品名稱" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='商品名稱';}"required>
					
						<input type="text" name="price" value="想賣的價格" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='想賣的價格';}"required>
						<input type="text" name="quantity" value="數量" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='數量';}" required>
						
						<textarea name="about" cols="77" rows="6" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value = '商品訊息';}"required>商品介紹</textarea>						
						<h3>請選擇上架商品所屬種類</h3>
						<br><select name="category">
　						<option value="laptop">筆電</option>
　						<option value="phone">手機</option>
　						<option value="desktop">桌電</option>
　						<option value="ipad">平板電腦</option>
　						<option value="tv">電視</option>
　						<option value="ear">耳機</option>
　						<option value="disk">硬碟</option>
　						<option value="camera">相機</option>
						</select>
						<br></br>
						<h3>請上傳商品照片</h3>
						<br><input name="image" type="file" accept="image/gif, image/jpeg, image/png" required></br>
						
				<div class="send">
		 		 <input type="submit" name="submit" value="開賣！">
			    </div>			
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</form>
		</c:when>
		<c:otherwise>
					<div class="container">
					 <h1>您上架的商品資訊如下：</h1>
					 	<div class="contact-form">
					 		<h3>商品名稱:${param.pname}</h3> 
					 		<h3>商品價格:${param.price}</h3>
					 		<h3>商品數量:${param.quantity}</h3>
					 		<h3>商品詳細信息:${param.about}</h3>
					 		<h3>預覽圖片:</h3> 
					 		<%String productid=(String)request.getAttribute("id");%>
					 		<img src="getImage.jsp?id=<%=productid%>" width="400px"/>
					 	</div>
					 	<div class="clearfix"> </div>
					 </div>
				 </c:otherwise>
			 </c:choose>
		</c:otherwise>
		</c:choose>
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
			