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

	String save = request.getParameter("save");
	
	String id = request.getParameter("id");
	
	//아이디저장 체크박스가 체크되어 있으면 쿠키를 생성
	if(save != null){ 
		Cookie cookie = new Cookie("cookietest", id); //쿠키이름 , 쿠기값
		
		cookie.setMaxAge(60 * 3);
		
		response.addCookie(cookie);
		
		out.write("쿠기 생성 완료");
	}
%>
</body>
</html>