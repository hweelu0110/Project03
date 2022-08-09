<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="hobbyList" value="${clubMainMap.AllHobbyList}"/>
<c:set var="bestList" value="${clubMainMap.bestClubList}"/>
<c:set var="newList" value="${clubMainMap.newClubList}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<link rel="stylesheet" href="${path}/resources/css/common/list.css" />
	<link rel="stylesheet" href="${path}/resources/css/club/clubMain.css" /> 
	<script type="text/javascript">
		$(function () {
			$(".like_icon").click(function() {
				if ('${login}' != ''){
					alert('${login}')
					alert("로그인 상태")
					confirmPopup($("#confirm_popup"), "관심목록에 추가되었습니다.")
				}else {
					alert('${login}')
				 	alert("비로그인 상태")
					confirmPopup($("#login_popup"), "관심추가는 로그인이 필요합니다.")
				}	
				
			})
		})
	</script>
</head>
<body>	
	<!-- CONTENTS -->
	<section>
		<div id="cate_menu">
			<ul>
				<c:forEach var="hobby" items="${hobbyList}">
					<li>
						<a href="">
							<img src="../resources/img/hobby_img/${hobby.hobby_code}.png" />
							<span class="hobby_name">${hobby.name}</span>
						</a>
					</li>				
				</c:forEach>				
			</ul>
		</div>
		
		<div id="sec_02">
			<h2>BEST 모임</h2>
			
		    <div class="swiper mySwiper2">
		      <div class="swiper-wrapper">
		      
		      	<c:forEach var="best" items="${bestList}">
		      		<div class="swiper-slide">
						<img class="club_img" src="${path}/resources/img/club_test.png" />
						<span class="area">${best.area_name}</span>
						<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${best.cate_m}.png" /></span>
						<p class="club_name">${best.title}</p>
						<span class="memNum">${best.member_num}명</span>
						<span class="like_icon">관심</span>
					</div>
		      	</c:forEach>
	        	
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
		
		<div id="sec_05">
			<h2>새로생긴 모임</h2>
			<div class="swiper mySwiper4">
		      <div class="swiper-wrapper club">
		      
		      	<c:forEach var="brandnew" items="${newList}">		      		
		      		<div class="swiper-slide">
						<img class="club_img" src="${path}/resources/img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">${brandnew.area_name}</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${brandnew.cate_m}.png" /></span>
							<p class="club_name">${brandnew.title}</p>
							<span class="memNum">${brandnew.member_num}명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
					</div>					
		      	</c:forEach>	
		      	        	
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
		
		<div id="pop_hobby">
			<h2>인기취미 모임</h2>
			<ul>
				<li>
					<img src="../resources/img/hobby_img/h_001.png" />
					<span class="rank_info">1</span>
					<p class="hobby_name">창작</p>
				</li>
		        <li>
					<img src="../resources/img/hobby_img/h_002.png" />
					<span class="rank_info">2</span>
					<p class="hobby_name">액티비티</p>
		        </li>
		        <li>
					<img src="../resources/img/hobby_img/h_003.png" />
					<span class="rank_info">3</span>
					<p class="hobby_name">아웃도어</p>
				</li>
			</ul>
			
			<div id="pop_list">
				<div class="swiper mySwiper6">
			      <div class="swiper-wrapper club">
		        	<div class="swiper-slide">
						<img class="club_img" src="../resources/img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
							<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
							<span class="memNum">50명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
					</div>
			        <div class="swiper-slide">
			        	<img class="club_img" src="../resources/img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
							<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
							<span class="memNum">50명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
			        </div>
			        <div class="swiper-slide">
						<img class="club_img" src="../resources/img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
							<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
							<span class="memNum">50명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
					</div>
			        <div class="swiper-slide">
						<img class="club_img" src="../resources/img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
							<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
							<span class="memNum">50명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
					</div>
					<div class="swiper-slide">
						<img class="club_img" src="../resources/img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
							<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
							<span class="memNum">50명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
					</div>
					<div class="swiper-slide">
						<img class="club_img" src="../resources/img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
							<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
							<span class="memNum">50명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
					</div>
					<div class="swiper-slide">
						<img class="club_img" src="../resources/img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
							<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
							<span class="memNum">50명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
					</div>
					<div class="swiper-slide">
						<img class="club_img" src="../resources/img/club_test.png" />
						<span class="like_icon">관심</span>
						<span class="area">성동구</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
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
			      var swiper = new Swiper(".mySwiper6", {
			        slidesPerView: 3,
			        spaceBetween: 20,
			        slidesPerGroup: 3,
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
		
		
		
		<div id="sec_06">
			<h2>사람많은 모임</h2>
			<div class="swiper mySwiper4">
		      <div class="swiper-wrapper club">
	        	<div class="swiper-slide">
					<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
		        <div class="swiper-slide">
		        	<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
		        </div>
		        <div class="swiper-slide">
					<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
		        <div class="swiper-slide">
					<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
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
		
		<div id="sec_07">
			<h2>빠른 일정 모임</h2>
			<div class="swiper mySwiper4">
		      <div class="swiper-wrapper club">
	        	<div class="swiper-slide">
					<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
		        <div class="swiper-slide">
		        	<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
		        </div>
		        <div class="swiper-slide">
					<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
		        <div class="swiper-slide">
					<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
					</div>
				</div>
				<div class="swiper-slide">
					<img class="club_img" src="../resources/img/club_test.png" />
					<span class="like_icon">관심</span>
					<span class="area">성동구</span>
					<div class="club_info">
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
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
		
	</section>
	<%@include file="../layout/common_popup.jsp" %>
</body>
</html>