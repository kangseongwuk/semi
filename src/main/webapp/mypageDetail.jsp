<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.peopleDAO" %>  
<%@ page import="movie.peopleBean" %>     
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원 정보 상세 보기</title>
<style>
@import url("css/bootstrap.css");
</style>
<script src="jquery-1.12.0.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body style="margin-top: 100px;">
<%
	String id = request.getParameter("id");

	peopleDAO pdao = new peopleDAO();
	peopleBean pBean = pdao.oneselectmember(id);
%>

<h2 align="center">회원정보 상세 보기 화면 구현</h2>
<div align="center">
	<table class="table table-bordered" border="1" style="text-align: center; width:50%;">
		<tr align="center" style="height: 40;">
			<td width="100">아이디</td>
			<td><%=pBean.getId() %></td>
		</tr>
		<tr align="center" style="height: 40;">
			<td width="120">이&nbsp;&nbsp;&nbsp;름</td>
			<td><%=pBean.getName() %></td>
		</tr>
		<tr align="center" style="height: 40;">
			<td width="120">성&nbsp;&nbsp;별</td>
			<td><%=pBean.getGender() %></td>
		</tr>
		<tr align="center" style="height: 40;">
			<td width="120">나&nbsp;&nbsp;이</td>
			<td><%=pBean.getAge() %></td>
		</tr>
		<tr align="center" style="height: 40;">
			<td width="80">선호장르&nbsp;</td>
			<td><%=pBean.getGenre() %></td>
		</tr>
		
		<tr style="height: 40; ">
			<td colspan="2">
				<button onclick="location.href='main.jsp?center=updateMypage.jsp?id=<%=pBean.getId() %>'">수정버튼</button>&nbsp;&nbsp;
				<button onclick="location.href='main.jsp?center=deleteMypage.jsp?id=<%=pBean.getId() %>'">삭제버튼</button>&nbsp;&nbsp;
			</td>
		</tr>
	</table>

</div>
</body>
</html>