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
				<td class="st3"></td>
				<td></td>
				<td></td>
			</tr>
		<%
			}
		%>
		</tbody>
		<tfoot></tfoot>
	</table>
</body>
</html>