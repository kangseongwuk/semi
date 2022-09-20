<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session login process</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	session.setAttribute("id", id);
	session.setAttribute("pw", pw);
	
	session.setMaxInactiveInterval(60*60*24*365);
	
	response.sendRedirect("main.jsp");

%>
</body>
</html>