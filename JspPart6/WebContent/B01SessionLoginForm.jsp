<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	body{font-family: "돋움"}
	table{width: 400px; margin: 0 auto;}
	table, tr, th, td {border: 1px solid #000;}
	.mainName{padding: 0 10px;}
	.subName{padding: 0 10px; width: 150px; text-align: center;}
	.end{padding: 0 5px; text-align: center;}
	.control{width: 250px;}
</style>

<body>
	<form action="B02SessionLoginProc.jsp" method="post">
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
						<input type="text" name="id" class="control"/>
					</td>
				</tr>
				<tr>
					<th class="subName">패스워드</th>
					<td>
						<input type="password" name="pass" class="control"/>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" class="end">
						<input type="submit" value="확인"/>
						<input type="reset" value="취소"/>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>