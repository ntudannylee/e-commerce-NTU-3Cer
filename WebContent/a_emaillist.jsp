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
<title>訂閱電子報使用者列表</title>
</head>

<body>
<%@ include file="a_header.html" %>
<div class="row" >
<div class="col-md-3 ">
<div class="list-group ">
<a href="a_userinfo.jsp" class="list-group-item list-group-item-action ">管理使用者帳戶</a>
<a href="a_payment.jsp" class="list-group-item list-group-item-action">使用者訂單訊息</a>
<a href=# class="list-group-item list-group-item-action active">訂閱電子報使用者列表</a>
<a href="a_contact.jsp" class="list-group-item list-group-item-action">查看使用者聯絡表單</a>
<a href="a_product.jsp" class="list-group-item list-group-item-action">查看所有產品列表</a>
</div> 
</div>



<%
int id = 0;
String name = "";
String uemail="";
	try {
		
		Connection con = DB.getConnection();
		Statement statement = con.createStatement();
		ResultSet resultset = statement.executeQuery("SELECT * FROM `e-commerce`.customer where subscription = 1");
		
		while(resultset.next()) {
				 uemail = resultset.getString(2);
				 name = resultset.getString(3);
				 id = resultset.getInt(1);
			%>
			<div >
			<table border="2" width="150">
			<tr><td><%=id %></td><td><%=name %></td><td><%=uemail %></td><td><a href = "admin?name=<%=name%>">刪除</a></td></tr>
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