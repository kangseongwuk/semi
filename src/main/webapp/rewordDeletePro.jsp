<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.rewordDAO"%>
<%@ page import="movie.rewordBean"%>
<%	request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 정보 삭제 구현</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>

		<jsp:useBean id="rBean" class="movie.rewordBean">
			<jsp:setProperty name="rBean" property="*"/>
		</jsp:useBean>
<%
	
	int rno = Integer.parseInt(request.getParameter("rno"));

	rewordDAO rdao = new rewordDAO();
	rdao.reworddelete(rno);
	
	//response.sendRedirect("main.jsp?center=movieDetail.jsp?mno=rBean.getMno() ");
	
%>
</body>
</html>