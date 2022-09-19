<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
	<script>
	   $(document).ready(function(){
		        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때        
		$(".menu>a").click(function(){            
			var submenu = $(this).next("ul");             
			// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기            
			if( submenu.is(":visible") ){                
				submenu.slideUp();            
				}else{                
					submenu.slideDown();            
				}        
		});    
	});
	</script>
<title>menu</title>
<style>    
	.menu a{
		cursor:pointer;
	}    
	.menu .hide{
	display:none;
	}
	li{
		color:white;
	}

</style>
</head>
<body style="background:black;">
	<div>    
		<ul>
			<li class="menu">            
				<a><img src="./img/movie.png" alt="상위메뉴이미지1" width="200" height="100"/></a>            
	<ul class="hide">
<li>메뉴1-1</li>
<li>메뉴1-2</li>
<li>메뉴1-3</li>
<li>메뉴1-4</li>
<li>메뉴1-5</li>
<li>메뉴1-6</li>
</ul>        
	</li>
</ul>
	</div>
</body>
</html>