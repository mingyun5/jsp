<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String logout = request.getParameter("logout");

	if (logout != null) {
		session.setAttribute("id", null);
		session.setAttribute("pass", null);
		session.setMaxInactiveInterval(0);
		
		response.sendRedirect("C05Main.jsp");
	}
	
	String id = (String)session.getAttribute("id");
	
	if (id == null) {
		id = "guest";
	}
	
%>
<table width="800">
	<tr height="100">
		<td colspan="7" align="center">
			<font size="10"><b>작품 소개</b></font>
		</td>
	</tr>
	<tr height="50">
		<td width="100" align="center">메뉴 1</td>
		<td width="100" align="center">메뉴 2</td>
		<td width="100" align="center">메뉴 3</td>
		<td width="100" align="center">메뉴 4</td>
		<td width="100" align="center">메뉴 5</td>
		<td width="100" align="center">메뉴 6</td>
		<td width="100" align="center">
		<%
			if (id.equals("guest")) {
		%>
				<%=id %>님 <button onclick="location.href='C05Main.jsp?center=C06LoginForm.jsp'">로그인</button>
		<%		
			} else {
		%>
				<%=id %>님 <button onclick="location.href='C05Main.jsp?logout=Y'">로그아웃</button>
		<%
			}
		%>
		</td>
	</tr>
</table>
</body>
</html>






