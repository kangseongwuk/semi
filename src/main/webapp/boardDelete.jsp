<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.boardDAO"%>
<%@ page import="movie.boardBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 정보 삭제 화면</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	
	boardDAO bdao = new boardDAO();
	boardBean bBean = bdao.oneselectboard(b_no);
%>

	<h2 align="center">게시판 수정 화면</h2>
	<div align="center">
		<form action="boardDeletePro.jsp" method="post">
			<table border="1" style="width: 800px; text-align: center;">
				<tr style="height: 50px; background: yellow;">
					<td width="100">번호</td>
					<td><%=bBean.getb_no()%></td>
					<td width="100">작성자</td>
					<td><%=bBean.getWriter() %></td>
				</tr>
				<tr style="height: 50px; background: yellow;">
					<td width="120">비밀번호</td>
					<td colspan="4"><input type="password" name="password" size="50"></td>
				</tr>
				<tr style="height: 50px;">
					<td colspan="4">
						<input type="hidden" name="b_no" value="<%=bBean.getb_no() %>">
						<input type="submit"value="삭제완료">&nbsp;&nbsp;
						<input type="reset" value="삭제취소">&nbsp;&nbsp;
						<input type="button" onclick="location.href='main.jsp?center=boardList.jsp'"value="글목록보기">&nbsp;&nbsp; 
					</td>
				</tr>
			</table>
		</form>
		</div>
</body>
</html>