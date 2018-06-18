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
		String name = "mingyun";
	
		session.setAttribute("key", name);
	%>
	<a href="SessionName.jsp?name=<%= name %>">SessionName.jsp페이지</a>
</body>
</html>