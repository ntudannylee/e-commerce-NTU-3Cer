<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_login</title>
</head>
<body>
<%@ include file="a_header.html"%>
<%String info = (String)request.getAttribute("info");
if(info == "invalid"){%>帳號密碼錯誤！<a href="a_login.jsp">請重新輸入</a><%}else{ %>
<form action="a_login" method = "post">
<div class="col-md-8 account-top">
輸入名字：
<input type = text name= name>
輸入密碼：
<input type = password name=password>
</div>
<input type="submit"  value="登入">
<div class="clearfix"> </div>
</form>
<%} %>
<%@ include file="a_footer.html"%>

</body>
</html>