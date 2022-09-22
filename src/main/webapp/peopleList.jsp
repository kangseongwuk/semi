<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.peopleDAO" %>  
<%@ page import="movie.peopleBean" %>  
<%@ page import="java.util.Vector" %>      
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원 목록 보기 화면</title>
<style>
@import url("css/bootstrap.css");
table{
	margin-top:5%;
}

a, a:hover {
		color:#000000;
		text-decoration:none;}
</style>
<script src="jquery-1.12.0.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body style="margin-top: 100px;">
<%
	peopleDAO pdao = new peopleDAO();
	
	Vector<peopleBean> vec = pdao.allselectmember();
%>
	<h2 align="center">회원목록</h2>
<table align="center" class="table table-bordered" border="1" style="width:50%;">
	<tr align="center" style="height: 40;">
		<td width="100">아&nbsp;이&nbsp;디</td>
		<td width="120">이&nbsp;&nbsp;름</td>
		<td width="120">성&nbsp;&nbsp;별</td>
		<td width="120">나&nbsp;&nbsp;이</td>
		<td width="120">선호장르&nbsp;</td>
	
	</tr>

	<%
		for(int i=0; i < vec.size(); i++){
			
			peopleBean pBean = vec.get(i);		
	%>
	<tr height="40" align="center">
		<td><a href="main.jsp?center=peopleDetail.jsp?id=<%=pBean.getId() %>"><%=pBean.getId() %></a></td>
		<td><%=pBean.getName() %></td>
		<td><%=pBean.getGender() %></td>
		<td><%=pBean.getAge() %></td>
		<td><%=pBean.getGenre() %></td>
	</tr>
	<%} %>
	<tr>
		<td colspan=5 align="center">
	 <button onclick="location.href='main.jsp'" class="btn btn-light">main페이지</button>
		</td>
	</tr>
</table>

	       


</body>
</html>