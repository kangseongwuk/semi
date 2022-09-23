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
			  $("#box2").hide();
		$("#box1").hover(function() {
			  $("#box2").toggle();
			});
	});
</script>
<meta charset="UTF-8">
<title>body</title>
<style type="text/css">

	.poster{
		margin-top:10%;
		/* position:relative; */
	}
	#box2{
		position: absolute;
		display:block;
		maring-right:200px;
		background:rgba(0,0,0,0.5);
		color: white;
		width:143px;
		height: 139px;
		border-radius: 7px;
	/* 	padding-left:10%;
		padding-top:19%; */
	}
	#box1{
		border-radius: 7px;
	}
</style>
</head>
<body>
<div class="poster">
<% String id = (String)session.getAttribute("id");


	movieDAO mdao = new movieDAO();

	Vector<movieBean> vec = mdao.allselectMovie();
	
	for(int i=0; i < vec.size(); i++){
		
		movieBean mBean = vec.get(i);
%>
	    <span id="box2">제목:<%=mBean.getTitle()%><br>
	    				장르:<%=mBean.getGenre()%><br>
	    				국내외:<%=mBean.getCountry()%><br>
	    				런타임<%=mBean.getRuntime() %></span>
	
        <img id="box1" src="<%=mBean.getPoster() %>"/>
<%} %>
</div>
</body>
</html>