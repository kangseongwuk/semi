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
	$(document).ready(function(){
			  $(".box2").hide();
		$(".box1").hover(function() {
			  $(".box2").toggle();
			});
	});
</script>
<meta charset="UTF-8">
<title>body</title>
<style type="text/css">

	.poster{
		margin-top:10%;
		margin-left:20%
		/* position:relative; */
	}
	.box2{
		position: absolute;
		display:inline-block;
		maring-right:200px;
		background:rgba(0,0,0,0.5);
		color: white;
		width:300px;
		height: 400px;
		border-radius: 7px;
	/* 	padding-left:10%;
		padding-top:19%; */
	}
	.box1{
		border-radius: 7px;
		width:300px;
		height: 400px;
	}
	
	.select{
	 position: absolute;
		display:inline-block;
	
	
	
	
	}

	
	
	
</style>
</head>
<body>

<%-- <% String Genre = (String)session.getAttribute("Genre");
   String Poster = (String)session.getAttribute("Poster");

	movieDAO mdao = new movieDAO();

	Vector<movieBean> vec = mdao.RandomselectMovie(Genre);
	
	for(int i=0; i < vec.size(); i++){
		
		movieBean mBean = vec.get(i);
		
		%> --%>
		 <form action="randomPro.jsp" method="get">
	  <div class ="select">
	  <select class="selectbox" id="selectbox" name="Genre" onchange="chageLangSelect()">
        <option value="" selected disabled>장르 선택</option>              
        <option value="액션">액션</option>
        <option value="애니메이션">애니메이션</option>
        <option value="드라마">드라마</option>
        <option value="코미디">코미디</option>
        <option value="공포">공포</option>
        <option value="뮤지컬">뮤지컬</option>
      </select>
      	<!-- <input type="submit" value="asdf"> -->
       <button type="submit" onclick="location.href='main.jsp?center=randomPro.jsp'">선택</button>
       </div>
</form>

</body>
</html>
