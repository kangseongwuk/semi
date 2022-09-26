<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.boardDAO"%>
<%@ page import="movie.boardBean"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시판</title>

<style type="text/css">
@import url("css/bootstrap.css");

.body{
		color:#000000;
}
a, a:hover {
		color:inherit;
		text-decoration:none;}

</style>
	<script src="jquery-1.12.0.min.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
<body class="body">
<%
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	
	boardDAO bdao = new boardDAO();
	boardBean bBean = bdao.UpdateOneSelectBoard(b_no);
%>
	<h2 align="center">게시판 수정 화면</h2>
	<div align="center">
		<form action="boardUpdatePro.jsp" method="post">
			<table border="1" style="width:50%;; text-align: center;" class="table table-striped">
				<tr style="height: 50px">
					<td width="100">번호</td>
					<td class="form-control"><%=bBean.getb_no() %></td>
				</tr>
				<tr>
					<td width="100">작성자</td>
					<td class="form-control"><%=bBean.getWriter() %></td>
				</tr>
				<tr style="height: 50px">
					<td width="120">비밀번호</td>
					<td class="form-control"><input type="password" name="password" size="30"></td>
				</tr>
				<tr>
					<td width="100">내용</td>
					<td class="form-control" colspan="3"><textarea rows="10" cols="90" name="content"><%=bBean.getContent() %></textarea></td>
				</tr>
				<tr style="height: 50px;">
					<td colspan="4">
					<input type="hidden" name="b_no" value="<%=bBean.getb_no() %>">
						<input type="submit" value="수정완료" class="btn btn-light">&nbsp;&nbsp; 
						<input type="reset" value="수정취소" class="btn btn-light">&nbsp;&nbsp; 
						<input type="button" onclick="location.href='main.jsp?center=boardList.jsp'"value="글목록보기" class="btn btn-light">&nbsp;&nbsp; 
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>
</body>
</html>