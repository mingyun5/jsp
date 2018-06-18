<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


	*{padding: 0 ; margin: 0;}
	table{width : 500px; margin: 0 auto;border-collapse:collapse}
	textarea{width: 99%; resize: none;height: 100px}
	.textBox{width:  99%;}
	.mainTitle{font-size:  15px; font-weight: bold}
	.subTitle{width: 150px; text-align: center}
	.buttonArea{text-align: center}
</style>

</head>
<body>
	<form action="RequestJoinProc.jsp" method="post">
		<table border="1">
			<thead>
				<tr>
					<th colspan = "2" class="mainTitle">회원가입</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th class="subTitle">아이디</th>
					<td>
						<input class="textBox" type="text" name="id"/>
					</td>
				</tr>
				<tr>
					<th class="subTitle">패스워드</th>
					<td><input class="textBox" type="password" name="pass1"/></td>
				</tr>
				<tr>
					<th class="subTitle">패스워드확인</th>
					<td><input class="textBox" type="password" name="pass2"/></td>
				</tr>
				<tr>
					<th class="subTitle">이메일</th>
					<td><input class="textBox" type="email" name="email"/></td>
				</tr>
				<tr>
					<th class="subTitle">전화번호</th>
					<td><input class="textBox" type="number" name="tel"/></td>
				</tr>
				<tr>
					<th class="subTitle">취미</th>
					<td>
						<input type="checkbox" name="hobby" value="낚시" id="chk1"/><label for="chk1">낚시</label>
						<input type="checkbox" name="hobby" value="등산" id="chk2"/><label for="chk2">등산</label>
						<input type="checkbox" name="hobby" value="영화" id="chk3"/><label for="chk3">영화</label>
						<input type="checkbox" name="hobby" value="음악" id="chk4"/><label for="chk4">음악</label>
					</td>
				</tr>
				<tr>
					<th class="subTitle">직업</th>
					<td>
						<select name="job">
							<option value="프로그래머">프로그래머</option>
							<option value="디자이너">디자이너</option>
							<option value="모델러">모델러</option>
							<option value="관리자">관리자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="subTitle">연령</th>
					<td>
						<input type="radio" name="age" value="10" id="rad1"/><label for="rad1">10대</label>
						<input type="radio" name="age" value="20" id="rad2"/><label for="rad2">20대</label>
						<input type="radio" name="age" value="30" id="rad3"/><label for="rad3">30대</label>
						<input type="radio" name="age" value="40" id="rad4"/><label for="rad4">40대</label>
					</td>
				</tr>
				<tr>
					<th class="subTitle">소개</th>
					<td>
						<textarea name="info"></textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td class="buttonArea" colspan="2">
						<input type="submit" value="가입" />
						<input type="reset" value="취소" />
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>