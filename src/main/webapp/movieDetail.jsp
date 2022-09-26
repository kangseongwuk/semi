<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.movieDAO"%>
<%@ page import="movie.movieBean"%>     
<%@ page import="movie.rewordDAO"%>
<%@ page import="movie.rewordBean"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>

<style type="text/css">
@import url("css/bootstrap.css");
.body{
	color:#000000;
}
a, a:hover {
		color:inherit;
		text-decoration:none;}
table {
	border-collapse : collapse;
	border-spacing : 0;
}
</style>
	<style>
.rewordform .radio_box{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 별 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}
.rewordform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
.rewordform label{
    font-size: 60px; /* 별 크기 */
    color: transparent; /* 기존 별 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}
.rewordform label:hover{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 */
}
.rewordform label:hover ~ label{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
}
.rewordform radio_box legend{
    text-align: center;
}

.rewordform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
}
</style>
</head>
<body class="body">
<%

	request.setCharacterEncoding("UTF-8");
/* 	String id = (String) session.getAttribute("id"); */
	String mno = request.getParameter("mno");

	int rno = 1; 
	
	movieDAO mdao = new movieDAO();
	movieBean mBean = mdao.oneselectMovie(mno);

	rewordDAO rdao = new rewordDAO();
	rewordBean rBean = rdao.OneSelectreword(rno);
	
	Vector<rewordBean> rvec = new Vector<>();
	 

	
%>

<!-- movieDAO 랑 rewordDAO 추가가 필요하며, movie테이블의 url칼럼도 필요함. -->

<h2 align="center">영화정보 상세 보기</h2>
	<table border="1" style="text-align: center;">
		<tr align="center" style="height: 40;">
			<td class="form-control" width="100">CODE</td>
			<td ><%=mBean.getMno() %></td>
			<td class="form-control" width="100">영화제목</td>
			<td ><%=mBean.getTitle()%></td>
			<td class="form-control" width="200">장르</td>
			<td ><%=mBean.getGenre() %></td>
		</tr>
		<tr align="center" style="height: 40;">
			<td class="form-control" width="100">상영시간</td>
			<td ><%=mBean.getRuntime() %></td>
						<td class="form-control" width="100">개봉일</td>
			<td ><%=mBean.getOpendate() %></td>
		</tr>		
		<tr>
			<td class="form-control" width="100">감독 및 출연진</td>
			<td colspan="3"  style="padding-right: 230px;"><%=mBean.getDirector() %>,<%=mBean.getActor() %></td>
		</tr>	
		<tr>
			<td colspan="4">줄거리</td>	
		</tr>
		<tr>
			<td class="form-control" width="100">포스터, 좋아요</td>
			<td colspan="3"  style="padding-right: 230px;"><img src="<%=mBean.getPoster() %>"></td>
		</tr>	
	</table>
	
	
	
	
		
		<table class="table table-hover" border="1" align="center" >
		<tr align="center" style="height: 40;">
			<td width="50">아임무비 평점</td>
			<td width="50">한줄평</td>
		</tr>

 	<%
		for(int i=0; i < rvec.size(); i++){
			
			rewordBean rbean = rvec.get(i);		
	%>
	<tr height="40" align="center">
		
		<td>
			<a href="main.jsp?center=movieDetailPop.jsp?mno=<%=mBean.getMno()%>" style="text-decoration:none"><%=rBean.getTitle() %></a>
		</td>
		<td>
			<%=rBean.getGrade_avg() %>
		</td>
		<td>
			<%=rBean.getWriting() %>
		</td>
	</tr>
	<%} %>	
		<tr>
			<td colspan="4">
				<button onclick="location.href='main.jsp?center=rewordUpdate.jsp?mno=<%=mBean.getMno() %>'" class="btn btn-light">수정하기</button>&nbsp;&nbsp;
				<button onclick="location.href='main.jsp?center=rewordDelete.jsp?mno=<%=mBean.getMno() %>'" class="btn btn-light">삭제하기</button>&nbsp;&nbsp;
			</td>
		</tr>
	</table>
<form action="rewordinsertPro.jsp" method="post" class="rewordform" id="myform">
 					<div>

						<h4>영화에 대한 코멘트를 남겨주세요!</h4>
						<div>
							<input type="hidden" name="mno" value="<%=rBean.getMno() %>">
							<input type="hidden" name="title" value="<%=rBean.getTitle() %>">
						</div>
						
					    <div class="radio_box">
					        <!-- <legend>별점</legend> -->
							<input type="radio" name="grade" value="5" id="star1"><label for="star1">☆</label> 
							<input type="radio" name="grade" value="4" id="star2"><label for="star2">☆</label> 
							<input type="radio" name="grade" value="3" id="star3"><label for="star3">☆</label>
							<input type="radio" name="grade" value="2" id="star4"><label for="star4">☆</label> 
							<input type="radio" name="grade" value="1" id="star5"><label for="star5">☆</label>
						</div>
						    
						
						<br>
						
						<div>
							<textarea name="writing" placeholder="영화는 어떠셨나요?" rows="4" style="width:500px;"></textarea>
						</div>
						<br>
						
						<div>
							<button type="submit">입력</button>
							<button type="reset">취소</button>
						</div>
					</div>
						<!-- <legend>별점 선택</legend> -->
	</form>
</body>
</html>