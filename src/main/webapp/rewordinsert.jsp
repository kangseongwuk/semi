<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="movie.rewordDAO" %>  
<%@ page import="movie.rewordBean" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>

</head>
<body style="width:50%">

<%

	request.setCharacterEncoding("UTF-8");

	String mno = "23138";
	String title = "죽어도 좋은 경험";
	String id1 = "1";//request.getParameter("id");
	int id = Integer.parseInt(id1);
	int rno = 1;

	rewordDAO rdao = new rewordDAO();
	rewordBean rbean = rdao.OneSelectreword(rno);
%>
	<form action="rewordinsertPro.jsp" method="post">
					<div class="reword-box">

						<h4>영화에 대한 코멘트를 남겨주세요!</h4>
						<div>
							<input type="hidden" name="mno" value="<%=rbean.getMno() %>">
							<input type="hidden" name="title" value="<%=rbean.getTitle() %>">
						</div>
						<div class="grade">
							<input type="radio" name="grade" value="5" id="5"><label for="5">☆</label> 
							<input type="radio" name="grade" value="4" id="4"><label for="4">☆</label> 
							<input type="radio" name="grade" value="3" id="3"><label for="3">☆</label>
							<input type="radio" name="grade" value="2" id="2"><label for="2">☆</label> 
							<input type="radio" name="grade" value="1" id="1"><label for="1">☆</label>
						</div>
						<br>
						
						<div>
							<textarea name="writing" placeholder="영화는 어떠셨나요?" rows="4" style="width:500px;"></textarea>
						</div>
						<br>
						
						<div>
							<button type="submit">입력</button>
							<button type="reset">취소</button>
						</div>
					</div>
	</form>
</body>
</html>