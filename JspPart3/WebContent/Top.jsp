<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="800">
		<tr height="100">
			<td colspan="7" align="center">
				<font size="10"><b>작품소개</b></font>
			</td>
		</tr>
		<tr height="50">
			<td width="110" align="center">작품 1</td>
			<td width="110" align="center">작품 2</td>
			<td width="110" align="center">작품 3</td>
			<td width="110" align="center">작품 4</td>
			<td width="110" align="center">작품 5</td>
			<td width="110" align="center">작품 6</td>
			<td width="140" align="center"><%=request.getParameter("id") %>님 방갑습니다.</td>
		</tr>
	</table>
</body>
</html>