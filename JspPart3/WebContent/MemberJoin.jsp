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
<form action="MemberJoinProc.jsp" method="post">
	<table>
		<thead>
			<tr>
				<th colspan="2" class="mainName">회원가입</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th class="subName">아이디</th>
				<td>
					<input type="text" name="id" class="control">
				</td>
			</tr>
			<tr>
				<th class="subName">패스워드</th>
				<td>
					<input type="password" name="pass1" class="control">
				</td>
			</tr>
			<tr>
				<th class="subName">이메일</th>
				<td>
					<input type="email" name="email" placeholder="abc@abc.com" class="control">
				</td>
			</tr>
			<tr>
				<th class="subName">전화번호</th>
				<td>
					<input type="text" name="tel" class="control">
				</td>
			</tr>
			<tr>
				<th class="subName">주소</th>
				<td>
					<input type="text" name="address" class="control">
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" class="end">
					<input type="submit" value="가입">
					<input type="reset" value="취소">
				</td>
			</tr>
		</tfoot>
	</table>
</form>	
</body>
</html>