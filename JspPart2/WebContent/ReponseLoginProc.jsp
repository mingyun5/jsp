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
		//DB에서 받아온 ID/PW라고 가정
		
		String dbid = "test";
		String dbpass = "1234";
		
		//사용자로부터 넘어온 ID/PW
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		if(dbid.equals(id) && dbpass.equals(pass)){
			//메인 페이지로 이동
			response.sendRedirect("ResponseMain.jsp?id="+id);
		}else{
			%>
			<script>
			alert("아이디와 패스워드가 일치하지 않습니다.");
			history.go(-1);
			</script>
			<%
		}
	%>
</body>
</html>