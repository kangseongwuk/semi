<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="m.ico" rel="shortcut icon" type="image/x-icon">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>1'M MOVIE</title>
<script type="text/javascript">

function loginC() {
	let id = "${id}";
	if (id == "") {
		alert("로그인 후 사용하실 수 있습니다.");
		location.href="Login.jsp";
		$('a').prop('href', 'Login.jsp');
	};
};
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
   
  <!-- Required meta tags -->
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

  <!-- cdnjs.com / libraries / fontawesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" charset="utf-8"></script>

  <!-- css ekternal -->
  
  <link rel="stylesheet" href="css/mainPage.css">
  
  <title>1'M MOVIE</title>


<style>
.dropbtn {
 
}
.dropdown {
  position: relative;
  display: inline-block;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  z-index: 1;
}
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.dropdown-content a:hover {
  background-color: #ddd;
}
.dropdown:hover .dropdown-content {
  display: block;
}
.dropdown:hover .dropbtn {
  background-color: #3e8e41;
}
</style>
</head>
<body class="body">
   <!-- session을 이용한 로그인 처리 -->
   <%
   String id = (String) session.getAttribute("id");
   String center = request.getParameter("center");

      %>   
 <!-- 서브메뉴   2022.09.28 수정-->   
      
      <div class="wrapper" >
       <nav id="sidebar" style="color: white">
       <div className="sidebar-skeleton"></div>
       
         <div class="sidebar-header">
         <a href="main.jsp"><img src="./images/mmovie2.png"  width="200" height="100vh"/></a><br>
         </div>
         <ul class="lisst-unstyled components">
           <li><a href="main.jsp?center=random.jsp">추천</a></li>
           <li class="active" >
             <a href="#foodSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">장르별</a>
             <ul class="collapse lisst-unstyled" id="foodSubmenu" >
               <li><a href="main.jsp?center=movieGenreDetail.jsp?genre=코미디">코미디</a></li>
               <li><a href="main.jsp?center=movieGenreDetail.jsp?genre=멜로">멜로</a></li>
               <li><a href="main.jsp?center=movieGenreDetail.jsp?genre=액션">액션</a></li>
               <li><a href="main.jsp?center=movieGenreDetail.jsp?genre=호러">호러</a></li>
               <li><a href="main.jsp?center=movieGenreDetail.jsp?genre=스릴러">스릴러</a></li>
               <li><a href="main.jsp?center=movieGenreDetail.jsp?genre=드라마">드라마</a></li>
               <li><a href="main.jsp?center=movieGenreDetail.jsp?genre=스포츠">스포츠</a></li>
               <li><a href="main.jsp?center=movieGenreDetail.jsp?genre=SF">SF</a></li>
               
             </ul>
           </li>
           <li>
             <a href="#">찜목록</a>
           </li>
           <li>
             <a href="main.jsp?center=boardList.jsp">고객센터</a>
           </li>
           <li>
             <a href="movieJoin.jsp">영화추가</a>
             <a href="main.jsp?center=test.jsp">테스트</a>
           </li>
         </ul>
       </nav>
    
   <header class="header">
      <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
          <button type="button" id="sidebarCollapse" class="btn btn-dark">
            <i class="fas fa-bars"></i><span> MENU</span>
          </button>
        </div>
      </nav>
      
          <!-- 검색바   2022.09.28 수정-->  
   
   
         <div class="container">
	
    <form  name="title" action="searchPro.jsp"   >
                    <!--  <div class="row height d-flex justify-content-center align-items-center"> -->
			
                      <div class="col-md-8" >

                        <div class="search" >
                          <i class="fa fa-search"></i>
             
                         
                          <input type="search" name="title" class="form-control"  placeholder="Have a question? Ask Now">
                            <button type="submit" class="btn btn-primary" style="border-color:rgb(51,51,51)" value="title" >Search</button>
                       
                        </div>
                        
                      </div>
                      
           </form>
                </div>

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
         <a href="Login.jsp"></a>      	
	           <div class="dropdown">
		    	<button class="dropbtn">MY PAGE</button>
				   	 <div class="dropdown-content">
				     	    <a href="main.jsp?center=mypageDetail.jsp?id=<%=id%>">회원목록</a> 
				     	    <a href="#"></a>
				    	    <a href="#" onclick="return Logout_form()">로그아웃</a>
				   	</div>
			  	</div>
					  	<form id="Logout" action="Logout.jsp" method="post" style = "display:none">
						<input type="submit" value="로그아웃">
						</form>
	          	<span><%=id %></span>&nbsp;&nbsp; 
							            
			         <%} %>

         </div>
      </nav>
      </header>
	    <div id="content">
				<%
					
				
					if(center == null){
						center = "test.jsp";
					}
				%>
 				<div class="wrap" onclick="loginC()">
				<jsp:include page="<%=center %>"/>
				</div>
	      </div>
     
<script type="text/javascript"
src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</div>
  <!-- wrapper and -->


  <!-- Option 2: jQuery, Popper.js, and Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
  <script>
    $(document).ready(function() {
      $("#sidebarCollapse").on('click',function() {
        $("#sidebar").toggleClass('active');
      });
    });
    
    function Logout_form(){
    	document.getElementById('Logout').submit();

    }
    
</script>
</body>
</html>