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
<script type="text/javascript">

/* function popUp(){
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    //$('#mask').css({'width':maskWidth,'height':maskHeight});  

    //애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
    $('.box2').fadeIn(800);      
    $('.box2').fadeTo("slow",0.8);    

    //윈도우 같은 거 띄운다.
    $('.box2').show();
} */

$(document).ready(function(){
	$('.box2').show();
/*     //검은 막 띄우기
    $('.openMask').click(function(e){
        e.preventDefault();
        wrapWindowByMask();
    }); */

     //닫기 버튼을 눌렀을 때
    $('.box2 .close').click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $('box2').hide();  
    });      

    //검은 막을 눌렀을 때
    $('.box2').click(function () {  
        $(this).hide();  
       /*  $('.window').hide();   */
    });      
});

</script>
<style type="text/css">

table {
   color:white;
   
}
</style>
   <style>

	.poster{
		/* position:relative; */
		border-radius: 7px;
		width:300px;
		height: 400px;
	}
	.poster_div{
		min-width: 1300px;
		width:1500px;
}
	.box1{
		border-radius: 7px;
	}
	.box2{
		position: fixed;
		left:15%;
		top:7%;
		display:none;
		background:rgba(0,0,0,0.7);
		color: white;
		width:1500px;
		height: 1050px;
		border-radius: 7px;
		z-index: 3;
	}
    .window{
      display: none;
      position:absolute;  
      left:15%;
      top:10%;
      z-index:10000;
    }	
</style>
</head>
<body>

<%

   request.setCharacterEncoding("UTF-8");
   String id = (String) session.getAttribute("id");

   String mno = request.getParameter("mno");
   String title = request.getParameter("title");

	   

   rewordDAO rdao = new rewordDAO();
   
   //아임무비 평점 구하기
   rewordBean rBean2 = rdao.getGrade_avg(mno);
   
   Vector<rewordBean> rvector = rdao.rewordRnoSelect(mno);

   movieDAO mdao = new movieDAO();
   movieBean mBean1 = mdao.oneselectMovie(mno);
   Vector<movieBean> vec = mdao.allselectMovie(); //모든영화정보
%>
	<div class="box2">
										<h2 align="center">영화정보 상세 보기</h2>
									
									<div id="bbbb"align="center">
									      
									   <table class="table table-striped" border="1" style="text-align: center;color:white; width: 100%;">
									<tr align="center" style="height: 40;">
									<td rowspan="5" colspan="2"><img src= "<%=mBean1.getPoster() %>"></td>
									<td>영화제목</td>
									<td ><%=mBean1.getTitle() %></td>
									<td>장르</td>
									 <td ><%=mBean1.getGenre() %></td>
									</tr>
									<tr align="center">
									<td>상영시간</td>
									<td ><%=mBean1.getRuntime() %></td>
									<td>개봉일</td>
									<td ><%=mBean1.getOpendate() %></td>
									</tr>      
									<tr>
									   <td>감독 및 출연진</td>
									   <td colspan="3"  style="padding-right: 230px;"><%=mBean1.getDirector() %>,<%=mBean1.getActor() %></td>
									</tr>   
									<tr>
									   <td rowspan="1">줄거리</td>   
									   <td colspan="3"><%=mBean1.getStory() %></td>
									</tr>
									</table>
								<jsp:include page="rewordinsert.jsp"/>





									<table>   
									      <tr style="height: 40; ">
									<td colspan="4">
									<button onclick="location.href='main.jsp?center=rewordUpdate.jsp?mno=<%=mBean1.getMno() %>'" class="btn btn-light">수정하기</button>&nbsp;&nbsp;
									<button onclick="location.href='main.jsp?center=rewordDelete.jsp?mno=<%=mBean1.getMno() %>'" class="btn btn-light">삭제하기</button>&nbsp;&nbsp;
									<button class="btn btn-light" class="close" >&nbsp;창닫기&nbsp;&nbsp;</button>
									      </td>
									   </tr>
									</table>
									<table  class="table table-striped" border="1" style="text-align: center;color:white; width: 100%;">
									<tr>
									   <td>아임무비 평점</td>
									   <td colspan="3" align="center"><h3><%=rBean2.getGrade_avg() %></h3></td>
									</tr>   
									<tr align="center" style="height: 40;">
									   <td>평점</td>
									   <td colspan="5">한줄평</td>
									</tr>
									
									<%
									for(int i=0; i < rvector.size(); i++){
									   
									   rewordBean rBean3 = rvector.get(i);      
									%>
									<tr height="40" align="center">
									   <td>
									      <%=rBean3.getGrade() %>
									</td>
									<td colspan="4">
									   <%=rBean3.getWriting() %>
									   </td>
									</tr>
									<%} %>   
									</table>
									
</div>
<%   
	for(int i=0; i < vec.size(); i++){
		movieBean mBean = vec.get(i);
   
%>

<!-- movieDAO 랑 rewordDAO 추가가 필요하며, movie테이블의 url칼럼도 필요함. -->
	</div>
	<div class="poster_div">
 <div class="box1" style="display: inline-block;" >
</div></div>
<a href="main.jsp?center=movieDetail.jsp?mno=<%=mBean.getMno()%>"><img class="poster"src="<%=mBean.getPoster() %>" width="300px" height="400px"></a>
<%} %>
   		<%-- <a href="#" class="openMask"><img class="poster"src="<%=mBean.getPoster() %>" width="300px" height="400px"></a> --%>


<%-- 	    <div class="window">
<jsp:include page="movieDetail.jsp">
	<jsp:param value="<%=mBean1.getMno()%>" name="mno"/></jsp:include>
		</div> --%>


</body>
</html>