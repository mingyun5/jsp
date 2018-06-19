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
<%
	//쿠키 저장소로부터 쿠키값을 읽어옴 > 여러개의 쿠키를 배열을 이용하여 저장
	Cookie[] cookies = request.getCookies();
	
	String id = "";
	String check = "";
	
	if(cookies != null){
		for(int i = 0;  i < cookies.length; i++){
			if(cookies[i].getName().equals("cookietest")){
				id = cookies[i].getValue();
				check = "Y";
				break;
			}
		}
	}
%>
	<form action="A02CookeLoginProc.jsp" method="post">
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
						<input type="text" name="id" class="control" value="<%= id%>"/>
					</td>
				</tr>
				<tr>
					<th class="subName">패스워드</th>
					<td>
						<input type="password" name="pass" class="control"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="subName">
						<input type="checkbox" name="save" id="chk1" value="Y" <%= check.equals("Y")? "checked" : "" %>/>
						<label for="chk1">아이디 저장</label>
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