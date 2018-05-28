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
	
	for(int i = 0; i < hobby.length; i++){
		texthobby += hobby[i] + " ";
	}
	
	mbean.setHobby(texthobby);
	
	/* 3. 오라클에 접속 , 데이터 처리 */
	String id = "scott";
	String pass = "tiger";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		/* 오라클 접속  */
		Connection con = DriverManager.getConnection(url, id, pass);
		
		/* 쿼리 준비 */
		String sql = "insert into member values(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		/* 쿼리에서 ?의 순어에 맞게 데이터 메핑 */
		pstmt.setString(1, mbean.getId());
		pstmt.setString(2, mbean.getPass1());
		pstmt.setString(3, mbean.getEmail());
		pstmt.setString(4, mbean.getTel());
		pstmt.setString(5, mbean.getHobby());
		pstmt.setString(6, mbean.getJob());
		pstmt.setString(7, mbean.getAge());
		pstmt.setString(8, mbean.getInfo());
		
		/* 쿼리 실행 */
		pstmt.executeUpdate(); //insert, update, delete 시 사용하는 메서드
		
		
		/* 자원 반납 */
		pstmt.close();
		con.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	<h1>회원가입 완료</h1>
	
		
</body>
</html>