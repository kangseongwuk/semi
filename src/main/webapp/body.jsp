<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.movieDAO"%>
<%@ page import="movie.movieBean"%>
<%@ page import="movie.rewordDAO"%>
<%@ page import="movie.rewordBean"%>
<%@ page import="java.util.Vector"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

function wrapWindowByMask(){
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('#mask').css({'width':maskWidth,'height':maskHeight});  

    //애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
    $('#mask').fadeIn(1000);      
    $('#mask').fadeTo("slow",0.8);    

    //윈도우 같은 거 띄운다.
    $('.window').show();
}

$(document).ready(function(){
    //검은 막 띄우기
    $('.openMask').click(function(e){
        e.preventDefault();
        wrapWindowByMask();
    });

    //닫기 버튼을 눌렀을 때
    $('.window .close').click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $('#mask, .window').hide();  
    });       

    //검은 막을 눌렀을 때
    $('#mask').click(function () {  
        $(this).hide();  
        $('.window').hide();  
    });      
});

</script>

<meta charset="UTF-8">
<title>body</title>
<style type="text/css">

	.poster{
		/* position:relative; */
		border-radius: 7px;
		width:300px;
		height: 400px;
	}
	.box1{
		border-radius: 7px;
		display:inline-block;
		width:300px;
		height: 400px;
	}
	.box2{
		position: absolute;
		display:inline-block;
		background:rgba(0,0,0,0.5);
		color: white;
		width:300px;
		height: 400px;
		border-radius: 7px;
	}
	#PopUp{
		background:rgba(0,0,0,0.8);
		color: white;
		width: 70%;
		height: 100%;
		border-radius: 10px;
	}
	#mask {  
      position:absolute;  
      z-index:9000;  
      background-color:#000;  
      display:none;  
      left:0;
      top:0;
    }
    .window{
      display: none;
      position:absolute;  
      left:15%;
      top:10%;
      z-index:10000;
    }
    
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
String id = (String)session.getAttribute("id");
String mno = null;



	movieDAO mdao = new movieDAO(); //영화정보
	Vector<movieBean> vec = mdao.allselectMovie(); //모든영화정보
	
	for(int i=0; i < vec.size(); i++){
		
		movieBean mBean = vec.get(i);
%>

        <div id="mask"></div>
        <a href="main.jsp?center=movieDetail.jsp?mno=<%=mBean.getMno()%>" class="openMask"><img class="poster"src="<%=mBean.getPoster() %>" width="300px" height="400px"></a>
   		<a href="#" class="openMask" onclick="location.href='main.jsp?center=body.jsp?mno=<%=mBean.getMno()%>'"><img class="poster"src="<%=mBean.getPoster() %>" width="300px" height="400px"></a>



<%} %>
	    <div class="window">
											    <h2 align="center" style="color:white">영화정보 상세 보기</h2>
										<div id="aaaa">
										<div id="bbbb"align="center">
<%
//아임무비 평점 구하기
		rewordDAO rdao = new rewordDAO(); //댓글정보
		rewordBean rBean2 = rdao.getGrade_avg(mno);
	Vector<rewordBean> rvector = rdao.rewordRnoSelect(mno);
	
		movieBean mBean1 = mdao.oneselectMovie(mno);
%> 

 	     
										      
										   <table class="table table-striped" border="1" style="text-align: center; width: 100%;color:white;">
										      <tr align="center" style="height: 40;">
										         <td width="100">영화제목</td>
										         <td ><%=mBean1.getTitle() %></td>
										         <td width="200">장르</td>
										         <td ><%=mBean1.getGenre() %></td>
										      </tr>
									      <tr align="center" style="height: 40;">
										         <td width="100">상영시간</td>
										         <td ><%=mBean1.getRuntime() %></td>
										         <td width="100">개봉일</td>
										         <td ><%=mBean1.getOpendate() %></td>
										      </tr>      
										      <tr>
										         <td width="100">감독 및 출연진</td>
										         <td colspan="3"  style="padding-right: 230px;"><%=mBean1.getDirector() %>,<%=mBean1.getActor() %></td>
										      </tr>   
										      <tr>
										         <td width="100">줄거리</td>   
										         <td colspan="3"><%=mBean1.getStory() %></td>
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
<%		for(int j=0; j < rvector.size(); j++){
         
        rewordBean rBean3 = rvector.get(j); 									        
%>										
										      <tr height="40" align="center">
										         <td>
										            <%=rBean3.getGrade() %>
										         </td>
										         <td>
										            <%=rBean3.getWriting() %>
										         </td>
										      </tr>
										</table>
										      
										      <tr style="height: 40; ">
										         <td colspan="4">
										            <button onclick="location.href='main.jsp?center=rewordinsert.jsp?mno=<%=mBean1.getMno()%>'" class="btn btn-light">댓글쓰기</button>&nbsp;&nbsp;
										            <button onclick="location.href='main.jsp?center=rewordUpdate.jsp?mno=<%=mBean1.getMno() %>'" class="btn btn-light">수정하기</button>&nbsp;&nbsp;
										            <button onclick="location.href='main.jsp?center=rewordDelete.jsp?mno=<%=mBean1.getMno() %>'" class="btn btn-light">삭제하기</button>&nbsp;&nbsp;
										            <button onclick="location.href='main.jsp'" class="btn btn-light">메인으로</button>
										         </td>
										      </tr>
										   </table>
											<jsp:include page="rewordinsert.jsp"/>
										</div>
											<div id="cccc">
										         포스터, 좋아요
										         <img src= "<%=mBean1.getPoster() %>">
										      </div>
<%} %>
</div></div>
</body>
</html>