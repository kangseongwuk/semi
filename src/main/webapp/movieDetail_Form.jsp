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
/* @import url("css/bootstrap.css"); */
/* 
a, a:hover {
      color:#000000;
      text-decoration:none;} */
table {
   border-collapse : collapse;
   border-spacing : 0;
   color:white;
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
    font-size: 40px; /* 별 크기 */
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
#aaaa{
float:left;
width:1200px;
}
#bbbb{
float:left;
	display: inline-block;
}
#cccc{
float:right;
	display: inline-block;
}
</style>
</head>
<body>

<%

   request.setCharacterEncoding("UTF-8");
   String id = (String) session.getAttribute("id");

   String mno = request.getParameter("mno");
   String title = request.getParameter("title");
   //int id = Integer.parseInt(id1);
   /* int rno = Integer.parseInt(request.getParameter("rno")); */ 
	   

   rewordDAO rdao = new rewordDAO();
   
   //아임무비 평점 구하기
   rewordBean rBean2 = rdao.getGrade_avg(mno);
   
   Vector<rewordBean> rvector = rdao.rewordRnoSelect(mno);

   movieDAO mdao = new movieDAO();
   movieBean mBean = mdao.oneselectMovie(mno);
   
%>

<!-- movieDAO 랑 rewordDAO 추가가 필요하며, movie테이블의 url칼럼도 필요함. -->

<h2 align="center">영화정보 상세 보기</h2>
<div id="aaaa">
<div id="bbbb"align="center">
      
   <table class="table table-striped" border="1" style="text-align: center; width: 100%;">
      <tr align="center" style="height: 40;">
         <td width="100">영화제목</td>
         <td ><%=mBean.getTitle() %></td>
         <td width="200">장르</td>
         <td ><%=mBean.getGenre() %></td>
      </tr>
      <tr align="center" style="height: 40;">
         <td width="100">상영시간</td>
         <td ><%=mBean.getRuntime() %></td>
         <td width="100">개봉일</td>
         <td ><%=mBean.getOpendate() %></td>
      </tr>      
      <tr>
         <td width="100">감독 및 출연진</td>
         <td colspan="3"  style="padding-right: 230px;"><%=mBean.getDirector() %>,<%=mBean.getActor() %></td>
      </tr>   
      <tr>
         <td width="100">줄거리</td>   
         <td colspan="3"><%=mBean.getStory() %></td>
      </tr>
 
      <tr>
         <td width="100">아임무비 평점</td>
         <td colspan="3"  style="padding-right: 230px;"><%=rBean2.getGrade_avg() %></td>
      </tr>   
      
      <table class="table table-hover" border="1" align="center" >
      <tr align="center" style="height: 40;">
         <td width="30%">평점</td>
         <td>한줄평</td>
      </tr>

<%
      for(int i=0; i < rvector.size(); i++){
         
         rewordBean rBean3 = rvector.get(i);      
%>
      <tr height="40" align="center">
         <td>
            <%=rBean3.getGrade() %>
         </td>
         <td>
            <%=rBean3.getWriting() %>
         </td>
      </tr>
      <%} %>   
</table>
      
      <tr style="height: 40; ">
         <td colspan="4">
            <button onclick="location.href='main.jsp?center=rewordinsert.jsp?mno=<%=mBean.getMno()%>'" class="btn btn-light">댓글쓰기</button>&nbsp;&nbsp;
            <button onclick="location.href='main.jsp?center=rewordUpdate.jsp?mno=<%=mBean.getMno() %>'" class="btn btn-light">수정하기</button>&nbsp;&nbsp;
            <button onclick="location.href='main.jsp?center=rewordDelete.jsp?mno=<%=mBean.getMno() %>'" class="btn btn-light">삭제하기</button>&nbsp;&nbsp;
            <button onclick="location.href='main.jsp'" class="btn btn-light">메인으로</button>
         </td>
      </tr>
   </table>
	<jsp:include page="rewordinsert.jsp"/>
</div>
	<div id="cccc">
         포스터, 좋아요
         <img src= "<%=mBean.getPoster() %>">
      </div>
      </div> 
</body>
</html>