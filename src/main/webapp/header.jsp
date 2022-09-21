<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>header.jsp</title>
<style>
@import url("css/header.css");
</style>
</head>
<body>
	<!-- session을 이용한 로그인 처리 -->
	
	<%
	String id = (String) session.getAttribute("id");
	%>

	<header>
		<nav style="margin-left: 300px; display: inline-block; cursor : pointer;">
			<img src="./images/menu_icon1.png" id="m" alt="메뉴줄이기" width="50"
				height="40"><br>
			<span style="align: center"> Menu</span>
		</nav>

		<nav>
			<!-- 검색바 -->
		</nav>

		<nav>
			<div align="right">
			
			<%
			if(id==null){
				id = "GUEST";
				%>
				 <a href="Login.jsp"> <img alt="logo"
               src="./images/procutcut.png" height="35px" width="35px"
               style="align: -1px"></a>&nbsp;&nbsp; <span
               style="vertical-align: center">로 그 인</span>&nbsp;&nbsp; <a
               href="join.jsp"> <img alt="logo" src="./images/procutcut.png"
               height="35px" width="35px"></a>&nbsp;&nbsp;<span>회원가입</span>&nbsp;&nbsp;

			<%
			}else if(id.equals("admin")){
				%>
				   <a href="main.jsp?center=peopleList.jsp">관리자모드 접속(회원 목록 보기)</a>
				   <form action="Logout.jsp" method="post">
				  <input type="submit" value="로그아웃">
				  </form>
			<%
			}else if(id != null){%>
				<a href="Login.jsp"> <img alt="logo"
					src="./images/procutcut.png" height="35px" width="35px"
					style="align: -1px"></a>&nbsp;&nbsp; <span
					style="vertical-align: center"><%=id %></span>&nbsp;&nbsp; 
				  <form action="Logout.jsp" method="post">
				  <input type="submit" value="로그아웃">
				  </form>
			
			<%} %>

			</div>
		</nav>
	</header>

</body>
</html>