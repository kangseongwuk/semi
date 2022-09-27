<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.movieDAO"%>
<%@ page import="movie.movieBean"%>
<%@ page import="java.util.Vector"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
/* 	$(document).ready(function(){
			  $(".box2").hide();
		$(".box1").hover(function() {
			  $(".box2").toggle();
			});
	}); */
      function popUpLayer(){
	        //document.getElementById("PopUp").style.display='inline'
		        //만일 Pop라는 녀석이 닫혀있다면??
		        if(document.getElementById("PopUp").style.display=="none"){
		           //열어주어라
		           document.getElementById("PopUp").style.display='inline'
				}else{
		        	//그렇지 않은 모든 경우라면??
		           //닫아주어라
		           document.getElementById("PopUp").style.display='none'
		}
     }
/* 	$(document).ready(function(){
		$(document).keydown(function(e)){
			if ( e.keyCode ==27 || e.which ==27)
				$("#popUp").css('display','none');
		});
	}); */
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
</style>
</head>
<body>
<div>
<% String id = (String)session.getAttribute("id");


	movieDAO mdao = new movieDAO();

	Vector<movieBean> vec = mdao.allselectMovie();
	
	for(int i=0; i < vec.size(); i++){
		
		movieBean mBean = vec.get(i);
%>
<%-- 	<div class="box2">
	    <span>제목:<%=mBean.getTitle()%><br>
	    				장르:<%=mBean.getGenre()%><br>
	    				국내외:<%=mBean.getCountry()%><br>
	    				런타임<%=mBean.getRuntime() %></span>
	</div> --%>
	<div  class="box1">
     <%--  <a href="javascript:popUpLayer();"><img class="poster"src="<%=mBean.getPoster() %>" width="300px" height="400px"></a> --%>
<a href="main.jsp?center=movieDetail.jsp?mno=<%=mBean.getMno()%>"><img class="poster"src="<%=mBean.getPoster() %>" width="300px" height="400px"></a>
	</div>
        <Div id="PopUp" style="position:absolute; left:20%; top:10%;z-index:1;display:none;text-align: center;">
        	
        	<%-- <jsp:include page="movieDetail.jsp?mno=<%=mBean.getMno()%>"/> --%>
<!--         	<script type="text/javascript">
        		location.href("https://www.naver.com");
        	</script> -->
        	
        </Div>
<%} %>
</div>
</body>
</html>