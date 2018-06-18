<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
	<form action="ResponseProc.jsp" method="post">
		<table width="400" border="1">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td width="250">
					<input type="text" name="id">
				</td>
			</tr>
			<tr height="50">
				<td align="center" width="150">비밀번호</td>
				<td width="250">
					<input type="password" name="pass">
				</td>
			</tr>
			<tr height="50">
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>		
</center>
</body>
</html>