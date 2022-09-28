<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.rewordDAO"%>
<%@ page import="movie.rewordBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 정보 삭제 구현</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String id = (String) session.getAttribute("id");
	String mno = request.getParameter("mno");
	int rno = Integer.parseInt(request.getParameter("rno"));
	System.out.println(rno);

	rewordDAO rdao = new rewordDAO();
	rdao.reworddelete(rno);
	
	response.sendRedirect("main.jsp?center=body.jsp");
	
%>
</body>
</html>