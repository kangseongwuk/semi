<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.movieDAO"%>
<%@ page import="movie.movieBean"%>
<%@ page import="java.util.Vector"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 댓글 쓰기(저장)</title>
</head>
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
<body>


<%
	request.setCharacterEncoding("UTF-8");
    String genre = request.getParameter("genre");

	movieDAO mdao = new movieDAO();

	Vector<movieBean> vec = mdao.RandomselectMovie(genre);

	for(int i=0; i < vec.size(); i++){
		
		movieBean mBean3 = vec.get(i);
%>
	   <span class="box2">제목: <%=mBean3.getTitle()%><br>
	    				장르: <%=mBean3.getGenre()%><br>
	    				국내외: <%=mBean3.getCountry()%><br>
	    				런타임: <%=mBean3.getRuntime() %></span>
	    				
      <div  class="box1">
        <a href="main.jsp?center=movieDetail.jsp?mno=<%=mBean3.getMno()%>"><img class="poster"src="<%=mBean3.getPoster() %>" width="300px" height="400px"></a>
	</div>
<%}%>

</body>
</html>
