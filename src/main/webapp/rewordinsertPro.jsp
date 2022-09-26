<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>  
<%@ page import="movie.rewordDAO"%>
<%@ page import="movie.rewordBean"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글저장</title>
</head>
<body>
	<jsp:useBean id="rbean" class="movie.rewordBean">
		<jsp:setProperty name="rbean" property="*"/>
	</jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");

	String s_grade = request.getParameter("grade");
	int grade = Integer.parseInt(s_grade);
	
	rewordDAO rdao = new rewordDAO();
	rdao.rewordinsert(rbean);
	
	response.sendRedirect("main.jsp?center=movieDetail.jsp?mno=mBean.getMno() ");
	
%>
</body>
</html>