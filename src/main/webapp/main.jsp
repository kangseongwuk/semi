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
@import url("css/menu.css");

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
    #center{
    	position: absolute;
    	top: 70%;
    	left: 70%;
    	
    }
    footer { <!-- footer 부분 위치 고정 -->
		position: fixed;
		footer: 0;
		left: 500px;
		right: 0;
		top: 80%;
		width: 100%;
		text-align: center;
		font-weight: var(- -weight-bold);
		color: var(- -color-white);
		color:white;
		}
</style>
</head>
<body>
<%
	String center = request.getParameter("center");

	if(center == null){
		center = "body.jsp";
	}
%>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
		<section>
		  <article>
			<jsp:include page="<%=center %>"/>
		  </article>
		</section>
<% 

%>
	<jsp:include page="menu.jsp"></jsp:include>

	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>