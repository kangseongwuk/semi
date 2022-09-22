<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>댓글 쓰기</title>

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
	<h2 align="center">댓글 쓰기</h2>
<%
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = Integer.parseInt(request.getParameter("re_level"));
%>
<div align="center">
	<form action="boardRewritePro.jsp" method="post"> 
		<table border="1" style="width: 800px; text-align: center;" class="table table-striped">
			<tr style="height: 50px">
				<td width="100">작성자</td>
				<td class="form-control"><input type="text" name="writer" size="90"></td>					
			</tr>	
			<tr>
				<td width="120">제목</td>
				<td class="form-control"><input type="text" name="subject" size="90" value=[Reply]:></td>		
			</tr>
			<tr style="height: 50px">
				<td width="120">비밀번호</td>
				<td class="form-control"><input type="password" name="password" size="90"></td>			
			</tr>
			<tr style="height: 50px">
				<td width="100">내용</td>
				<td colspan="3" class="form-control">
					<textarea rows="10" cols="90" name="content"></textarea></td>						
			</tr>
			<tr style="height: 50px;">
				<td colspan="4">
					<input type="hidden" name="ref" value="<%=ref %>">
					<input type="hidden" name="re_step" value="<%=re_step %>">
					<input type="hidden" name="re_level" value="<%=re_level %>">
					<input type="submit" value="댓글쓰기" class="btn btn-light">&nbsp;&nbsp;
					<input type="reset" value="댓글취소" class="btn btn-light">&nbsp;&nbsp;
					<input type="button" onclick="location.href='main.jsp?center=boardList.jsp'" value="글목록보기" class="btn btn-light">&nbsp;&nbsp;
				</td>
			</tr>			
		</table>	
	</form>
</div>

</body>
</html>