<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.peopleDAO" %>  
<%@ page import="movie.peopleBean" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세 보기</title>
</head>
<body>
<%
	String id = request.getParameter("id");

	peopleDAO pdao = new peopleDAO();
	peopleBean pBean = pdao.oneselectmember(id);
%>

<h2 align="center">회원정보 상세 보기 화면 구현</h2>
<div align="center">
	<table border="1" style="text-align: center; width: 100%;">
		<tr align="center" style="height: 40; background: pink;">
			<td width="100">아이디</td>
			<td><%=pBean.getId() %></td>
		</tr>
		<tr align="center" style="height: 40; background: yellow;">
			<td width="120">이&nbsp;&nbsp;&nbsp;름</td>
			<td><%=pBean.getName() %></td>
		</tr>
		<tr align="center" style="height: 40; background: yellow;">
			<td width="120">성&nbsp;&nbsp;별</td>
			<td><%=pBean.getGender() %></td>
		</tr>
		<tr align="center" style="height: 40; background: yellow;">
			<td width="120">나&nbsp;&nbsp;이</td>
			<td><%=pBean.getAge() %></td>
		</tr>
		<tr align="center" style="height: 40; background: yellow;">
			<td width="80">선호장르&nbsp;</td>
			<td><%=pBean.getGenre() %></td>
		</tr>
		
		<tr style="height: 40; ">
			<td colspan="2">
				<button onclick="location.href='main.jsp?center=update.jsp?id=<%=pBean.getId() %>'">수정버튼</button>&nbsp;&nbsp;
				<button onclick="location.href='main.jsp?center=delete.jsp?id=<%=pBean.getId() %>'">삭제버튼</button>&nbsp;&nbsp;
				<button onclick="location.href='main.jsp?center=peopleList.jsp?'">회원정보조회</button>&nbsp;&nbsp;
			</td>
		</tr>
	</table>

</div>
</body>
</html>