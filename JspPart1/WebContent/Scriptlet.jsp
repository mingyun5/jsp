<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1~10까지 출력</h1>
	<%
		for(int i =1; i <= 10; i++){
			//System.out.println(i);
	%>
		<%= i %> <br>
	<%	
		}
	%>
	
</body>
</html>
