<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.boardDAO"%>
<%@ page import="movie.boardBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정 화면</title>
</head>
<body>
<%
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	
	boardDAO bdao = new boardDAO();
	boardBean bBean = bdao.UpdateOneSelectBoard(b_no);
%>
	<h2 align="center">게시판 수정 화면</h2>
	<div align="center">
		<form action="boardUpdatePro.jsp" method="post">
			<table border="1" style="width: 800px; text-align: center;">
				<tr style="height: 50px; background: yellow;">
					<td width="100">번호</td>
					<td><%=bBean.getb_no() %></td>
					<td width="100">작성자</td>
					<td><%=bBean.getWriter() %></td>
				</tr>
				<tr style="height: 50px; background: yellow;">
					<td width="120">비밀번호</td>
					<td><input type="password" name="password" size="30"></td>
					<td width="100">내용</td>
					<td colspan="3"><textarea rows="10" cols="90" name="content"><%=bBean.getContent() %></textarea></td>
				</tr>
				<tr style="height: 50px;">
					<td colspan="4">
					<input type="hidden" name="b_no" value="<%=bBean.getb_no() %>">
						<input type="submit" value="수정완료">&nbsp;&nbsp; 
						<input type="reset" value="수정취소">&nbsp;&nbsp; 
						<input type="button" onclick="location.href='main.jsp?center=boardList.jsp'"value="글목록보기">&nbsp;&nbsp; 
						<input type="button" onclick="location.href='main.jsp?center=join.jsp'" value="회원가입">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>
</body>
</html>