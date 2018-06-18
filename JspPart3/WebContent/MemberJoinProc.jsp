<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		font-family: "돋움";
	}
	
	table {
		width: 500px;
		margin: 0 auto;
	}
	
	table, tr, th, td {
		border: 1px solid black;
	}
	
	.mainName {
		padding: 10px;
	}
	
	.subName {
		width: 150px;
		padding: 5px;
		text-align: right;
	}
	
	.end {
		padding: 5px;
		text-align: center;
	}
	
	.control {
		width: 350px;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	/*String id = request.getParameter("id");
	String pass1 = request.getParameter("pass1");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");*/
%>

<jsp:useBean id="mbean" class="bean.MemberBean">
	<jsp:setProperty name="mbean" property="*"/>
</jsp:useBean>

<table>
	<thead>
		<tr>
			<th colspan="2" class="mainName">회원정보</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th class="subName">아이디</th>
			<td><jsp:getProperty property="id" name="mbean"/></td>
		</tr>
		<tr>
			<th class="subName">이메일</th>
			<td><jsp:getProperty property="email" name="mbean"/></td>
		</tr>
		<tr>
			<th class="subName">전화번호</th>
			<td><jsp:getProperty property="tel" name="mbean"/></td>
		</tr>
		<tr>
			<th class="subName">주소</th>
			<td><jsp:getProperty property="address" name="mbean"/></td>
		</tr>
	</tbody>
</table>
</body>
</html>