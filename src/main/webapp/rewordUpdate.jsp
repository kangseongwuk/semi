<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.rewordDAO"%>
<%@ page import="movie.rewordBean"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시판</title>

<style type="text/css">
@import url("css/bootstrap.css");

a, a:hover {
		color:#000000;
		text-decoration:none;}

</style>
	<script src="jquery-1.12.0.min.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
<body style="margin-top: 100px;">
<%
	request.setCharacterEncoding("UTF-8");

	String Mno = "1";
	String Title = "1";
	String id1 = "1";//request.getParameter("id");
	int id = Integer.parseInt(id1);
	
	rewordDAO rdao = new rewordDAO();
	rewordBean rBean = rdao.OneSelectreword(id);
%>
	<h2 align="center">게시판 수정 화면</h2>
	<div align="center">
		<form action="rewordUpdatePro.jsp" method="post">
				<div>
					<input type="radio" name="grade" value="5" id="5"><label for="5">☆</label> 
					<input type="radio" name="grade" value="4" id="4"><label for="4">☆</label> 
					<input type="radio" name="grade" value="3" id="3"><label for="3">☆</label>
					<input type="radio" name="grade" value="2" id="2"><label for="2">☆</label> 
					<input type="radio" name="grade" value="1" id="1"><label for="1">☆</label>
				</div>
				<div>		
					<textarea name="writing" placeholder="영화는 어떠셨나요?" rows="4" style="width:500px;"></textarea>
				</div>
				<div>	
					<input type="hidden" name="rno" value="<%=rBean.getRno() %>">
					<input type="submit" value="수정완료" class="btn btn-light">&nbsp;&nbsp; 
					<input type="reset" value="수정취소" class="btn btn-light">&nbsp;&nbsp; 
					<input type="button" onclick="location.href='main.jsp?center=movieDetail.jsp?mno=<%=rBean.getMno() %>'"value="영화상세보기" class="btn btn-light">&nbsp;&nbsp;
				</div>		 
		</form>
	</div>

</body>
</html>
</body>
</html>