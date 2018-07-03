<%@page import="model.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.BoardDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>B01BoardList</title>
<style type="text/css">
	body {
		font-family: "돋움";
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		width: 700px;
		margin: 0 auto;
	}
	
	table, tr, th, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	#num {
		padding: 10px;
		width: 50px;
	}
	#subject {
		padding: 10px;
		width: 350px;
	}
	#writer {
		padding: 10px;
		width: 100px;
	}
	#reg_date {
		padding: 10px;
		width: 140px;
	}
	#readcount {
		padding: 10px;
		width: 60px;
	}
	
	.st1 {
		padding: 5px;
		text-align: center;
	}
	.st2 {
		padding: 5px;
		text-align: left;
	}
	
	.end {
		padding: 5px;
		text-align: center;
	}
	
	a {
		text-decoration: none;
	}
</style>
</head>
<body>
<%
	BoardDAO bdao = new BoardDAO();
	Vector<BoardBean> vec = bdao.getAllBoard();
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
	for(int i = 0; i < vec.size(); i++) {
		BoardBean bean = vec.get(i);		
%>
		<tr>
			<td class="st1">
				<%=i + 1 %>
			</td>
			<td class="st2">
				<%
					if(bean.getRe_step() > 1) {
						for(int j = 0; j < (bean.getRe_step() - 1); j++) {
				%>
							&nbsp;
				<%			
						}
					}
					// 삭제된 글에 대해서는 링크 없이 텍스트 출력
					if(bean.getDel_flag().equals("Y")){
				%>
					삭제된 글입니다.
				<%
					}else{
				%>
				<a href="C01BoardInfo.jsp?num=<%=bean.getNum() %>">	
					<%=bean.getSubject() %>
				</a>
				<%
					}
				%>
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
				<button onclick="location.href='A01BoardWriteForm.jsp'">글쓰기</button>
			</td>
		</tr>
	</tfoot>
</table>

</body>
</html>











