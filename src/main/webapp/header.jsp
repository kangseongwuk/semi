<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<style>
	table, tr, td {
		border: none;
		fontSize: "35px";
		display:"table";
		
	}
	
	tr {
		 
		 border: none;
	}
	
	td {
		 border: none;
	 }
	logo {
		display: table-cell;
		vertical-align: middle;
	}
</style>
</head>
<body>
	<!-- session을 이용한 로그인 처리 -->
	<%
	String id = (String)session.getAttribute("id");

	if(id == null){
		id = "GUEST";
	}
%>

	<table width="1000">
		<tr height="80">
			<td class="logo">
				<img alt="movie" src="./images/movie.png" height="60"> 
				<font size="6">movie time</font></td>
			<td align="center" width="200">
				<img alt="profile" src="./images/procutcut.png" height="50px" width="50px"><%=id %>
				<button onclick="location.href='mainSession.jsp?center=sessionloginform.jsp'">로그아웃</button>
			</td>
	</table>
</body>
</html>