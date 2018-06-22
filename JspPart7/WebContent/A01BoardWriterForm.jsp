<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	body{font-family:"돋움"}
	table{width: 600px; margin: 0 auto;}
	table, tr, th, td{border: 1px solid #000;}
	
	.mainName{ padding: 0 10px; }
	.subName{width: 150px; padding: 0 5px;text-align: right;}
	.control{width: 450px;}
	.end{padding: 0 5px; text-align: center;}
</style>
<body>
	<form action="A02BoardWriteProc.jsp" method="POST">
		<table>
			<thead>
				<tr>
					<th colspan="2" class="mainName">글쓰기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th class="subName">작성자</th>
					<td>
						<input type="text" name="writer" class="control"/>
					</td>
				</tr>
				<tr>
					<th class="subName">제목</th>
					<td>
						<input type="text" name="subject"  class="control"/>
					</td>
				</tr>
				<tr>
					<th class="subName">이메일</th>
					<td>
						<input type="email" name="email"  class="control"/>
					</td>
				</tr>
				<tr>
					<th class="subName">비밀번호</th>
					<td>
						<input type="password" name="password"  class="control"/>
					</td>
				</tr>
				<tr>
					<th class="subName">내용</th>
					<td>
						<textarea rows="10" cols="50" name="content"></textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2"  class="end">
						<input type="submit" value="확인" />&nbsp;&nbsp;
						<input type="reset" value="초기화" />
						<button type="button" onclick="location.href='B01BoardList.jsp'">전체 글</button>
					</td>
				</tr>		
			</tfoot>
		</table>
	</form>
</body>
</html>