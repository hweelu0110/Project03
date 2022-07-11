<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<title>AlTo - 혼자, 다같이 Alone Together</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="resources/css/reset.css" />
	<link rel="stylesheet" href="resources/css/common.css" />
	<link rel="stylesheet" href="resources/css/layout.css" />	
	<link rel="stylesheet" href="resources/css/list.css" /> 
	<link rel="stylesheet" href="resources/css/main.css" />  
	<script src="resources/js/common.js"></script>		 
	<script type="text/javascript">
		function quickList() {
			//모임 바로가기 출력
			let lis = $("#clubQuikList .my_club").children().length
			$("#member_section .my_club").html("")
			for (let i = 1 ; i <= lis ; i++) {					
				if ($("#clubQuikList .my_club li:nth-child("+i+")").hasClass("select")) {		
					$("#member_section .my_club").append("<li>"
							+ "<a href='"+$("#clubQuikList .my_club li:nth-child("+i+")").children('a').attr('href')+"'>"
							+ "<img src='"+$("#clubQuikList .my_club li:nth-child("+i+") a").children('img').attr('src')+"' />"
							+ "<span class='club_name'>"+$("#clubQuikList .my_club li:nth-child("+i+")").find('.club_name').text()+"</span>"
							+ "<span class='club_schd'>"+$("#clubQuikList .my_club li:nth-child("+i+")").find('.club_schd').text()+"</span>"
							+"</a></li>")
				}
			}
			
			if ($("#clubQuikList").css("display","block")) {
				$("#clubQuikList").hide()
			}
		}
		
		$(function() {			
			//로그인 한 경우 서브 메뉴 숨김
			$("#sub_menu .no_mem").css("display","none")
			$(".mem_close").click(function(){
				$("#member_section").slideUp(500)
				$("#quick_btn").show()
			})
			
			$("#quick_btn").click(function(){
				$("#member_section").slideDown(500)
				$("#quick_btn").hide()
			})
			
			//모임 바로 가기 수정하기
			$("#member_section div .sub_menu li:nth-child(2)").click(function() {
				$("#clubQuikList").css({
	                "top": (($(window).height()-$("#clubQuikList").outerHeight())/2+$(window).scrollTop())+"px",
	                "left": (($(window).width()-$("#clubQuikList").outerWidth())/2+$(window).scrollLeft())+"px"	             
	             }); 
				
				$("#clubQuikList").show()
			})
			
			//모임 바로가기 팝업창 기능
			$("#clubQuikList .my_club li").click(function (e) {
				e.preventDefault();
				$(this).toggleClass("select")
			})
						
			quickList()			
			
		})
	</script>
</head> 
<body>
	<!-- HEADER -->
	<header>
		<div>
			<h1 id="logo"><a href="main.jsp">AlTo Alone Together</a></h1>
			<nav>
				<ul id="main_menu">
					<li><a href="club/clubMain.jsp">모임</a></li>
					<li><a href="class/classMain.jsp">클래스</a></li>
					<li><a href="item/itemMain.jsp">취미용품</a></li>
				</ul>
			</nav>
			<form action="allSearch.jsp" id="allSearch" name="allSearchForm" method="post">
				<input type="text" id="allSearch_keyword" name="keyword" value="취미를 검색해보세요!" />
				<input type="submit" id="search_btn" value="검색" />
			</form> 
			<ul id="sub_menu">
				<li class="no_mem"><a href="">로그인</a></li>
				<li class="mem"><a href="">로그아웃</a></li>
				<li class="no_mem"><a href="">회원가입</a></li>
				<li class="mem"><a href="">마이페이지</a></li>
				<li>FAQ</li>
			</ul>
		</div>		
	</header>
	
	<!-- Top Banner Area -->
	<div id="ban_area">
		<div>
			<div><a href=""><span>혼자 오셨어요?</span></a></div>
			<div><a href=""><span>다함께 즐기는 취미생활</span></a></div>
			<div><a href=""><span>취미!<br/>없으면 만들면 되지</span></a></div>
		</div>		
	</div>
	
	<!-- Login Main Contents -->
	<div id="quick_btn">퀵메뉴 열기</div>
	<div id="member_section">
		<div>
			<h2>모임 바로가기</h2>
			<ul class="sub_menu">
				<li><a href="">전체목록</a></li>
				<li>설정</li>
			</ul>
			<ul class="my_club">
				
			</ul>
		</div>
		<div>
			<p class="sub_menu"><a href="">내정보수정</a></p>
			<h2 class="my_area">내 지역</h2>
			<ul class="area_list">
				<li>성동구</li>
				<li>강남구</li>
				<li>용산구</li>
			</ul>
			<h2 class="my_hobby">내 취미</h2>
			<ul class="hobby_list">
				<li><img src="resources/img/hobby_img/h_001.png"></li>
				<li><img src="resources/img/hobby_img/h_002.png"></li>
				<li><img src="resources/img/hobby_img/h_003.png"></li>
				<li><img src="resources/img/hobby_img/h_004.png"></li>
				<li><img src="resources/img/hobby_img/h_005.png"></li>
			</ul>
		</div>
		<p class="mem_close">접기</p>
	</div>
	
	<!-- CONTENTS -->
	<section>				
		<div id="sec_01">
			<h2>지금 가장 '핫'한 취미</h2>
			
			<div class="swiper mySwiper">
		      <div class="swiper-wrapper">
	        	<div class="swiper-slide">
					<a href="">
						<img src="resources/img/hobby_img/h_001.png" />
						<span class="rank_info">1</span>
						<span class="hobby_name">창작</span>
					</a>
				</div>
		        <div class="swiper-slide">
		        	<a href="">
						<img src="resources/img/hobby_img/h_002.png" />
						<span class="rank_info">2</span>
						<span class="hobby_name">액티비티</span>
					</a>
		        </div>
		        <div class="swiper-slide">
					<a href="">
						<img src="resources/img/hobby_img/h_003.png" />
						<span class="rank_info">3</span>
						<span class="hobby_name">아웃도어</span>
					</a>
				</div>
		        <div class="swiper-slide">
					<a href="">
						<img src="resources/img/hobby_img/h_004.png" />
						<span class="rank_info">4</span>
						<span class="hobby_name">사진/영상</span>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="resources/img/hobby_img/h_005.png" />
						<span class="rank_info">5</span>
						<span class="hobby_name">음악</span>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="resources/img/hobby_img/h_006.png" />
						<span class="hobby_name">게임</span>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="resources/img/hobby_img/h_007.png" />
						<span class="hobby_name">여행</span>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="resources/img/hobby_img/h_008.png" />
						<span class="hobby_name">요리</span>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="resources/img/hobby_img/h_009.png" />
						<span class="hobby_name">문화</span>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="resources/img/hobby_img/h_010.png" />
						<span class="hobby_name">봉사</span>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="resources/img/hobby_img/h_011.png" />
						<span class="hobby_name">직무/커리어</span>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="resources/img/hobby_img/h_012.png" />
						<span class="hobby_name">수집</span>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="resources/img/hobby_img/h_013.png" />
						<span class="hobby_name">반려동물</span>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="resources/img/hobby_img/h_014.png" />
						<span class="hobby_name">차/오토바이</span>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="resources/img/hobby_img/h_015.png" />
						<span class="hobby_name">자유주제</span>
					</a>
				</div>
		      </div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
	    	</div>
		    <!-- Initialize Swiper -->
		    <script>
		      var swiper = new Swiper(".mySwiper", {
		        slidesPerView: 8,
		        spaceBetween: 20,
		        slidesPerGroup: 8,
		        loop: false,
		        loopFillGroupWithBlank: true,
		        navigation: {
		          nextEl: ".swiper-button-next",
		          prevEl: ".swiper-button-prev",
		        },
		      });
		    </script>
		</div>
		
		<div id="sec_member">
			<h2>추천 모임</h2>
			<div class="swiper mySwiper4">
		      <div class="swiper-wrapper club">
	        	<div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
		        <div class="swiper-slide">
		        	<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
		        </div>
		        <div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
		        <div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
		      </div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
			</div>
			
			<div class="float_left">
				<h2>추천 클래스</h2>
				<div class="swiper mySwiper5">
			      <div class="swiper-wrapper product">
		        	<div class="swiper-slide">
						<img class="class_img" src="resources/img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>	
						<div>
							<p class="class_name">미니어처의 세계 미니어처의 세계 미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
			        <div class="swiper-slide">
			        	<img class="class_img" src="resources/img/class_test.jpg" />
			        	<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">쉽고 정확한 조색을 위한 CMYK 푸드 컬러 차트</p>
							<p class="hobby_name">창작</p>
							<p class="class_price">1,100원</p>											
						</div>
			        </div>
			        <div class="swiper-slide">
						<img class="class_img" src="resources/img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area area_online">온라인</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>						
						</div>
					</div>
			        <div class="swiper-slide">
						<img class="class_img" src="resources/img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>					
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="resources/img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="resources/img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>					
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="resources/img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="resources/img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>				
			      </div>
			      <div class="swiper-button-next"></div>
			      <div class="swiper-button-prev"></div>
			    </div>
			</div>
			
			<div class="float_right">
				<h2>추천 취미용품</h2>
				<div class="swiper mySwiper5">
			      <div class="swiper-wrapper product">
		        	<div class="swiper-slide">
						<img class="class_img" src="resources/img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<div>
							<p class="class_name">미니어처의 세계 미니어처의 세계 미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
			        <div class="swiper-slide">
			        	<img class="class_img" src="resources/img/class_test.jpg" />
			        	<span class="like_icon">관심</span>
						<div>
							<p class="class_name">쉽고 정확한 조색을 위한 CMYK 푸드 컬러 차트</p>
							<p class="hobby_name">창작</p>
							<p class="class_price">1,100원</p>											
						</div>
			        </div>
			        <div class="swiper-slide">
			        	<img class="class_img" src="resources/img/class_test.jpg" />
			        	<span class="like_icon">관심</span>
						<div>
							<p class="class_name">쉽고 정확한 조색을 위한 CMYK 푸드 컬러 차트</p>
							<p class="hobby_name">창작</p>
							<p class="class_price">1,100원</p>											
						</div>
			        </div>
			      </div>
			      <div class="swiper-button-next"></div>
			      <div class="swiper-button-prev"></div>
			   </div>
			    <!-- Initialize Swiper -->
			    <script>
			      var swiper = new Swiper(".mySwiper5", {
			        slidesPerView: 2,
			        spaceBetween: 30,
			        slidesPerGroup: 2,
			        loop: false,
			        loopFillGroupWithBlank: true,
			        navigation: {
			          nextEl: ".swiper-button-next",
			          prevEl: ".swiper-button-prev",
			        },
			      });
			    </script>			
			</div>				
		</div>
		
		<div id="sec_02">
			<h2>BEST 모임</h2>
			
		    <div class="swiper mySwiper2">
		      <div class="swiper-wrapper">
	        	<div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
					<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
					<span class="memNum">50명</span>
					<span class="like_icon">관심</span>
				</div>
		        <div class="swiper-slide">
		        	<img class="club_img" src="resources/img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
					<p class="club_name">미니어처의 세계</p>
					<span class="memNum">50명</span>
					<span class="like_icon">관심</span>
		        </div>
		        <div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
					<p class="club_name">미니어처의 세계</p>
					<span class="memNum">50명</span>
					<span class="like_icon">관심</span>
				</div>
		        <div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
					<p class="club_name">미니어처의 세계</p>
					<span class="memNum">50명</span>
					<span class="like_icon">관심</span>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
					<p class="club_name">미니어처의 세계</p>
					<span class="memNum">50명</span>
					<span class="like_icon">관심</span>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
					<p class="club_name">미니어처의 세계</p>
					<span class="memNum">50명</span>
					<span class="like_icon">관심</span>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
					<p class="club_name">미니어처의 세계</p>
					<span class="memNum">50명</span>
					<span class="like_icon">관심</span>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
					<p class="club_name">미니어처의 세계</p>
					<span class="memNum">50명</span>
					<span class="like_icon">관심</span>
				</div>
		      </div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
		    </div>
			
			<!-- Initialize Swiper -->
		    <script>
		      var swiper = new Swiper(".mySwiper2", {
		        slidesPerView: 4,
		        spaceBetween: 20,
		        slidesPerGroup: 4,
		        loop: false,
		        loopFillGroupWithBlank: true,
		        navigation: {
		          nextEl: ".swiper-button-next",
		          prevEl: ".swiper-button-prev",
		        },
		      });
		    </script>
		</div>
		
		<div id="sec_03">
			<h2>실시간 인기 클래스</h2>
			
			<div class="swiper mySwiper3">
		      <div class="swiper-wrapper product">
	        	<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>	
					<div>
						<span class="rank_info">1</span>
						<p class="class_name">미니어처의 세계 미니어처의 세계 미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
		        <div class="swiper-slide">
		        	<img class="class_img" src="resources/img/class_test.jpg" />
		        	<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<span class="rank_info">2</span>
						<p class="class_name">쉽고 정확한 조색을 위한 CMYK 푸드 컬러 차트</p>
						<p class="hobby_name">창작</p>
						<p class="class_price">1,100원</p>											
					</div>
		        </div>
		        <div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area area_online">온라인</span>	
					<div>
						<span class="rank_info">3</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>						
					</div>
				</div>
		        <div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<span class="rank_info">4</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>					
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<span class="rank_info">5</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<span class="rank_info">6</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>					
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<span class="rank_info">7</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<span class="rank_info">8</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<span class="rank_info">9</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<span class="rank_info">10</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
		      </div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
		    </div>
		</div>
		
		<div id="sec_04">
			<h2>지금 가장 잘 나가는 취미용품</h2>
			<div class="swiper mySwiper6">
		      <div class="swiper-wrapper product">
	        	<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">1</span>
						<p class="class_name">미니어처의 세계 미니어처의 세계 미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
		        <div class="swiper-slide">
		        	<img class="class_img" src="resources/img/class_test.jpg" />
		        	<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">2</span>
						<p class="class_name">쉽고 정확한 조색을 위한 CMYK 푸드 컬러 차트</p>
						<p class="hobby_name">창작</p>
						<p class="class_price">1,100원</p>											
					</div>
		        </div>
		        <div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">3</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>						
					</div>
				</div>
		        <div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">4</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>					
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">5</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">6</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>					
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">7</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">8</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">9</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">10</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
		      </div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
		    </div>
		     <!-- Initialize Swiper -->
		    <script>
		      var swiper = new Swiper(".mySwiper6", {
		        slidesPerView: 5,
		        spaceBetween: 30,
		        slidesPerGroup: 5,
		        loop: false,
		        loopFillGroupWithBlank: true,
		        navigation: {
		          nextEl: ".swiper-button-next",
		          prevEl: ".swiper-button-prev",
		        },
		      });
		    </script>
		</div>
		
		<div id="sec_05">
			<h2>새로생긴 모임</h2>
			<div class="swiper mySwiper4">
		      <div class="swiper-wrapper club">
	        	<div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
		        <div class="swiper-slide">
		        	<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
		        </div>
		        <div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
		        <div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
		      </div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>		      
		    </div>
			
			<!-- Initialize Swiper -->
		    <script>
		      var swiper = new Swiper(".mySwiper4", {
		        slidesPerView: 5,
		        spaceBetween: 20,
		        slidesPerGroup: 5,
		        loop: false,
		        loopFillGroupWithBlank: true,
		        navigation: {
		          nextEl: ".swiper-button-next",
		          prevEl: ".swiper-button-prev",
		        },
		      });
		    </script>
		</div>
		
		<div id="sec_06">
			<h2>취미 신상</h2>
			<div class="swiper mySwiper3">
		      <div class="swiper-wrapper product">
	        	<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계 미니어처의 세계 미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
		        <div class="swiper-slide">
		        	<img class="class_img" src="resources/img/class_test.jpg" />
		        	<span class="like_icon">관심</span>
					<div>
						<p class="class_name">쉽고 정확한 조색을 위한 CMYK 푸드 컬러 차트</p>
						<p class="hobby_name">창작</p>
						<p class="class_price">1,100원</p>											
					</div>
		        </div>
		        <div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>						
					</div>
				</div>
		        <div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>					
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>					
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
		      </div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
		    </div>
		     <!-- Initialize Swiper -->
		    <script>
		      var swiper = new Swiper(".mySwiper3", {
		        slidesPerView: 8,
		        spaceBetween: 20,
		        slidesPerGroup: 8,
		        loop: false,
		        loopFillGroupWithBlank: true,
		        navigation: {
		          nextEl: ".swiper-button-next",
		          prevEl: ".swiper-button-prev",
		        },
		      });
		    </script>
		</div>
		
		<div id="sec_07">
			<h2>신규 클래스</h2>
			<div class="swiper mySwiper3">
		      <div class="swiper-wrapper product">
	        	<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>	
					<div>
						<p class="class_name">미니어처의 세계 미니어처의 세계 미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
		        <div class="swiper-slide">
		        	<img class="class_img" src="resources/img/class_test.jpg" />
		        	<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<p class="class_name">쉽고 정확한 조색을 위한 CMYK 푸드 컬러 차트</p>
						<p class="hobby_name">창작</p>
						<p class="class_price">1,100원</p>											
					</div>
		        </div>
		        <div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area area_online">온라인</span>	
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>						
					</div>
				</div>
		        <div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>					
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>					
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="resources/img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
		      </div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
		    </div>
			
			<!-- Initialize Swiper -->
		    <script>
		      var swiper = new Swiper(".mySwiper3", {
		        slidesPerView: 5,
		        spaceBetween: 35,
		        slidesPerGroup: 5,
		        loop: false,
		        loopFillGroupWithBlank: true,
		        navigation: {
		          nextEl: ".swiper-button-next",
		          prevEl: ".swiper-button-prev",
		        },
		      });
		    </script>
		</div>
		
		
	</section>
	
	<!-- 내모임 바로가기 수정 팝업 -->
	<div id="clubQuikList" class="popup_div">
		<h4>모임 바로가기 설정</h4>
		<button type="button" name="closeBtn" class="closeBtn_style">닫기</button>
		<ul class="my_club">
			<li class="select">
				<a href="">
					<img src="resources/img/hobby_img/h_001.png">
					<span class="club_name">뜨개 모임1</span>
					<span class="club_schd">6/11(화) 일정이름</span>
				</a>
			</li>
			<li class="select">
				<a href="">
					<img src="resources/img/hobby_img/h_002.png">
					<span class="club_name">운동하자</span>
					<span class="club_schd">6/22(수) 일정이름2</span>
				</a>
			</li>
			<li class="select">
				<a href="">
					<img src="resources/img/hobby_img/h_003.png">
					<span class="club_name">캠핑클럽 :: 바깥바람 쐽시다</span>
					<span class="club_schd">6/25(토) 일정이름3</span>
				</a>
			</li>
			<li>
				<a href="">
					<img src="resources/img/hobby_img/h_004.png">
					<span class="club_name">사진의 고수</span>
					<span class="club_schd"></span>
				</a>
			</li>
			<li class="select">
				<a href="">
					<img src="resources/img/hobby_img/h_005.png">
					<span class="club_name">보컬 트레이닝</span>
					<span class="club_schd"></span>
				</a>
			</li>
		</ul>
		<button type="button" name="clubQuikBtn" class="basicBtn" onclick="return quickList()" >변경</button>
	</div>
	
	<%@include file="../../layout/common_popup.jsp" %>
	
	<!-- FOOTER -->
	<footer>
		<div>
			<ul>
				<li class="first">서비스이용약관</li>
				<li>개인정보처리방침</li>
				<li>1:1 문의</li>
			</ul>
			<p><span>AlTo 알토</span> _ 혼자, 다같이 Alone, Together</p>
			<div>
				<p>대표자 : 알토 사업자정보확인 개인정보관리책임자: 알토 사업자등록번호 : 123-45-67890</p>
				<p>사업장 : 서울특별시 서초구 서초대로77길 54(서초더블유타원 13,14층)</p>
				<p>1:1 문의 운영 시간 (평일/주말 09시~18시, 공휴일 휴무) 고객센터 : 1234-4567</p>
			</div>
			<p class="f_copy">Copyright by AlTo. All rights reserved.</p>			
		</div>
	</footer>
</body>
</html>