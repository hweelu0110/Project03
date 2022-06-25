<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<%@include file="../headinfo.jsp" %>
	<link rel="stylesheet" href="../css/list.css" /> 	
	<link rel="stylesheet" href="../css/club.css" /> 
	
	<script type="text/javascript">
		$(function() {
			$("#tab_area").css("display","none")
			$("#m_cate").css("display","none")
			$("#s_cate").css("display","none")
			$("#area_list").css("display","none")
			
			/* tab메뉴 선택 시 - 영역 노출하기 */
			$("#tab_menu li").filter(":first").click(function() {
				$("#tab_area").toggle()
				$("#m_cate").toggle()
				
				if ($("#m_cate ul").find("li").hasClass('select')) {
					$("#s_cate").show()
				}else {
					$("#s_cate").hide()
				}				
			})
			
			$("#tab_menu li").filter(":last").click(function() {
				$("#tab_area").toggle()
				$("#area_list").toggle()
			})
			
			/* 메인카테고리 선택 시 - 서브카테고리 영역 노출 */
			$("#m_cate ul li").click(function() {
				$(this).toggleClass("select")
				$("#m_cate ul li.all").removeClass("select")
				
				if ($("#m_cate ul").find("li").hasClass('select')) {
					$("#s_cate").show()
					if(!($("#tab_menu").find("li").hasClass('select'))) {
						$("#tab_menu li").addClass("select")
					}
					$("#tab_menu li").removeClass("select")
				}else {
					$("#s_cate").hide()
					$("#m_cate ul li.all").addClass("select")
					$("#tab_menu li").removeClass("select")
				}
			})
			
			/* 클럽개설 버튼 팝업 */
			$("#open_btn").mouseover(function() {
				$("div.info_div").show()
			})
			$("#open_btn").mouseout(function() {
				$("div.info_div").hide()
			})
			
			/* select 정렬선택 */
			$("#selectBoxArea div").filter(":first").click(function() {
				$("div.select_list").toggle()
			})
			
			
		})
	</script>
</head>
<body>
	<%@include file="../header.jsp" %>
	
	<!-- CONTENTS -->
	<section>
		<ul id="tab_menu">
			<li class="select">창작</li>
			<li>성동구&nbsp;용산구&nbsp;중구</li>
		</ul>
		
		<div id="tab_area">
			<div id="m_cate">
				<ul>
					<li class="all"><a href="">전체</a></li>
					<li class="select">
						<img src="../img/hobby_img/h_001.png" />
						<p class="hobby_name">창작</p>
					</li>
			        <li>
						<img src="../img/hobby_img/h_002.png" />
						<p class="hobby_name">액티비티</p>
			        </li>
			        <li>
						<img src="../img/hobby_img/h_003.png" />
						<p class="hobby_name">아웃도어</p>
					</li>
			        <li>
						<img src="../img/hobby_img/h_004.png" />
						<p class="hobby_name">사진/영상</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_005.png" />
						<p class="hobby_name">음악</p>	
					</li>
					<li>
						<img src="../img/hobby_img/h_006.png" />
						<p class="hobby_name">게임</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_007.png" />
						<p class="hobby_name">여행</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_008.png" />
						<p class="hobby_name">요리</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_009.png" />
						<p class="hobby_name">문화</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_010.png" />
						<p class="hobby_name">봉사</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_011.png" />
						<p class="hobby_name">직무/커리어</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_012.png" />
						<p class="hobby_name">수집</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_013.png" />
						<p class="hobby_name">반려동물</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_014.png" />
						<p class="hobby_name">차/오토바이</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_015.png" />
						<p class="hobby_name">자유주제</p>
					</li>
				</ul>
			</div>
			<div id="s_cate">
				<ul>
					<li class="select">전체</li>
					<li>드로잉</li>
					<li>공예</li>
					<li>DIY</li>
				</ul>
			</div>
			<div id="area_list" class="">
				<ul>
					<li class="online">온라인</li>
					<li>전체</li>
					<li>강남구</li>
					<li>강동구</li>
					<li>강북구</li>
					<li>강서구</li>
					<li>관악구</li>
					<li>광진구</li>
					<li>구로구</li>
					<li>금천구</li>
					<li>노원구</li>
					<li>도봉구</li>
					<li>동대문구</li>
					<li>동작구</li>
					<li>마포구</li>
					<li>서대문구</li>
					<li>서초구</li>
					<li class="select">성동구</li>
					<li>성북구</li>
					<li>송파구</li>
					<li>양천구</li>
					<li>영등포구</li>
					<li class="select">용산구</li>
					<li>은평구</li>
				</ul>
			</div>
			<button type="button" id="opSearch_btn">선택 조건으로 검색</button>
		</div>
		
		<div id="selectBoxArea">
			<div class="selectBox">Best순</div>
			<div class="selectBox select_list">
				<ul>
					<li>회원수 많은</li>
					<li>회원수 적은</li>
					<li>최근 일정</li>
					<li>신규</li>
					<li>오래된</li>
				</ul>
			</div>
		</div>
		
		
		<div id="search_result">
			<h2>검색 결과</h2>
			<div id="sec_05">
				<h2>모임</h2>
				<div class="swiper mySwiper4">
			      <div class="swiper-wrapper club">
		        	<div class="swiper-slide">
						<img class="club_img" src="../img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../img/hobby_img/h_001.png" /></span>
							<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
							<span class="memNum">50명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
					</div>
			        <div class="swiper-slide">
			        	<img class="club_img" src="../img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../img/hobby_img/h_001.png" /></span>
							<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
							<span class="memNum">50명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
			        </div>
			        <div class="swiper-slide">
						<img class="club_img" src="../img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../img/hobby_img/h_001.png" /></span>
							<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
							<span class="memNum">50명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
					</div>
			        <div class="swiper-slide">
						<img class="club_img" src="../img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../img/hobby_img/h_001.png" /></span>
							<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
							<span class="memNum">50명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
					</div>
					<div class="swiper-slide">
						<img class="club_img" src="../img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../img/hobby_img/h_001.png" /></span>
							<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
							<span class="memNum">50명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
					</div>
					<div class="swiper-slide">
						<img class="club_img" src="../img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../img/hobby_img/h_001.png" /></span>
							<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
							<span class="memNum">50명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
					</div>
					<div class="swiper-slide">
						<img class="club_img" src="../img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../img/hobby_img/h_001.png" /></span>
							<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
							<span class="memNum">50명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
					</div>
					<div class="swiper-slide">
						<img class="club_img" src="../img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../img/hobby_img/h_001.png" /></span>
							<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
							<span class="memNum">50명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
					</div>
			      </div>
			      <div class="swiper-button-next"></div>
			      <div class="swiper-button-prev"></div>
			    </div>					
			</div>
			
			<div id="sec_03">
				<h2>클래스</h2>
				
				<div class="swiper mySwiper4">
			      <div class="swiper-wrapper product">
		        	<div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>	
						<div>
							<p class="class_name">미니어처의 세계 미니어처의 세계 미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
			        <div class="swiper-slide">
			        	<img class="class_img" src="../img/class_test.jpg" />
			        	<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">쉽고 정확한 조색을 위한 CMYK 푸드 컬러 차트</p>
							<p class="hobby_name">창작</p>
							<p class="class_price">1,100원</p>											
						</div>
			        </div>
			        <div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area area_online">온라인</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>						
						</div>
					</div>
			        <div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>					
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>					
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<span class="area">중구</span>	
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
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
			
			<div id="sec_04">
				<h2>취미용품</h2>
				<div class="swiper mySwiper4">
			      <div class="swiper-wrapper product">
		        	<div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<div>
							<p class="class_name">미니어처의 세계 미니어처의 세계 미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
			        <div class="swiper-slide">
			        	<img class="class_img" src="../img/class_test.jpg" />
			        	<span class="like_icon">관심</span>
						<div>
							<p class="class_name">쉽고 정확한 조색을 위한 CMYK 푸드 컬러 차트</p>
							<p class="hobby_name">창작</p>
							<p class="class_price">1,100원</p>											
						</div>
			        </div>
			        <div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>						
						</div>
					</div>
			        <div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>					
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>					
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
						<span class="like_icon">관심</span>
						<div>
							<p class="class_name">미니어처의 세계</p>
							<p class="hobby_name">요리</p>
							<p class="class_price">11,000원</p>				
						</div>
					</div>
					<div class="swiper-slide">
						<img class="class_img" src="../img/class_test.jpg" />
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
			
		</div>		
	</section>
	
	<%@include file="../footer.jsp" %>
</body>
</html>