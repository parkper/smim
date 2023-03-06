<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String id = (String) session.getAttribute("idKey"); %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SMIM</title>
    <link rel="shortcut icon" href="../imgs/logo/favicon.ico">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/main.css">
    <link href="https://fonts.googleapis.com/css?family=Anton&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
    <script src="https://kit.fontawesome.com/11390cb447.js" crossorigin="anonymous"></script>
    <script src="../js/jquery-1.12.4.min.js"></script>
    <script>
    $(function(){
        $('#hd-main-menu > li').on('mouseenter', function() {
            $('header').addClass('hd-bg-mouseenter');
            $('#hd-main-menu > li').find('.hd-sub-menu').stop().slideDown();
        });
        $('#hd-main-menu > li').on('mouseleave', function() {
            $('header').removeClass('hd-bg-mouseenter');
            $('#hd-main-menu > li').find('.hd-sub-menu').stop().slideUp();
        });
        $('#hd-trigger').on('click', function(e) {
            e.preventDefault();

            $(this).toggleClass('active');
            $('.hd-sm-sub-menu').toggleClass('active');
        });
    });
    </script>
</head>
<body>
    <header>
        <nav>
            <h1>
        		<a href="index.jsp" class="hd-dt-logo"><img src="../imgs/logo/logo-1.png" alt="smim logo"></a>
            	<a href="index.jsp" class="hd-sm-logo"><img src="../imgs/logo/si-logo.png" alt="smim mb logo"></a>
            </h1>

		 <ul class="in-sm-container">
<%
	if(id != null) {
%>
   	     	<li><a href="../member/logout.jsp">로그아웃</a></li>
   		 	<li><a href="../member/mypage.jsp">내정보</a></li>
<%
		if(id.equals("admin")) {
%>
			<li><a href="../member/admin-memberList.jsp">회원목록</a></li>
<%
		}
	}else{
%>
			<li><a href="../member/login.jsp">로그인</a></li>
            <li><a href="../member/memberForm.jsp">회원가입</a></li>
<%
	}
%>		
		</ul>
            <a href="#" id="hd-trigger">
                <span></span>
                <span></span>
                <span></span>
            </a>

            <ul id="hd-main-menu">
                <li>
                    <a href="index.jsp">smim</a>
                    <div class="hd-sub-menu">
                        <div>
                            <ul>
                                <li><a href="history.jsp">history</a></li>
                                <li><a href="material.jsp">material</a></li>
                                <li><a href="variety.jsp">variety</a></li>
                            </ul>
                            <ul>
                                <li><a href="consulting.jsp">consulting</a></li>
                                <li><a href="../board/list.jsp">community</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li><a href="#">service</a></li>
            </ul>
            <ul class="hd-sm-sub-menu">
                <ul>
                    <li><a href="history.jsp">history</a></li>
                    <li><a href="material.jsp">material</a></li>
                    <li><a href="variety.jsp">variety</a></li>
                    <li><a href="consulting.jsp">consulting</a></li>
                </ul>
            </ul>
            
       	   <!-- 탑메뉴 -->
       	    <ul class="hd-topmenu">
<%
	if(id != null) {
%>
      	    	<li><a href="../member/logout.jsp">로그아웃</a></li>
       			<li><a href="../member/mypage.jsp">내정보</a></li>
<%
		if(id.equals("admin")) {
%>
				<li><a href="../member/admin-memberList.jsp">회원목록</a></li>
<%
		}
	}else{
%>
         	   <li><a href="../member/login.jsp">로그인</a></li>
       		   <li><a href="../member/memberForm.jsp">회원가입</a></li>
<%
	}
%>
            </ul>
        </nav>
    </header>
	<div class="clear"></div>

	<div class="container">
   		<video playinline autoplay muted loop>
    	  <source src="../video/in-vid-bg-1920.mp4">
    	</video>

		<div class="in-menu-wrap">
			<ul class="in-menu"></ul>
		<div class="in-image-container"></div>
		</div>
    </div>
    
	<div class="emtpy-box"></div>
    <footer>
        <div class="ft-wrap">
            <div class="ft-txt">
               <p>경기도 용인시 기흥구 66-5|SMIM| 사업자등록번호 409-81-33798</p> 
               <p>Copyright&copy; 2022 SMIM All rights reserved.</p>
            </div>
            <ul class="ft-sns">
                <li><a href="#" class="btn btn1"><i class="fa-brands fa-facebook-f"></i></a></li>
                <li><a href="#" class="btn btn2"><i class="fa-brands fa-instagram"></i></a></li>
                <li><a href="#" class="btn btn3"><i class="fa-brands fa-twitter"></i></a></li>
                <li><a href="#" class="btn btn4"><i class="fa-brands fa-youtube"></i></a></li>
            </ul>
        </div>
    </footer>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js'></script><script  src="../js/in-script.js"></script>
</body>
</html>