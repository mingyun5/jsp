<%@page import="model.BoardBean"%>
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
	table{width: 600px; margin: 0 auto;}
	table, tr, th, td{border:1px solid #000}
	.mainName{padding: 10px; }
	.subName{width: 100px; padding: 5px;}
	.st1{width: 200px; padding: 5px; text-align: center;}
	.end{padding: 5px; text-align: center}
	
</style>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num").trim());

	BoardDAO dao = new BoardDAO();
	BoardBean bean = dao.getOneBoard(num);
%>
<table>
	<thead>
		<tr>
			<th colspan="4" class="mainName">글상세</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th class="subName">글번호</th>
			<td class="st1"><%=bean.getNum() %></td>
			<th class="subName">조회수</th>
			<td class="st1"><%=bean.getReadcount() %></td>
		</tr>
		<tr>
			<th class="subName">작성자</th>
			<td class="st1"><%=bean.getWriter() %></td>
			<th class="subName">잘성일</th>
			<td class="st1"><%=bean.getReg_date() %></td>
		</tr>
		<tr>
			<th class="subName">이메일</th>
			<td colspan="3"><%=bean.getEmail() %></td>
		</tr>
		<tr>
			<th class="subName">제목</th>
			<td colspan="3"><%=bean.getSubject() %></td>
		</tr>
		<tr>
			<th class="subName">내용</th>
			<td colspan="3"><%=bean.getContent() %></td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4" class="end">
				<button onclick="location.href='D01BoardReWriteForm.jsp?num=<%=bean.getNum() %>&ref=<%=bean.getRef() %>&re_step=<%=bean.getRe_step() %>&re_level=<%=bean.getRe_level() %>'">답글쓰기</button>
				<button onclick="location.href='E01BoardUpdateForm.jsp?num=<%=bean.getNum() %>'">수정하기</button>
				<button onclick="location.href='F01BoardDeleteForm.jsp?num=<%=bean.getNum() %>'">삭제하기</button>
				<button onclick="location.href='B01BoardList.jsp'">전체목록</button>
			</td>
		</tr>
	</tfoot>
</table>
</body>
</html>