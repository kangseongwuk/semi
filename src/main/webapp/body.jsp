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
        <a href="main.jsp?center=movieDetail.jsp?mno=<%=mBean.getMno()%>"><img class="poster"src="<%=mBean.getPoster() %>" width="300px" height="400px"></a>
	</div>
<%} %>
</div>
</body>
</html>