<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글쓰기 화면 구현</title>
</head>
<body>
	<h2 align="center">게시판 댓글 쓰기 화면</h2>
<%
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = Integer.parseInt(request.getParameter("re_level"));
%>
<div align="center">
	<form action="boardRewritePro.jsp" method="post"> 
		<table border="1" style="width: 800px; text-align: center;">
			<tr style="height: 50px; background: yellow;">
				<td width="100">작성자</td>
				<td><input type="text" name="writer" size="60"></td>				
				<td width="120">제목</td>
				<td><input type="text" name="subject" value=[Reply]:></td>			
			</tr>	
			<tr style="height: 50px; background: yellow;">
				<td width="120">비밀번호</td>
				<td><input type="password" name="password"></td>			
			</tr>
			<tr style="height: 50px; background: yellow;">
				<td width="100">내용</td>
				<td colspan="3">
					<textarea rows="10" cols="90" name="content"></textarea></td>						
			</tr>
			<tr style="height: 50px;">
				<td colspan="4">
					<input type="hidden" name="ref" value="<%=ref %>">
					<input type="hidden" name="re_step" value="<%=re_step %>">
					<input type="hidden" name="re_level" value="<%=re_level %>">
					<input type="submit" value="댓글쓰기">&nbsp;&nbsp;
					<input type="reset" value="댓글취소">&nbsp;&nbsp;
					<input type="button" onclick="location.href='main.jsp?center=boardList.jsp'" value="글목록보기">&nbsp;&nbsp;
					<input type="button" onclick="location.href='main.jsp?center=join.jsp'" value="회원가입">
				</td>
			</tr>			
		</table>	
	</form>
</div>

</body>
</html>