<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.boardDAO"%>
<%@ page import="movie.boardBean"%>
<%@ page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url("dummy/board.css");
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");

	if(pageNum == null){
		pageNum = "1";
	}

	int count = 0;//전체글의 갯수 저장
	int number = 0;//페이지 넘버링 변수

	int currentPage = Integer.parseInt(pageNum);//현재 페이지 저장
	
	boardDAO bdao = new boardDAO();	
	count = bdao.getAllcount();//전체 게시글의 숫자를 파악하여 저장
	
	//현재 페이지에 보여줄 시작번호 설정과 끝 페이지를 설정합니다.
	//데이터베이스에서 불러올 시작번호 : 1
	int startRow = (currentPage - 1) * pageSize + 1;// (1-1)*10+1 = 0*10 = 0 + 1 = 1
	int endRow = currentPage * pageSize;// 1*10 = 10
	
	Vector<boardBean> vec = bdao.allselectBoard(startRow, endRow);
	
	number = count - (currentPage - 1) * pageSize;//테이블에 표시할 번호 설정, 139 - (1 - 1) * 10 = 139
%>
	<h2 align="center">게시판 목록 보기 화면</h2>
	<div class="container">
		<table class="table">
			<th class="header__item"><a id="tb_no" class="filter__link" href="#">번호</a></th>
			<th class="header__item"><a id="tsubject" class="filter__link filter__link--number" href="#">제목</a></th>
			<th class="header__item"><a id="twriter" class="filter__link filter__link--number" href="#">작성자</a></th>
			<th class="header__item"><a id="tdate" class="filter__link filter__link--number" href="#">작성일자</a></th>
			<th class="header__item"><a id="treadcount" class="filter__link filter__link--number" href="#">조회수</a></th>
			<%
				for(int i=0; i < vec.size(); i++){
					
					boardBean bBean = vec.get(i);		
			%>
			<tr class="table-content">
					<td><%=number--%></td>
					<td>
						<a href="main.jsp?center=boardDetail.jsp?b_no=<%=bBean.getb_no()%>" style="text-decoration:none">
						<%
						//들여쓰기
						if(bBean.getRe_step() > 1){
							for(int k=0; k < (bBean.getRe_step() - 1) * 3; k++){
								%>&nbsp;
						<%
							}
						}
						%>
						<%=bBean.getSubject() %></a></td>
					<td><%=bBean.getWriter() %></td>
					<td><%=bBean.getReg_date() %></td>
					<td><%=bBean.getReadCount() %></td>
			</tr>
			<%} %>	
		</table>
	</div>
	<table align="center">
		<tr>
			<td>
				<input type="button" value="글쓰기" onclick="location.href='main.jsp?center=boardwrite.jsp'"/>&nbsp;&nbsp;				
				<button onclick="location.href='main.jsp'">메인</button>
			</td>	
		</tr>
	</table>
	<p align="center">
	<!-- 페이지 카운터링 작성 부분 -->
	
	<%
		if(count > 0){
			//               139   /    10    + (139 % 10 )
			int pagecount = count  / pageSize + (count % pageSize == 0 ? 0 : 1);// 139 / 10 + 1 = 13 + 1 = 14
			
			int startPage = 1;
			
			if(currentPage % 10 != 0){
				startPage = (currentPage / 10) * 10 + 1; // (1 / 10) * 10 + 1 = 0 * 10 = 0 + 1 = 1
			}else{
				startPage = (currentPage / 10) * 10 - 1; //
			}
			
			int pageBlock = 10;//[1]......[10]
			
			int endPage = startPage + pageBlock - 1;// 1 + 10 - 1 = 11 - 1 = 10 
					
			//[이전]링크를 만드는 부분
			if(endPage > pagecount){ // 10 > 139
				endPage = pagecount;
			}
			
			if(startPage > 10){
	%>	
		<a href="boardList.jsp?pageNum=<%=startPage - 10 %>">[previous]</a>
	<%
		}
			for(int i = startPage; i <= endPage; i++){
	%>
		<a href="boardList.jsp?pageNum=<%=i %>">[<%=i %>]</a>
	<%	
		}

		//[다음]링크를 만드는 부분		
		if(endPage < pagecount){
	%>		
		<a href="boardList.jsp?pageNum=<%=startPage + 10 %>">[next]</a>
	<%
		}		
	}
	%>
	</p>	
	
</body>
</html>