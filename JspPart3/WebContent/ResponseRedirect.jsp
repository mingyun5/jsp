<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>리다이렉트 된 페이지</h1>
	
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	
	String newinfo = request.getParameter("newinfo");

%>	

	<h2>아이디 : <%=id %></h2>
	<h2>새로 생성한 값 : <%=newinfo %></h2>
</body>
</html>