<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="DB.DB"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢使用者聯絡表單</title>
</head>
<body>
<%@ include file="a_header.html" %>
<div class="row" >
<div class="col-md-3 ">
<div class="list-group ">
<a href="a_userinfo.jsp" class="list-group-item list-group-item-action ">管理使用者帳戶</a>
<a href="a_payment.jsp" class="list-group-item list-group-item-action">使用者訂單訊息</a>
<a href="a_emaillist.jsp" class="list-group-item list-group-item-action ">訂閱電子報使用者列表</a>
<a href=# class="list-group-item list-group-item-action active">查看使用者聯絡表單</a>
<a href="a_product.jsp" class="list-group-item list-group-item-action">查看所有產品列表</a>
</div> 
</div>



<%
int cid = 0;
String name = "";
String email="";
String subject="";
String message="";
	try {
		
		Connection con = DB.getConnection();
		Statement statement = con.createStatement();
		ResultSet resultset = statement.executeQuery("SELECT * FROM `e-commerce`.contact");
		
		while(resultset.next()) {
			cid =  resultset.getInt(1);
			name = resultset.getString(2);
			email = resultset.getString(3);
			subject = resultset.getString(4);
			message = resultset.getString(5);
			%>
			<div >
			<table border="1" >
			<tr><th><%=name %></th><td><%=email %></td><td><%=subject %></td><td><%=message %></td><td><a href = "admin?cid=<%=cid%>">刪除</a></td></tr>
			</table>
			</div>
			<% }
		}
	catch(Exception e){
		e.printStackTrace();
	}
%>
</div>

<%@ include file="a_footer.html" %>
</body>
</html>