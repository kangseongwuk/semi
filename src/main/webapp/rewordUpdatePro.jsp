<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.rewordDAO"%>
<%@ page import="movie.rewordBean"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 댓글 쓰기(저장)</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rbean" class="movie.rewordBean">
		<jsp:setProperty name="rbean" property="*"/></jsp:useBean>
	
<%
	
	String mno = request.getParameter("mno");
	int rno = Integer.parseInt(request.getParameter("rno"));


	rewordDAO rdao = new rewordDAO();
	rdao.rewordupdate(rbean);
	
	//response.sendRedirect("main.jsp?center=movieDetail.jsp?mno="+request.getParameter("mno"));
	response.sendRedirect("main.jsp?center=body.jsp?mno=");
%>		
</body>
</html>