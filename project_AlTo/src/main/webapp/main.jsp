<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/common.css" />
	<link rel="stylesheet" href="css/layout.css" />	
	<link rel="stylesheet" href="css/list.css" /> 
	<link rel="stylesheet" href="css/main.css" />  	 
	<script type="text/javascript">
		$(function() {
			//로그인 한 경우 메뉴 숨김
			$("#sub_menu .no_mem").css("display","none")
			$(".mem_close").click(function(){
				$("#member_section").slideUp(500)
				$("#quick_btn").show()
			})
			
			$("#quick_btn").click(function(){
				$("#member_section").slideDown(500)
				$("#quick_btn").hide()
			})			
		})
	</script>
</head> 
<body>
	<%@include file="header.jsp" %>
	
	<!-- CONTENTS -->
	<section>
		<div id="quick_btn">퀵메뉴 열기</div>
		<div id="member_section">
			<div>
				<h2>모임 바로가기</h2>
				<ul class="sub_menu">
					<li><a href="">전체목록</a></li>
					<li><a href="">설정</a></li>
				</ul>
				<ul class="my_club">
					<li>
						<a href="">
							<img src="img/hobby_img/h_001.png">
							<span class="club_name">뜨개 모임</span>
							<span class="club_schd">6/11(화) 일정이름</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="img/hobby_img/h_001.png">
							<span class="club_name">뜨개 모임</span>
							<span class="club_schd">6/11(화) 일정이름</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="img/hobby_img/h_001.png">
							<span class="club_name">뜨개 모임</span>
							<span class="club_schd">6/11(화) 일정이름</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="img/hobby_img/h_001.png">
							<span class="club_name">뜨개 모임</span>
							<span class="club_schd">6/11(화) 일정이름</span>
						</a>
					</li>
				</ul>
			</div>
			<div>
				<p class="sub_menu"><a href="">변경하기</a></p>
				<h2 class="my_area">내 지역</h2>
				<ul class="area_list">
					<li>성동구</li>
					<li>강남구</li>
					<li>용산구</li>
				</ul>
				<h2 class="my_hobby">내 취미</h2>
				<ul class="hobby_list">
					<li><img src="img/hobby_img/h_001.png"></li>
					<li><img src="img/hobby_img/h_002.png"></li>
					<li><img src="img/hobby_img/h_003.png"></li>
					<li><img src="img/hobby_img/h_004.png"></li>
					<li><img src="img/hobby_img/h_005.png"></li>
				</ul>
			</div>
			<p class="mem_close">접기</p>
		</div>
	
		<div id="ban_area">
			<div><a href=""><span>혼자 오셨어요?</span></a></div>
			<div><a href=""><span>다함께 즐기는 취미생활</span></a></div>
			<div><a href=""><span>취미!<br/>없으면 만들면 되지</span></a></div>
		</div>
				
		<div id="sec_01">
			<h2>지금 가장 '핫'한 취미</h2>
			
			<div class="swiper mySwiper">
		      <div class="swiper-wrapper">
	        	<div class="swiper-slide">
					<a href="">
						<img src="img/hobby_img/h_001.png" />
						<div>
							<span class="rank_info">1</span>
							<p class="hobby_name">창작</p>
						</div>
					</a>
				</div>
		        <div class="swiper-slide">
		        	<a href="">
						<img src="img/hobby_img/h_002.png" />
						<div>
							<span class="rank_info">2</span>
							<p class="hobby_name">액티비티</p>
						</div>
					</a>
		        </div>
		        <div class="swiper-slide">
					<a href="">
						<img src="img/hobby_img/h_003.png" />
						<div>
							<span class="rank_info">3</span>
							<p class="hobby_name">아웃도어</p>
						</div>
					</a>
				</div>
		        <div class="swiper-slide">
					<a href="">
						<img src="img/hobby_img/h_004.png" />
						<div>
							<span class="rank_info">4</span>
							<p class="hobby_name">사진/영상</p>
						</div>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="img/hobby_img/h_005.png" />
						<div>
							<span class="rank_info">5</span>
							<p class="hobby_name">음악</p>
						</div>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="img/hobby_img/h_006.png" />
						<div>
							<p class="hobby_name">게임</p>
						</div>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="img/hobby_img/h_007.png" />
						<div>
							<p class="hobby_name">여행</p>
						</div>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="img/hobby_img/h_008.png" />
						<div>
							<p class="hobby_name">요리</p>
						</div>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="img/hobby_img/h_009.png" />
						<div>
							<p class="hobby_name">문화</p>
						</div>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="img/hobby_img/h_010.png" />
						<div>
							<p class="hobby_name">봉사</p>
						</div>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="img/hobby_img/h_011.png" />
						<div>
							<p class="hobby_name">직무/커리어</p>
						</div>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="img/hobby_img/h_012.png" />
						<div>
							<p class="hobby_name">수집</p>
						</div>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="img/hobby_img/h_013.png" />
						<div>
							<p class="hobby_name">반려동물</p>
						</div>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="img/hobby_img/h_014.png" />
						<div>
							<p class="hobby_name">차/오토바이</p>
						</div>
					</a>
				</div>
				<div class="swiper-slide">
					<a href="">
						<img src="img/hobby_img/h_015.png" />
						<div>
							<p class="hobby_name">자유주제</p>
						</div>
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
		        spaceBetween: 10,
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
					<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
		        <div class="swiper-slide">
		        	<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
		        </div>
		        <div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
		        <div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
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
						<img class="class_img" src="img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>	
						<div>
							<p class="class_name">미니어처의 세계 미니어처의 세계 미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
			        <div class="swiper-slide">
			        	<img class="class_img" src="img/class_test.jpg" />
			        	<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">쉽고 정확한 조색을 위한 CMYK 푸드 컬러 차트</p>
							<p class="hobby_name">창작</p>
							<p class="class_price">1,100원</p>											
						</div>
			        </div>
			        <div class="swiper-slide">
						<img class="class_img" src="img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area area_online">온라인</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>						
						</div>
					</div>
			        <div class="swiper-slide">
						<img class="class_img" src="img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>					
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>					
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="img/class_test.jpg" />
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
			
			<div>
				<h2>추천 취미용품</h2>
				<div class="swiper mySwiper5">
			      <div class="swiper-wrapper product">
		        	<div class="swiper-slide">
						<img class="class_img" src="img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<div>
							<p class="class_name">미니어처의 세계 미니어처의 세계 미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
			        <div class="swiper-slide">
			        	<img class="class_img" src="img/class_test.jpg" />
			        	<span class="like_icon">관심</span>
						<div>
							<p class="class_name">쉽고 정확한 조색을 위한 CMYK 푸드 컬러 차트</p>
							<p class="hobby_name">창작</p>
							<p class="class_price">1,100원</p>											
						</div>
			        </div>
			        <div class="swiper-slide">
			        	<img class="class_img" src="img/class_test.jpg" />
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
			        spaceBetween: 10,
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
					<img class="club_img" src="img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
					<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
					<span class="memNum">50명</span>
					<span class="like_icon">관심</span>
				</div>
		        <div class="swiper-slide">
		        	<img class="club_img" src="img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
					<p class="club_name">미니어처의 세계</p>
					<span class="memNum">50명</span>
					<span class="like_icon">관심</span>
		        </div>
		        <div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
					<p class="club_name">미니어처의 세계</p>
					<span class="memNum">50명</span>
					<span class="like_icon">관심</span>
				</div>
		        <div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
					<p class="club_name">미니어처의 세계</p>
					<span class="memNum">50명</span>
					<span class="like_icon">관심</span>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
					<p class="club_name">미니어처의 세계</p>
					<span class="memNum">50명</span>
					<span class="like_icon">관심</span>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
					<p class="club_name">미니어처의 세계</p>
					<span class="memNum">50명</span>
					<span class="like_icon">관심</span>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
					<p class="club_name">미니어처의 세계</p>
					<span class="memNum">50명</span>
					<span class="like_icon">관심</span>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="area">성동구</span>
					<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
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
		        spaceBetween: 10,
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
					<img class="class_img" src="img/class_test.jpg" />
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
		        	<img class="class_img" src="img/class_test.jpg" />
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
					<img class="class_img" src="img/class_test.jpg" />
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
					<img class="class_img" src="img/class_test.jpg" />
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
					<img class="class_img" src="img/class_test.jpg" />
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
					<img class="class_img" src="img/class_test.jpg" />
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
					<img class="class_img" src="img/class_test.jpg" />
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
					<img class="class_img" src="img/class_test.jpg" />
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
					<img class="class_img" src="img/class_test.jpg" />
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
					<img class="class_img" src="img/class_test.jpg" />
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
			<div class="swiper mySwiper4">
		      <div class="swiper-wrapper product">
	        	<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">1</span>
						<p class="class_name">미니어처의 세계 미니어처의 세계 미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
		        <div class="swiper-slide">
		        	<img class="class_img" src="img/class_test.jpg" />
		        	<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">2</span>
						<p class="class_name">쉽고 정확한 조색을 위한 CMYK 푸드 컬러 차트</p>
						<p class="hobby_name">창작</p>
						<p class="class_price">1,100원</p>											
					</div>
		        </div>
		        <div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">3</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>						
					</div>
				</div>
		        <div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">4</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>					
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">5</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">6</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>					
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">7</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">8</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<span class="rank_info">9</span>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
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
		</div>
		
		<div id="sec_05">
			<h2>새로생긴 모임</h2>
			<div class="swiper mySwiper4">
		      <div class="swiper-wrapper club">
	        	<div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
		        <div class="swiper-slide">
		        	<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
		        </div>
		        <div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
		        <div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="img/hobby_img/h_001.png" /></span>
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
		        spaceBetween: 10,
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
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계 미니어처의 세계 미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
		        <div class="swiper-slide">
		        	<img class="class_img" src="img/class_test.jpg" />
		        	<span class="like_icon">관심</span>
					<div>
						<p class="class_name">쉽고 정확한 조색을 위한 CMYK 푸드 컬러 차트</p>
						<p class="hobby_name">창작</p>
						<p class="class_price">1,100원</p>											
					</div>
		        </div>
		        <div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>						
					</div>
				</div>
		        <div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>					
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>					
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
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
		</div>
		
		<div id="sec_07">
			<h2>신규 클래스</h2>
			<div class="swiper mySwiper3">
		      <div class="swiper-wrapper product">
	        	<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>	
					<div>
						<p class="class_name">미니어처의 세계 미니어처의 세계 미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
		        <div class="swiper-slide">
		        	<img class="class_img" src="img/class_test.jpg" />
		        	<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<p class="class_name">쉽고 정확한 조색을 위한 CMYK 푸드 컬러 차트</p>
						<p class="hobby_name">창작</p>
						<p class="class_price">1,100원</p>											
					</div>
		        </div>
		        <div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area area_online">온라인</span>	
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>						
					</div>
				</div>
		        <div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>					
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>					
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
					<span class="like_icon">관심</span>
					<span class="area">중구</span>	
					<div>
						<p class="class_name">미니어처의 세계</p>
						<p class="hobby_name">요리</p>
						<p class="class_price">11,000원</p>				
					</div>
				</div>
				<div class="swiper-slide">
					<img class="class_img" src="img/class_test.jpg" />
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
	
	<%@include file="footer.jsp" %>
</body>
</html>