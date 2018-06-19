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
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	session.setAttribute("sessionid", id);
	session.setAttribute("sessionpass", pass);
	
	session.setMaxInactiveInterval(60);
%>


<h3>세션 로그인 처리 1</h3>
<p>아이디 : <%=id %></p>
<p>패스워드 : <%=pass %></p>
<a href="B03SessionLoginProc.jsp">다음페이지로 이동</a>
</body>
</html>
