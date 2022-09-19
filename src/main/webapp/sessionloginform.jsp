<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session login</title>
</head>
<body>
	<h2 align="center">로그인</h2>
<form action="sessionloginformpro.jsp" method="post"> 
	<table align="center" border="1" style="width: 500;">
		<tr height="40">
			<td>아이디(ID)</td>
			<td>
				<input type="text" name="id" placeholder="id 입력">
			</td>
		</tr>
		<tr height="40">
			<td>비밀번호(PW)</td>
			<td>
				<input type="password" name="passwd" placeholder="pw 입력">
			</td>
		</tr>
		<tr align="center" height="40">
			<td colspan="2">
				<input type="submit" value="로그인"/>&nbsp;&nbsp;&nbsp;
				<input type="reset" value="취소"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>