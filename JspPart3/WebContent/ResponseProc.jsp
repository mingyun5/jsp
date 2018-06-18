<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 정보를 받아서 처리하는 페이지</h1>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	
	/* response.sendRedirect("ResponseRedirect.jsp"); */
	
	String newid = "id값을 변경하여 넘김";
%>	

	<h2>아이디 : <%=id %></h2>

	<jsp:forward page="ResponseRedirect.jsp">
		<jsp:param value="<%=newid %>" name="id"/>
		<jsp:param value="새로운 값을 생성해서 넘김" name="newinfo"/>
	</jsp:forward>
	
</body>
</html>