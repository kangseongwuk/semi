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
		margin-left:50%;
		margin-top:10%;
		position:relative;
	}
	.tjfaud{
		position: absolute;
		
		color: white;
		
	}
</style>
</head>
<body>

<% String id = (String)session.getAttribute("id");


	movieDAO mdao = new movieDAO();

	Vector<movieBean> vec = mdao.allselectMovie();
	
	for(int i=0; i < vec.size(); i++){
		
		movieBean mBean = vec.get(i);
%>





<div class="poster">
        <img id="box1" src="<%=mBean.getPoster() %>"/>
	<div class="tjfaud">
	    <p id="box2">제목:<%=mBean.getTitle()%>,장르:<%=mBean.getGenre()%>국내외:<%=mBean.getCountry()%>,런타임<%=mBean.getRuntime() %></p>
	</div>
</div>
<%} %>
</body>
</html>