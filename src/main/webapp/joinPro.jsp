<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="movie.peopleDAO" %>  
<%@ page import="movie.peopleBean" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 처리 구현</title>
</head>
<body>
<!-- 예외처리로 아이디중복 처리 경고창 만들기 -->
<%
	request.setCharacterEncoding("UTF-8");

	String genre[] = request.getParameterValues("genre");
	String textgenre  = "";
	
	for(int i=0; i < genre.length; i++){
		textgenre += genre[i] + ", ";
	}
	
%>
	<jsp:useBean id="pBean" class="movie.peopleBean">
		<jsp:setProperty name="pBean" property="*"/>
	</jsp:useBean>

<%	
	pBean.setGenre(textgenre);

	
	//데이터베이스 클래스에 대한 객체 생성
	peopleDAO pdao = new peopleDAO();	
	pdao.insertpeople(pBean);
%>
	<script type="text/javascript">
		alert("축하합니다! 로그인해주세요.");
	</script>
	
<%	
	//메인화면으로 이동
	response.getWriter().print("<script>alert('회원가입성공 로그인해주세요.'); location.href = 'main.jsp';</script>");
	/* response.sendRedirect("main.jsp"); */
%>	

	
</body>
</html>