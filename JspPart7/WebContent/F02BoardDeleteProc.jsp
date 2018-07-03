<%@page import="model.BoardDAO"%>
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

<jsp:useBean id="boardbean" class="model.BoardBean">
	<jsp:setProperty name="boardbean" property="*" />
</jsp:useBean>

<%
	//해당글의 비밀번호를 받아옴
	BoardDAO dao = new BoardDAO();
	
	String pass= dao.getPass(boardbean.getNum());
	
	//테이블의 패스워드와 사용자가 입력한 패스워드 비교
	if(pass.equals(boardbean.getPassword())){ //두 패스워드가 같으면
		dao.deleteBoard(boardbean.getNum()); // 삭제 처리
		
		response.sendRedirect("B01BoardList.jsp");
	}else{ //패스워드가 다르면
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