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
	String title = request.getParameter("title");

	rewordDAO rdao = new rewordDAO();
	rdao.reworddelete(id, title);
	
	 //response.sendRedirect("main.jsp?center=movieDetail.jsp?mno=" +request.getParameter("mno")); 
	response.getWriter().print("<script>alert('댓글삭제성공'); location.href ='main.jsp</script>");
%>	  
		<%-- <script>
   			location.href='main.jsp?center=movieDetail.jsp?mno=<%=mno%>'   				
	   </script> --%>
	

</body>
</html>