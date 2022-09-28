<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.movieDAO"%>
<%@ page import="movie.movieBean"%>
<%@ page import="movie.rewordDAO"%>
<%@ page import="movie.rewordBean"%>
<%@ page import="java.util.Vector"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

function wrapWindowByMask(){
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('#mask').css({'width':maskWidth,'height':maskHeight});  

    //애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
    $('#mask').fadeIn(800);      
    $('#mask').fadeTo("slow",0.8);    

    //윈도우 같은 거 띄운다.
    $('.window').show();
}

$(document).ready(function(){
    //검은 막 띄우기
    $('.openMask').click(function(e){
        e.preventDefault();
        wrapWindowByMask();
    });

    //닫기 버튼을 눌렀을 때
    $('.window .close').click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $('#mask, .window').hide();  
    });       

    //검은 막을 눌렀을 때
    $('#mask').click(function () {  
        $(this).hide();  
        $('.window').hide();  
    });      
});

</script>

<meta charset="UTF-8">
<title>body</title>
<style type="text/css">
.poster_body{
}
	.poster{
		/* position:relative; */
		border-radius: 7px;
		width:300px;
		height: 400px;
	}
	.box1{
		border-radius: 7px;
		display:inline-block;
		width:300px;
		height: 400px;
	}
	.box2{
		position: absolute;
		display:inline-block;
		background:rgba(0,0,0,0.5);
		color: white;
		width:300px;
		height: 400px;
		border-radius: 7px;
	}
	#PopUp{
		background:rgba(0,0,0,0.8);
		color: white;
		width: 70%;
		height: 100%;
		border-radius: 10px;
	}
	#mask {  
      position:absolute;  
      z-index:9000;  
      background-color:#000;  
      display:none;  
      left:0;
      top:0;
    }
    .window{
      display: none;
      position:absolute;  
      left:15%;
      top:10%;
      z-index:10000;
    }

</style>
</head>
<body>

<% 
request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("id");



	movieDAO mdao = new movieDAO(); //영화정보
	Vector<movieBean> vec = mdao.allselectMovie(); //모든영화정보
	
	for(int i=0; i < vec.size(); i++){
	String mno = String.valueOf(i);		
	movieBean mBean1 = mdao.oneselectMovie(mno);
		movieBean mBean = vec.get(i);
%>

        <!-- <div id="mask"></div> -->
        <div style="width:310px;display:inline-block;">
<a href="main.jsp?center=movieDetail.jsp?mno=<%=mBean.getMno()%>"><img class="poster"src="<%=mBean.getPoster() %>" width="300px" height="400px"></a></div>
   		<%-- <a href="#" class="openMask"><img class="poster"src="<%=mBean.getPoster() %>" width="300px" height="400px"></a> --%>


<%-- 	    <div class="window">
<jsp:include page="movieDetail.jsp">
	<jsp:param value="<%=mBean1.getMno()%>" name="mno"/></jsp:include>
		</div> --%>
<%} %>
</body>
</html>