<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>SessionName.jsp페이지 입니다.</h1>
	<%
		String name1 = request.getParameter("name");
	%>
	
	<h3><%=name1 %>님 반갑습니다.</h3>
	<hr>
	<%
		String name2 = (String)session.getAttribute("key");
	%>
	<h3><%=name2 %></h3>
</body>
</html>