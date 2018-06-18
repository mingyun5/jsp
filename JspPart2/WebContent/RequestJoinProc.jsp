<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	padding: 0;
	margin: 0;
}

table {
	width: 500px;
	margin: 0 auto;
	border-collapse: collapse
}

.mainTitle {
	font-size: 15px;
	font-weight: bold
}

.subTitle {
	width: 150px;
	text-align: center
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");

		//체크 박스에 체크된 만큼 자동으로 hobby 배열에 저장됨
		String[] hobby = request.getParameterValues("hobby");

		String job = request.getParameter("job");
		String age = request.getParameter("age");
		String info = request.getParameter("info");
	
		String ip = request.getRemoteAddr();
		
		if (!pass1.equals(pass2)) {
	%>
	<script>
		alert("비밀번호와 비밀번호 확인이 틀립니다.");
		history.go(-1);
	</script>
	<%
		}
	%>
	<table border="1">
		<thead>
			<tr>
				<th colspan="2" class="mainTitle">회원정보</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th class="subTitle">아이디</th>
				<td><%=id%></td>
			</tr>
			<tr>
				<th class="subTitle">이메일</th>
				<td><%=email%></td>
			</tr>
			<tr>
				<th class="subTitle">전화번호</th>
				<td><%=tel%></td>
			</tr>
			<tr>
				<th class="subTitle">취미</th>
				<td>
					<%
						for (int i = 0; i < hobby.length; i++) {
							out.write(hobby[i] + " ");
						}
					%>
				</td>
			</tr>
			<tr>
				<th class="subTitle">직업</th>
				<td><%=job%></td>
			</tr>
			<tr>
				<th class="subTitle">연령</th>
				<td><%=age%></td>
			</tr>
			<tr>
				<th class="subTitle">소개</th>
				<td><%=info%></td>
			</tr>
			<tr>
				<th class="subTitle">아이피</th>
				<td><%=ip%></td>
			</tr>
		</tbody>
	</table>

</body>
</html>