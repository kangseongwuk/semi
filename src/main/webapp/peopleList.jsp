<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.peopleDAO" %>  
<%@ page import="movie.peopleBean" %>  
<%@ page import="java.util.Vector" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 보기 화면</title>
<style>
table{
	margin-top:35%;
	margin-left:35%;
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
	peopleDAO pdao = new peopleDAO();
	
	Vector<peopleBean> vec = pdao.allselectmember();
%>

<table align="center">
	<tr align="center" style="height: 40; background: pink;">
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
	 <button onclick="location.href='main.jsp'">main페이지</button>
		</td>
	</tr>
</table>

	       


</body>
</html>