<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="DB.DB"%>

<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="user" class="Controller.Login" scope="session" />
<jsp:useBean id="user_update" class="Controller.update_User_info"
	scope="session" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>使用者頁面</title>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="New Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!--fonts-->
<link
	href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900'
	rel='stylesheet' type='text/css'>
<!--//fonts-->
<!-- start menu -->
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>
	$(document).ready(function() {
		$(".memenu").memenu();
	});
</script>
<script src="js/simpleCart.min.js">
	
</script>
</head>
<body>
	<!--header-->
	<div class="header">
		<div class="header-top">
			<div class="container">
				<div class="search">
					<form>
						<input type="text" value="在想甚麼嗎？... " onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = '在想甚麼嗎？...';}">
						<input type="submit" value="立即搶購！">
					</form>
				</div>
				<div class="header-left">
					<ul>

						<li><a href="#">${name}</a></li>
						<li><a href="LogOut.jsp">登出</a></li>

					</ul>
					<div class="cart box_1">
						<a href="checkout.jsp">
							<h3>
								
								<img src="images/cart.png" alt="" />
							</h3>
						</a>

					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
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
							</div></li>
						<li><a class="color2" href="sell.jsp">sell</a></li>
						<li><a class="color6" href="contact.jsp">Contact</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>

	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 ">
				<div class="list-group ">
					<a href="userinfo.jsp"
						class="list-group-item list-group-item-action">帳號設定</a> <a
						href="userinfo.jsp" class="list-group-item list-group-item-action">購物車</a>
					<a href="user_sell_info.jsp"
						class="list-group-item list-group-item-action active">上架管理</a> 
						
              <a href="order.jsp" class="list-group-item list-group-item-action">訂單查詢</a>
						<a
						href="userinfo.jsp" class="list-group-item list-group-item-action">購買紀錄</a>

				</div>
			</div>

			</div>
	</div>
	<div class="container">
	<div class="contact-form">
	<div class="col-md-8 contact-grid">
<%
String username = (String) session.getAttribute("name");
int p_id = Integer.parseInt(request.getParameter("id"));
String p_title = "";
String p_about = "";
String p_date = "";
int p_price = 0;
int p_quantity = 0;
String p_category = null;

try {

	Connection con = DB.getConnection();
	Statement statement = con.createStatement();
	ResultSet resultset = statement
			.executeQuery("SELECT * FROM `e-commerce`.product where product_id='" + p_id + "'");

	while (resultset.next()) {
		p_date = resultset.getString(5);
		p_title = resultset.getString(2);
		p_quantity = resultset.getInt(7);
		p_id = resultset.getInt(1);
		p_price = resultset.getInt(6);
		p_about = resultset.getString(3);
		p_category = resultset.getString(8);
	}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<form action="update_user_sell_edit" enctype="multipart/form-data" method="post" style="margin-left:200px">
<input type="hidden" name="username" value="<%=username %>">
<input type="hidden" name="p_id" value="<%=p_id %>">
<br>
商品名稱:<br>
<input type="text" name="p_title" value="<%=p_title %>">
<br>
商品價格:<br>
<input type="text" name="p_price" value="<%=p_price %>">
<br>
商品數量:<br>
<input type="text" name="p_quantity" value="<%=p_quantity %>">
<br>
商品介紹:<br>
<input type="text" name="p_about" value="<%=p_about %>">
<br>
<h3>商品所屬種類</h3>
						<br><select name="p_category">
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
						<h3>更新商品照片</h3>
						<br><input name="image" type="file" accept="image/gif, image/jpeg, image/png" required></br>
<br>
<input type="submit" name="submit" value="更新">
</form>
</div>
</div>
</body>
</html>
			