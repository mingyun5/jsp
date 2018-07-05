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
	
	#pagecount {
		text-align: center;
	}
</style>
</head>
<body>
<%
////////// 카운터링 - Start
	// 게시글을 설정한 만큼 가져와서 화면에 출력하는 부분
	
	////////////////////////////////////////////////////////////////////////////
	// 화면에 출력될 게시글의 개수
	int pageSize = 10;
	////////////////////////////////////////////////////////////////////////////

	// 사용자가 클릭한 페이지의 번호값(카운터링 번호값)
	String pageNum = request.getParameter("pageNum");
	// 만일, 처음 진입 또는 수정/삭제/글쓰기/답글쓰기 등에서 호출되는 경우 -> 널처리 필요
	if(pageNum == null) {
		pageNum = "1";
	}
	// 현재 보려고 하는 페이지의 숫자(카운터링 번호값)
	int currentPage = Integer.parseInt(pageNum);
	
	// 전체 게시글의 개수를 저장
	int count = 0;
	
	// 페이지에 표시되는 첫번째 글의 글번호를 저장
	int number = 0;
	
	// 전체 게시글의 개수를 가져옴
	BoardDAO bdao = new BoardDAO();
	count = bdao.getAllCount(); 

	// 현재 페이지에 보여줄 시작글 순서
	int startRow = (currentPage - 1) * pageSize + 1;
	// 현재 페이지에 보여줄 마지막글 순서
	int endRow = currentPage * pageSize;
	
	// 화면에 출력될 게시글 개수 만큼만 리턴 받음
	Vector<BoardBean> vec = bdao.getAllBoard(startRow, endRow); 

	// 페이지에 표시할 첫번재 글번호를 지정
	number = count - (currentPage - 1) * pageSize;

//////////카운터링 - End

	// 카운터링 구현 이전에 사용한 전체 게시글 가져오는 로직
	// Vector<BoardBean> vec = bdao.getAllBoard();
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
				<%-- 카운터링 이전의 글번호 출력
					<%=i + 1 %>
				 --%>
				 
			 <!-- 카운터링 - Start -->
				 <%=number-- %>
			 <!-- 카운터링 - End -->
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
					if(bean.getDel_flag().equals("Y")) {
				%>
						삭제된 글입니다.
				<%		
					} else {
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

<!-- 카운터링 - Start -->
<p id="pagecount">
<%
	if(count > 0) {
		////////////////////////////////////////////////////////////////////////////
		// 화면에 출력될 카운터링 개수 -> 설정에 따라 카운터의 개수가 달라짐
		int pageBlock = 5;
		////////////////////////////////////////////////////////////////////////////
		
		// 카운터링의 전체 개수
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		// 화면에 출력될 시작 카운터링 숫자 설정
		int startPage = 1;
		if(currentPage % pageBlock != 0) {
			startPage = (int)(currentPage / pageBlock) * pageBlock + 1;
		} else {
			startPage = ((int)(currentPage / pageBlock) -1) * pageBlock + 1;
		}
		
		// 화면에 출력될 마지막 카운터링 숫자 설정
		int endPage = startPage + pageBlock - 1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
	

		// "이전"이라는 링크를 만들어야 할지 파악 및 출력
		if(startPage > pageBlock) {
%>
			<a href="B01BoardList.jsp?pageNum=<%=startPage-pageBlock %>">[이전]</a>
<%		
		}
		
		// 카운터링 출력
		for(int i = startPage; i <= endPage; i++) {
%>			
			<a href="B01BoardList.jsp?pageNum=<%=i %>">[<%=i %>]</a>
<%			
		}
		
		// "다음"이라는 링크를 만들어야 할지 파악 및 출력
		if(endPage < pageCount) {
%>
			<a href="B01BoardList.jsp?pageNum=<%=startPage+pageBlock %>">[다음]</a>
<%			
		}
	}
%>
</p>
<!-- 카운터링 - End -->

</body>
</html>



















