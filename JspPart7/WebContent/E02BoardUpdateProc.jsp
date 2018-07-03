<%@page import="model.BoardDAO"%>
<%@page import="model.BoardBean"%>
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
	// 해당 게시글의 패스워드를 얻어옴
	BoardDAO bdao = new BoardDAO();
	String pass = bdao.getPass(boardbean.getNum());
	
	// 테이블의 패스워드와 사용자가 입력한 패스워드를 비교
	if(pass.equals(boardbean.getPassword())) {
		// 같으면 업데이트 처리
		bdao.updateBoard(boardbean); 
		
		// 업데이트 완료 후 전체글목록으로 이동
		response.sendRedirect("B01BoardList.jsp");
	} else {
%>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다! 확인후 다시 수정하세요.");
		history.go(-1);
	</script>
<%		
	}
%>
</body>
</html>














