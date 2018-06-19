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
	String center = request.getParameter("center");
	
	if(center == null){
		center = "C03Center.jsp";
	}
%>
<table border="1" width="800">
<!-- top -->
	<tr height="150">
		<td align="center" colspan="2">
			<jsp:include page="C01Top.jsp" />
		</td>
	</tr>
	<tr height="400">
		<!-- left -->
		<td align="center" width="200">
			<jsp:include page="C02Left.jsp" />
		</td>
		<!-- center -->
		<td align="center" width="600">
			<jsp:include page="<%=center %>" />
		</td>
	</tr>
	<tr height="100">
		<td colspan="2" align="center">
			<jsp:include page="C04Bottom.jsp" />
		</td>
	</tr>
</table>
</body>
</html>