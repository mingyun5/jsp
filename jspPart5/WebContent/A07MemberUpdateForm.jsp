<%@page import="model.MemberDao"%>
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

<%
	MemberDao mdao = new MemberDao();
	
	String pass = mdao.getPass(mbean.getId());
	
	//사용자가 패스워드르 입력하지 않아 null로 값이 넘어오는 경우 ""로 다시 저장
	if(mbean.getPass1() == null){
		mbean.setPass1("");
	}
	
	if(mbean.getPass1().equals(pass)){
		mdao.updateMember(mbean);
		
		response.sendRedirect("A04MemberList.jsp");
	}else{
		%>
		<script>
			alert("비밀번호가 일치하지 않습니다.");
			history.go(-1);
		</script>	
		<%
	}
%>
</body>
</html>