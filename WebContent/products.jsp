<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="DB.DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id = "user" class = "Controller.Login" scope = "session"/>
<!DOCTYPE html>
<html>
<head>
<title>筆電商品一覽</title>
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
<!--content-->
<!---->
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
		        <div class="cart box_1"> <a href="checkout.jsp">
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
		      <div class="logo"> <a href="index.jsp"><img src="images/logo.png" alt=""></a></div>
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

<c:choose>	
			<c:when test="${name==null}">
			<div class="contact"> 	
				<h1><font color="#FF0000">請先登入!</font><a href="register.jsp"><p>還沒有帳號嗎? 點此註冊</p></a></h1></div>
			</c:when>
			
		<c:otherwise>
		
		<div class="product">
			<div class="container">
				<div class="col-md-3 product-price">
					  
				<div class=" rsidebar span_1_of_left">
					<div class="of-left">
						<h3 class="cate">產品種類</h3>
					</div>
		 <ul class="menu">
		<li class="item1"><a href="#">電腦 </a>
			<ul class="cute">
				<li class="subitem1"><a href="products.jsp?id=laptop">筆電 </a></li>
				<li class="subitem2"><a href="products.jsp?id=desktop">桌電 </a></li>
				<li class="subitem3"><a href="products.jsp?id=ipad">平板 </a></li>
			</ul>
		</li>
		<li class="item2"><a href="products.jsp?id=phone">手機 </a>
		</li>
		<li class="item3"><a href="products.jsp?id=ear">耳機</a>
		</li>
		<li class="item4"><a href="products.jsp?id=camera">相機</a>
		</li>			
		<li class="item5"><a href="products.jsp?id=disk">硬碟</a>
		</li>			
		<li class="item6"><a href="products.jsp?id=tv">電視</a>
		</li>
	</ul>
					</div>
				<!--initiate accordion-->
		<script type="text/javascript">
			$(function() {
			    var menu_ul = $('.menu > li > ul'),
			           menu_a  = $('.menu > li > a');
			    menu_ul.hide();
			    menu_a.click(function(e) {
			        e.preventDefault();
			        if(!$(this).hasClass('active')) {
			            menu_a.removeClass('active');
			            menu_ul.filter(':visible').slideUp('normal');
			            $(this).addClass('active').next().stop(true,true).slideDown('normal');
			        } else {
			            $(this).removeClass('active');
			            $(this).next().stop(true,true).slideUp('normal');
			        }
			    });
			
			});
		</script>
<!---->
	<div class="product-middle">
		
					<div class="fit-top">
						<h6 class="shop-top">NTU-3Cer----Your best friend.</h6>
						<a href="#" class="shop-now">SHOP NOW</a>
<div class="clearfix"> </div>
	</div>
				</div>
<!---->
				
<div class=" per1">
				<img class="img-responsive" src="images/pro.jpg" alt="">
				<div class="six1">
					<h4>NTU</h4>
					<p>3Cer</p>
					<span>PC</span>
				</div>
			</div>
			
				</div>
				<div class="col-md-9 product1">
				<div class=" bottom-product">
						
				<%    
		String p_category = request.getParameter("id");
		int p_id = 0;
        int p_price = 0;
        int p_quantity = 0;
		String p_title = null;
		String p_description = null;
		String p_date = null;
		int i = 0 ;
		
			try {
				
				Connection con = DB.getConnection();
				Statement statement = con.createStatement();
				ResultSet resultset = statement.executeQuery("SELECT * FROM `e-commerce`.product where category = '"+ p_category +"'");	
				
				while(resultset.next()) {
					p_category = resultset.getString(7);
					p_description = resultset.getString(3);
					p_date = resultset.getString(5);
						 p_title = resultset.getString(2);
						 p_quantity = resultset.getInt(7);
						 p_id = resultset.getInt(1);
						 p_price = resultset.getInt(6);
					i++;
					if(i==3){     // 3個一排
						%><br></br><% 
					i=0;
					}
					
				%>
				<div class="col-md-4 bottom-cd simpleCart_shelfItem">
						<div class="product-at ">
						<a href="single.jsp?id=<%=p_id%>"><img class="img-responsive" src="getImage.jsp?id=<%=p_id%>" style="max-height: 250px; max-width: 250px;" alt="">
							<div class="pro-grid">
							<span class="buy-in">Buy Now</span>
							</div>
						</a>
						</div>
						<p class="tun"><%= p_title %></p>
						<a href="cart?id=<%=p_id %>&action=add" class="item_add"><p class="number item_price"><i> </i>$<%=p_price %></p></a>						
						</div>	
				
				<%
			}}	catch(Exception e){
								e.printStackTrace();
				} %>
					
					
					<div class="clearfix"> </div>
				</div>
				
				</div>
				
		<div class="clearfix"> </div>
		<nav class="in">
				  <ul class="pagination">
					<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
					<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
					<li><a href="#">2 <span class="sr-only"></span></a></li>
					<li><a href="#">3 <span class="sr-only"></span></a></li>
					<li><a href="#">4 <span class="sr-only"></span></a></li>
					<li><a href="#">5 <span class="sr-only"></span></a></li>
					 <li> <a href="#" aria-label="Next"><span aria-hidden="true">»</span> </a> </li>
				  </ul>
				</nav>
		</div>
		
		</div>
		
		</c:otherwise>
		</c:choose>
<!---->

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
    <p >© 2018 NTU 3CER All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a></p>
  </div>
</div>
</body>
</html>
			