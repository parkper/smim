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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/history.css">
    <link rel="stylesheet" href="../css/hi-lastcon.css">
    <link rel="stylesheet" href="../css/variety.css">
    <link rel="stylesheet" href="../css/material.css">
    <link rel="stylesheet" href="../css/consulting.css">
    <link rel="stylesheet" href="../vegas/vegas.min.css">
    <link rel="stylesheet" href="../css/va-se-style.css">
    <link rel="stylesheet" href="../css/member-style.css">
    <link rel="stylesheet" href="../css/board-style.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
    <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
    <script src="https://kit.fontawesome.com/11390cb447.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <script src="../js/jquery-1.12.4.min.js"></script>
    <script src="../vegas/vegas.min.js"></script>
    <script src="../js/dropdown.js"></script>
    <script src="../js/mb-script.js"></script>
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
            $(window).scroll(function(e) {
                var top = $(window).scrollTop();

                if(top > 0) {
                    $('header').addClass('hd-bg-mouseenter');
                }else if(top==0) {
                    $('header').removeClass('hd-bg-mouseenter');
                }
            });
            $('#hd-trigger').on('click', function(e) {
                e.preventDefault();

                $(this).toggleClass('active');
                $('.hd-sm-sub-menu').toggleClass('active');
            });

            $('.va-bg-1').vegas({
                slides:[
                    {src:'../imgs/variety/va-bn-bg-2.jpg'},
                    {src:'../imgs/variety/va-bn-bg-3.jpg'},
                    {src:'../imgs/variety/va-bn-bg-4.jpg'},
                    {src:'../imgs/variety/va-bn-bg-5.jpg'}
                ],
                delay:3000
            });

            $('.ma-bg').vegas({
                slides:[
                    {src: '../imgs/material/ma-bn-bg-01.jpg'},
                    {src: '../imgs/material/ma-bn-bg-02.jpg'},
                    {src: '../imgs/material/ma-bn-bg-03.jpg'},
                    {src: '../imgs/material/ma-bn-bg-04.jpg'},
                    {src: '../imgs/material/ma-bn-bg-05.jpg'}
                ],
                delay:3500
            });
            $('.ma-mbn-bg').vegas({
                slides:[
                    {src: '../imgs/material/ma-mbn-bg-01.jpg'},
                    {src: '../imgs/material/ma-mbn-bg-02.jpg'},
                    {src: '../imgs/material/ma-mbn-bg-03.jpg'}
                ],
                delay:3500
            });

            $('.front').vegas({
                slides:[
                {src:'../imgs/consulting/co-bn-bg-1.jpg'},
                {src:'../imgs/consulting/co-bn-bg-2.jpg'},
                {src:'../imgs/consulting/co-bn-bg-3.jpg'},
                {src:'../imgs/consulting/co-bn-bg-4.jpg'},
                ],
                delay:5000
            });
            new daum.roughmap.Lander({
            "timestamp" : "1668057591157",
            "key" : "2cgvj",
            }).render();

            $(window).scroll(function(event){
                $('.ac-1').addClass('.active');
            });

            var baseFontSize = 15;

            $(".btnWrap button").on("click", zoomInOut);

            function zoomInOut(e) {
                
                if($(this).hasClass("minus")){
                if(baseFontSize <= 5) return false;
                baseFontSize--;
                }else if($(this).hasClass("plus")){
                if(baseFontSize >= 30) return false;
                baseFontSize++;
                }else{
                baseFontSize = 15;
                }

                $(".fontSize").text(baseFontSize + "px");
                $("body").css({fontSize:baseFontSize + "px"});
            }
            var textWrapper = document.querySelector('.ml3');
            textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

            anime.timeline({loop: true})
            .add({
                targets: '.ml3 .letter',
                opacity: [0,1],
                easing: "easeInOutQuad",
                duration: 2250,
                delay: (el, i) => 150 * (i+1)
            }).add({
                targets: '.ml3',
                opacity: 0,
                duration: 1000,
                easing: "easeOutExpo",
                delay: 1000
            });
        });
    </script>
</head>
<body>
    <header>
        <nav>
            <h1><a href="../smim/index.jsp" class="hd-dt-logo"><img src="../imgs/logo/logo-1.png" alt="smim logo"></a></h1>
            <h1><a href="../smim/index.jsp" class="hd-sm-logo"><img src="../imgs/logo/si-logo.png" alt="smim mb logo"></a></h1>

		 <ul class=in-sm-container>
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
                    <a href="../smim/index.jsp">smim</a>
                    <div class="hd-sub-menu">
                        <div>
                            <ul>
                                <li><a href="../smim/history.jsp">history</a></li>
                                <li><a href="../smim/material.jsp">material</a></li>
                                <li><a href="../smim/variety.jsp">variety</a></li>
                            </ul>
                            <ul>
                                <li><a href="../smim/consulting.jsp">consulting</a></li>
                                <li><a href="../board/list.jsp">community</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li><a href="#">service</a></li>
            </ul>
            
            <ul class="hd-sm-sub-menu">
                <ul>
                    <li><a href="../smim/history.jsp">history</a></li>
                    <li><a href="../smim/material.jsp">material</a></li>
                    <li><a href="../smim/variety.jsp">variety</a></li>
                    <li><a href="../smim/consulting.jsp">consulting</a></li>
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
    
    
    
    
    
    
    
    
    
    
    