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
<%
   String title = request.getParameter("title");

	movieDAO mdao = new movieDAO();

	Vector<movieBean> vec = mdao.searchselectMovie(title);
	
	for(int j=0; j < vec.size(); j++){
		
		movieBean mBean = vec.get(j);
%>
	   <span class="box2">제목: <%=mBean.getTitle()%><br>
	    				장르: <%=mBean.getGenre()%><br>
	    				국내외: <%=mBean.getCountry()%><br>
	    				런타임: <%=mBean.getRuntime() %></span>
	    				
        <img class="box1" src="<%=mBean.getPoster() %>">
        
<%}
	
	%>
</div>
</body>
</html>