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
	String a = "출력할 내용";
%>
	<p>표현식으로 출력 : <%= a %></p>
	<hr>
<%
	out.println("out 객체로 출력 : " + a);
%>
</body>
</html>