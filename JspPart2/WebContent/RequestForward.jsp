<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
%>

	<h1>RequestLoginProc 페이지</h1>
	<p>아이디 : <%=id %></p>
	<p>패스워드 : <%=pass %></p>
	
</body>
</html>