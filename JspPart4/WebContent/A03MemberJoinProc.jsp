<%@page import="model.MemberDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

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
		//0. 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");
	%>

	<!-- 1. 사용자 입력값을 MemberBean에 셋팅 -->
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>

	<%
		/* 2. 취미(hobby) 처리 */
		String[] hobby = request.getParameterValues("hobby");
		String texthobby = "";

		for (int i = 0; i < hobby.length; i++) {
			texthobby += hobby[i] + " ";
		}

		mbean.setHobby(texthobby);
	%>
	<!-- 3. 패스워드/패스워드 확인 비교 -->
	<%
		if (!mbean.getPass1().equals(mbean.getPass2())) {
	%>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.")
		history.go(-1);
	</script>
	<%
		}
	%>

	<!-- 4. 오라클에 데이서 insert 처리 -->

	<%
		MemberDao mdao = new MemberDao();
		mdao.insertMember(mbean);

		response.sendRedirect("A04MemberList.jsp");
	%>

</body>
</html>