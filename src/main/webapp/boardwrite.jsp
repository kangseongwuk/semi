<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 쓰기 화면</title>
</head>
<body>
	<h2 align="center">게시판 글 쓰기 화면</h2>
<form action="boardwritePro.jsp" method="post">
	<table border="1" align="center" width="800" bgcolor="yellow">
		<tr height="40" align="center">
			<td width="200">작성자</td>
			<td width="600"><input type="text" name="writer" size="77" placeholder="홍길동"/></td>
		</tr>
		<tr height="40" align="center">
			<td width="200">주제</td>
			<td width="400"><input type="text" name="subject" size="77" placeholder="자유주제를 입력"/></td>
		</tr>
		<tr height="40" align="center">
			<td width="200">비밀번호</td>
			<td width="400"><input type="password" name="password" size="77" 
				placeholder="비밀번호는 영문자, 숫자, 특수문자 8자리 이상 15자리 이하로 입력"/></td>
		</tr>
		<tr height="40" align="center">
			<td width="200">글 내용</td>
			<td width="400">
				<textarea rows="10" cols="77" name="content"></textarea></td>
		</tr>		
		<tr height="40" align="center">
			<td colspan="2"> 				
				<input type="submit" value="글쓰기"/>&nbsp;&nbsp;
				<input type="reset" value="취소"/>&nbsp;&nbsp;
				<input type="button" value="글목록보기" onclick="location.href='main.jsp?center=boardList.jsp'"/>&nbsp;&nbsp;
		</tr>
	</table>
</form>	
</body>
</html>