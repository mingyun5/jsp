<%@page import="model.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.BoardDAO"%>
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
	h2{text-align:center}
	table{width:700px; margin: 0 auto;}
	table, tr, th, td{border: 1px solid #000; border-collapse:collapse}
	#num{padding: 10px 0; width: 50px;}
	#subject{padding: 10px 0; width: 320px;}
	#writer{padding: 10px 0; width: 100px;}
	#reg_date{padding: 10px 0 ; width: 150px;}
	#readcount{padding: 10px 0; width: 80px;}
	.st1{padding: 5px 0; text-align: center;}
	.st2{padding: 5px ; text-align: left}
	.end{text-align: center; padding: 10px 5px;}
	a {text-decoration: none}
</style>
<body>
<%
	BoardDAO dao = new BoardDAO();
	Vector<BoardBean> vec = dao.getAllBoard();
%>
	<h2>[전체글 보기]</h2>
	<table>
		<thead>
			<tr>
				<th id="num">번호</th>
				<th id="subject">제목</th>
				<th id="writer">작성자</th>
				<th id="reg_date">작성일</th>
				<th id="readcount">조회수</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(int i= 0; i < vec.size(); i++){
				BoardBean bean = vec.get(i);
		%>
			<tr>
				<td class="st1">
					<%=i+1 %>
				</td>
				<td	class="st2">
					<a href="C01BoardInfo.jsp?num=<%= bean.getNum()%>">
						<!-- 차후 답변글 출력 구현 -->
						
						<%=bean.getSubject() %>
					</a>
				</td>
				<td class="st1">
					<%=bean.getWriter() %>
				</td>
				<td class="st1">
					<%=bean.getReg_date() %>
				</td>
				<td class="st1">
					<%=bean.getReadcount() %>
				</td>
			</tr>
		<%
			}
		%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" class="end">
					<button onclick="location.href='A01BoardWriterForm.jsp'">글 쓰기</button>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>