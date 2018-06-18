<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{margin: 0; padding: 0; font-family:'돋음';}
	table{width: 400px; margin: 0 auto;}
	table, tr, th, td{border: 1px solid #000;border-collapse:collapse}
	.mainName{padding: 10px 0;}
	.subName{padding: 5px 0; text-align: right;}
	.control{width: 99%;}
	.end{text-align: center}
</style>
</head>
<body>
	<form action="ReponseLoginProc.jsp" method="post">
		<table>
			<thead>
				<tr>
					<th colspan="2" class="mainName">로그인</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th class="subName">아이디</th>
					<td>
						<input class="control" type="text" name="id"/>
					</td>
				</tr>
				<tr>
					<th class="subName">비밀번호</th>
					<td>
						<input class="control" type="password" name="pass"/>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" class="end">
						<input type= "submit" value="로그인"/>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>