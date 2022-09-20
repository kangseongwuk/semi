<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<style>
@import url("css/searchbar.css");

table, tr, td {
	border: none;
	fontSize: "35px";
	display: "table";
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
	String id = (String) session.getAttribute("id");

	if (id == null) {
		id = "GUEST";
	}
	%>

	<table width="100%" align="right">
		<tr height="80">
			<td>
				
		
				<label>
						<form class="search-box">
							<input type="text" placeholder=" " />
							<button type="reset"></button>
						</form>
				</label>
			</td>
			<td>
				<a onclick="location.href='sessionLoginForm.jsp'">로그인</a>
				<a onclick="location.href='join.jsp'">회원가입</a>
			</td>
			
	</table>
</body>
</html>