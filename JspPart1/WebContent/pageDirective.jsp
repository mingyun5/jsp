<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ page session = "false" %>
<%@ page buffer = "8kb" autoFlush = "false" %>
<%@ page info = "copyright by lee" %>

<%@ page errorPage = "Error.jsp"%>
<%
	Date date = new Date();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int sum = 100 / 0;
	%>
</body>
</html>