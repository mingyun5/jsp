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
%>

<jsp:useBean id="mbean" class="model.MemberBean">
	<jsp:setProperty name="mbean" property="*"/>
</jsp:useBean>

<%
	String[] hobby = request.getParameterValues("hobby");
	String textHobby = "";
	
	for(int i = 0; i < hobby.length; i++){
		textHobby += hobby[i] + " ";
	}
	
	mbean.setHobby(textHobby);
%>

<!-- 사용자가 수정한 내역을 테이블에 업데이트 -->
</body>
</html>