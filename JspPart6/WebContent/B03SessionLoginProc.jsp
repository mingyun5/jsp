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
	String id = (String)session.getAttribute("sessionid");
	String pass = (String)session.getAttribute("sessionpass");
%>

<h3>세션 로그인 2</h3>
<p>아이디 : <%=id %></p>
<p>패스워드 : <%=pass %></p>
</body>
</html>