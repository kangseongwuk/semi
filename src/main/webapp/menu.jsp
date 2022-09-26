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
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
     <nav id="sidebar" >
    <div class="sidebar-skeleton"></div>
      <div class="sidebar-header">
        <a href=main.jsp><img src="./images/mmovie2.png"  width="200" height="100vh"/></a>
      </div>
      <ul class="lisst-unstyled components">
        <p>추천</p>
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
        <li>
          <a href="#">찜목록</a>
        </li>
        <li>
          <a href="main.jsp?center=boardList.jsp">고객센터</a>
        </li>
      </ul>
    </nav> 
</body>
</html>