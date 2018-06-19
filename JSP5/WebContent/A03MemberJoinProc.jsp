<%@page import="model.MemberDAO"%>
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
	request.setCharacterEncoding("utf-8");
%>

	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>

<%
	String [] hobby = request.getParameterValues("hobby");
	String texthobby = "";
	
	for(int i = 0; i < hobby.length; i++){
		texthobby += hobby[i] + " ";
	}
	
	mbean.setHobby(texthobby);
%>

<%
	if(!mbean.getPass1().equals(mbean.getPass2())) {
%>
	<script type="text/javascript">
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다!");
		history.go(-1);
	</script>
<%		
	} else {
		MemberDAO mdao = new MemberDAO();
		
		mdao.insertMember(mbean);
		
		response.sendRedirect("A04MemberList.jsp");
	}
%>
</body>
</html>