<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>main.jsp</title>
<script>
$(document).ready(function(){
			var a = true;
		$('#m').click(function(){
			if(a){
			$('.header').hide();
			a = false;
			}else{
			$('.header').show();
			a = true;
			}
		});

});
</script>
<style type="text/css">
@import url("css/sidebar.css");

	body {
		background: gray;
	}
	
	footer { <!-- footer 부분 위치 고정 -->
		position: fixed;
		top: 80%;
		width: 100%;
		text-align: center;
		font-weight: var(- -weight-bold);
		color: var(- -color-white);
		color:white;
	}
	
	div.wrap {
	    max-width: 1000px;
	    margin: 0 auto;
	    display: flex;
	    justify-content: space-between;
	}	
	
	div.box {
        flex: 1;

    }
    
    img {
    	border-radius: 7px;
    }
</style>
</head>
<body>
<p align="right">
	<img src="./images/m.png" id="m" alt="메뉴줄이기" width="30" height="30">
</p>
	<p align="right" id="upp">
		<img alt="logo" src="./images/procutcut.png" height="35px" width="35px">&nbsp;&nbsp;GUEST&nbsp;&nbsp;
	</p>

	<div class="wrap">
        <div class="box1"><img src="./images/다크나이트.png" height="350px" width="280px"></div>&nbsp;&nbsp;&nbsp;
        <div class="box2"><img src="./images/더 문.png" height="350px" width="280px"></div>&nbsp;&nbsp;&nbsp;
        <div class="box3"><img src="./images/블랙폰.png" height="350px" width="280px"></div>&nbsp;&nbsp;&nbsp;
        <div class="box4"><img src="./images/애프터.png" height="350px" width="280px"></div>
    </div>
	<div class="wrap">
        <div class="box1"><img src="./images/다크나이트.png" height="350px" width="280px"></div>&nbsp;&nbsp;&nbsp;
        <div class="box2"><img src="./images/더 문.png" height="350px" width="280px"></div>&nbsp;&nbsp;&nbsp;
        <div class="box3"><img src="./images/블랙폰.png" height="350px" width="280px"></div>&nbsp;&nbsp;&nbsp;
        <div class="box4"><img src="./images/애프터.png" height="350px" width="280px"></div>
    </div>
	<div class="wrap">
        <div class="box1"><img src="./images/다크나이트.png" height="350px" width="280px"></div>&nbsp;&nbsp;&nbsp;
        <div class="box2"><img src="./images/더 문.png" height="350px" width="280px"></div>&nbsp;&nbsp;&nbsp;
        <div class="box3"><img src="./images/블랙폰.png" height="350px" width="280px"></div>&nbsp;&nbsp;&nbsp;
        <div class="box4"><img src="./images/애프터.png" height="350px" width="280px"></div>
    </div>



<% 

%>
	<jsp:include page="sidebar.jsp"></jsp:include>

	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>