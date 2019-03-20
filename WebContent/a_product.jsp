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
<title>管理產品資訊</title>
</head>
<body>
<%@ include file="a_header.html" %>
<div class="row" >
<div class="col-md-3 ">
<div class="list-group ">
<a href="a_userinfo.jsp" class="list-group-item list-group-item-action ">管理使用者帳戶</a>
<a href="a_payment.jsp" class="list-group-item list-group-item-action ">使用者訂單訊息</a>
<a href="a_emaillist.jsp" class="list-group-item list-group-item-action">訂閱電子報使用者列表</a>
<a href="a_contact.jsp" class="list-group-item list-group-item-action">查看使用者聯絡表單</a>
<a href=# class="list-group-item list-group-item-action active">查看所有產品列表</a>
</div> 
</div>

<%
int prid = 0;
String ptitle = "";
String pdate = "" ;
int pprice=0;
int pquan=0;
String pcate="";
String pcustomer="";
	try {
		
		Connection con = DB.getConnection();
		Statement statement = con.createStatement();
		ResultSet resultset = statement.executeQuery("SELECT * FROM `e-commerce`.product");
		
		while(resultset.next()) {
			ptitle = resultset.getString(2);
			pdate = resultset.getString(5);
				 prid = resultset.getInt(1);
				 pprice = resultset.getInt(6);
				 pquan = resultset.getInt(7);
				 pcate = resultset.getString(8);
				 pcustomer = resultset.getString(9);
			%>
			<div >
			<table border="2" >
			<tr><th>產品編號</th><th>產品標題</th><th>上架時間</th><th>產品價格</th><th>產品數量</th><th>產品種類</th><th>賣家</th></tr>
			<tr><td><%=prid %></td><td><%=ptitle %></td><td><%=pdate %></td><td><%=pprice %></td>
			<td><%=pquan %></td><td><%=pcate %></td><td><%=pcustomer %></td><td><a href = "admin?prid=<%=prid%>">刪除</a></td></tr>
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