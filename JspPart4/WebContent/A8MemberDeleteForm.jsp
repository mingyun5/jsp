<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{font-family: "돋움"}
	table{width: 500px; margin: 0 auto;}
	table, tr,th, td{border: 1px solid #000}
	
	.mainName{padding: 10px 0;}
	.subName{width: 150px; padding: 5px 0; text-align: right;}
	.end{padding: 5px 0; text-align: center}
</style>

</head>
<body>
	<form action="A09MemberDeleteProc.jsp" method="post">
		<table>
			<thead>
				<tr>
					<th colspan="2" class="mainName">회원정보 삭제</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th class="subName">
						아이디
					</th>
					<td>
						<%= request.getParameter("id") %>
					</td>
				</tr>
				<tr>
					<th class="subName">비밀번호</th>
					<td>
						<input type="password" name="pass1"/>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" class="end">
						<input type="hidden" name="id" value="<%= request.getParameter("id") %>"/>
						<input type="submit" value="회원정보 삭제"/>
						<button type="button" onclick="location.href='A04MemberList.jsp'">회원전체보기</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>