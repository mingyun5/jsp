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
		String id = (String) session.getAttribute("id");

		if (id == null) {
			id = "guest";
		}
	%>

	<table width="200">
		<tr height="60">
			<td width="200" align="center">
			<%
				if (id.equals("guest")) {
			%>
			<a href="C05Main.jsp?center=C03Center.jsp">페이지 1</a>
			<%
				} else {
			%>
			<a href="C05Main.jsp?center=C08Page1.jsp">페이지 1</a>
			<%
				}
			%>
			</td>
		</tr>
		<tr height="60">
			<td width="200" align="center">
			<%
				if (id.equals("guest")) {
			%>
			<a href="C05Main.jsp?center=C03Center.jsp">페이지 2</a>
			<%
				} else {
			%>
			<a href="C05Main.jsp?center=C08Page2.jsp">페이지 2</a>
			<%
				}
			%>
			</td>
		</tr>
		<tr height="60">
			<td width="200" align="center">
			<%
				if (id.equals("guest")) {
			%>
			<a href="C05Main.jsp?center=C03Center.jsp">페이지 3</a>
			<%
				} else {
			%>
			<a href="C05Main.jsp?center=C08Page3.jsp">페이지 3</a>
			<%
				}
			%>
			</td>
		</tr>
		<tr height="60">
			<td width="200" align="center">
			<%
				if (id.equals("guest")) {
			%>
			<a href="C05Main.jsp?center=C03Center.jsp">페이지 4</a>
			<%
				} else {
			%>
			<a href="C05Main.jsp?center=C08Page4.jsp">페이지 4</a>
			<%
				}
			%>
			</td>
		</tr>
	</table>
</body>
</html>