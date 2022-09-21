<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ page import="movie.peopleDAO" %>  
<%@ page import="movie.peopleBean" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 화면 구현</title>
<style>
table{
	/* margin-top:10%;
	margin-left:10%; */
	border:2px solid black;
}
tr{
	width:90%;
	border: 3px solid black;

}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String id = request.getParameter("id");
	
	peopleDAO pdao = new peopleDAO();
	peopleBean pBean = pdao.oneselectmember(id);
%>

<h2 align="center">회원정보 수정 화면 구현</h2>
<form action="main.jsp?center=updatePro.jsp" method="get"> 
<div align="center">
	<table>
		<tr align="center" style="height: 40; background: pink;">
			<td width="100">아이디</td>
			<td><%=pBean.getId() %></td>
		</tr>
		<tr align="center" style="height: 40;">
			<td width="120">이&nbsp;&nbsp;&nbsp;름</td>
			<td><%=pBean.getName() %></td>
		</tr>
		<tr align="center" style="height: 40;">
			<td width="120">선호장르</td>
			<td>
				<input type="text" name="genre" value="<%=pBean.getGenre() %>">
			</td>
		</tr>
				<tr align="center" style="height: 40;">
			<td width="120">변경 비밀번호</td>
			<td>
				<input type="password" name="pw1" value="<%=pBean.getPw() %>">
			</td>
		</tr>
		<tr align="center" style="height: 40;">
			<td width="120">기존 비밀번호</td>
			<td>
				<input type="password" name="pw">
			</td>
		</tr>
		<tr style="height: 40; ">
			<td colspan="2">
				<input type="hidden" name="id" value="<%=pBean.getId() %>">
				<input type="submit" value="회원정보수정">&nbsp;&nbsp;
				<input type="button" value="회원정보조회" onclick="location.href='main.jsp?center=peopleList.jsp?'"/>&nbsp;&nbsp;
			</td>
		</tr>
	</table>

</div>
</form>
</body>
</html>