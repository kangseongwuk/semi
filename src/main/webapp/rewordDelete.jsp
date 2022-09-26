<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.rewordDAO"%>
<%@ page import="movie.rewordBean"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url("css/bootstrap.css");

a, a:hover {
		color:#000000;
		text-decoration:none;}

</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="jquery-1.12.0.min.js"></script>
	<script src="js/bootstrap.js"></script>
<meta charset="UTF-8">
<title>리뷰 삭제</title>
</head>
<body style="margin-top:100px">
	<%
	request.setCharacterEncoding("UTF-8");
	
	//int id = Integer.parseInt(request.getParameter("id"));
	
	String rno1 = "3";//request.getParameter("id");
	int rno = Integer.parseInt(rno1);
	
	rewordDAO rdao = new rewordDAO();
	rewordBean rBean = rdao.OneSelectreword(rno);
%>

	<h2 align="center">리뷰 삭제</h2><br>
	<div align="center">
		<form action="rewordDeletePro.jsp" method="post">
			<input type="hidden" name="rno" value="<%=rBean.getRno() %>">
			<input type="submit" class="btn btn-light" value="삭제완료">&nbsp;&nbsp;
			<input type="button" onclick="location.href='main.jsp?center=movieDetail.jsp?mno=<%=rBean.getMno() %>'"value="영화상세보기" class="btn btn-light">&nbsp;&nbsp;
		</form>
		</div>
</body>
</html>