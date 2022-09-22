<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
    @import url("css/sidebar.css");
</style>
<meta charset="UTF-8">
<title>menu.jsp</title>
</head>
<body>
	<nav class="header" role="banner" id="sidebar" style="margin-top:12	0px">
		<h1 class="logo">
			<a href="main.jsp">1'm <span>movie</span></a><br>
		</h1>
		<div class="nav-wrap">
			<nav class="main-nav" role="navigation">
				<ul class="unstyled list-hover-slide">
					<li><a href="#">추천</a></li>
					<li class="active">
          <a href="#foodSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">장르별</a>
          <ul class="collapse lisst-unstyled" id="foodSubmenu">
            <li><a href="#">코믹</a></li>
            <li><a href="#">멜로</a></li>
            <li><a href="#">액션</a></li>
            <li><a href="#">호러</a></li>
            <li><a href="#">스릴러</a></li>
            <li><a href="#">드라마</a></li>
            <li><a href="#">스포츠</a></li>
            <li><a href="#">SF</a></li>
          </ul>
        </li>
					<li><a href="#">찜목록</a></li>
					<li><a href="main.jsp?center=boardList.jsp">고객센터</a></li>
				</ul>
			</nav>
			<div class="overlay"></div>
			<ul class="social-links list-inline unstyled list-hover-slide">
				<li><a href="#">Twitter</a></li>
				<li><a href="#">Google+</a></li>
				<li><a href="#">GitHub</a></li>
				<li><a href="#">CodePen</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>