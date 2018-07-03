<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body {
		font-family: "돋움";
	}
	table {
		width: 600px;
		margin: 0 auto;
	}
	table, tr, th, td {
		border: 1px solid black;
	}
	.mainName {
		padding: 10px;
	}
	.subName {
		width: 110px;
		padding: 5px;
	}
	.st1 {
		width: 150px;
		padding: 5px;
		text-align: center;
	}
	.control {
		width: 450px;
	}
	.end {
		padding: 5px;
		text-align: center;
	}
</style>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num").trim());

	BoardDAO bdao = new BoardDAO();
	
	// 조회수 증가 없이 하나의 게시글을 리턴받음
	BoardBean bean = bdao.getOneUpdateBoard(num);
%>

<form action="F02BoardDeleteProc.jsp" method="post">
<table>
	<thead>
		<tr>
			<th class="mainName" colspan="4">글삭제</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th class="subName">작성자</th>
			<td class="st1"><%=bean.getWriter() %></td>
			<th class="subName">작성일</th>
			<td class="st1"><%=bean.getReg_date() %></td>
		</tr>
		<tr>
			<th class="subName">제목</th>
			<td colspan="3"><%=bean.getSubject() %></td>
		</tr>
		<tr>
			<th class="subName">비밀번호</th>
			<td colspan="3">
				<input type="password" name="password" class="control">
			</td>
		</tr>
		<tr>
			<th class="subName">글내용</th>
			<td colspan="3"><%=bean.getContent() %></td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td class="end" colspan="4">
				<input type="hidden" name="num" value="<%=bean.getNum() %>">
				<input type="submit" value="글삭제">&nbsp;&nbsp;
				<button type="button" onclick="location.href='B01BoardList.jsp'">글목록보기</button>
			</td>
		</tr>
	</tfoot>
</table>
</form>

</body>
</html>