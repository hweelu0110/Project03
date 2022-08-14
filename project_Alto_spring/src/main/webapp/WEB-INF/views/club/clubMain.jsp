<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="hobbyList" value="${clubMainMap.AllHobbyList}"/>
<c:set var="likeList" value="${clubMainMap.memlikeList}" />
<c:set var="bestList" value="${clubMainMap.bestClubList}"/>
<c:set var="newList" value="${clubMainMap.newClubList}" />
<c:set var="peoList" value="${clubMainMap.peoClubList}" />
<c:set var="topHobby" value="${clubMainMap.topHobby}" />

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
				let selectItem = $(this)
				let codeNum, codeType
				let mem_id = '${login.mem_id}'
				
				if ('${login}' != ''){
					alert(mem_id)
					if ($(this).siblings('#club_code').val() != null) {
						codeNum = $(this).siblings('#club_code').val()
						codeType = 'club_code'
					}else if ($(this).siblings('#class_code').val() != null) {
						codeNum = $(this).siblings('#class_code').val()
						codeType = 'class_code'
					}else if ($(this).siblings('#item_code').val() != null) {
						codeNum = $(this).siblings('#item_code').val()
						codeType = 'item_code'
					}
					
					
					if ($(this).hasClass("select")){
						$(this).removeClass("select")
						
						$.ajax({
							url: "${path}/mypage/likeDel.do",
							type: "Get",
							data: {codeNum: codeNum, codeType: codeType, mem_id: mem_id},
							dataType: "text",
							success: function(data) {
								confirmPopup($("#like_popup"), "관심 해제 완료!")
							},
							error: function(data) {
								alert("오류가 발생했습니다. 다시 시도해 주세요.")
							}
							
						})	
						
					} else {
						$(this).addClass("select")
						
						$.ajax({
							url: "${path}/mypage/likeAdd.do",
							type: "Get",
							data: {codeNum: codeNum, codeType: codeType, mem_id: mem_id},
							dataType: "text",
							success: function(data) {
								confirmPopup($("#like_popup"), "관심 목록 추가 완료!")
							},
							error: function(data) {
								alert("오류가 발생했습니다. 다시 시도해 주세요.")
							}
							
						})
					}
					
					
					
				}else {
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
							<img src="${path}/resources/img/hobby_img/${hobby.hobby_code}.png" />
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
						
						<c:forEach var="like" items="${likeList}">
							<c:if test="${like.club_code eq best.club_code}">
								<c:set var="in" value="true" />
							</c:if>
						</c:forEach>
						<c:choose>
							<c:when test="${in}">
								<span class="like_icon select">관심</span>
								<c:set var="in" value="false" />
							</c:when>
							<c:otherwise>
								<span class="like_icon">관심</span>
							</c:otherwise>
						</c:choose>
						
						<input type="hidden" name="club_code" id="club_code" value="${best.club_code}" />
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
						
						<c:forEach var="like" items="${likeList}">
							<c:if test="${like.club_code eq brandnew.club_code}">
								<c:set var="in" value="true" />
							</c:if>
						</c:forEach>
						<c:choose>
							<c:when test="${in}">
								<span class="like_icon select">관심</span>
								<c:set var="in" value="false" />
							</c:when>
							<c:otherwise>
								<span class="like_icon">관심</span>
							</c:otherwise>
						</c:choose>
						
						<span class="area">${brandnew.area_name}</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${brandnew.cate_m}.png" /></span>
							<p class="club_name">${brandnew.title}</p>
							<span class="memNum">${brandnew.member_num}명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
						<input type="hidden" name="club_code" id="club_code" value="${brandnew.club_code}" />
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
				<c:forEach var="top" items="${topHobby}" varStatus="sts">
					<li>
						<img src="${path}/resources/img/hobby_img/${top.CATE_M}.png" />
						<span class="rank_info">${sts.count}</span>
						<p class="hobby_name">${top.NAME}</p>
					</li>
				</c:forEach>
			</ul>
			
			<div id="pop_list">
				<div class="swiper mySwiper6">
			      <div class="swiper-wrapper club">
			      
					<c:forEach var="top" items="${clubMainMap.topHobbyList0}">		      		
		      		<div class="swiper-slide">
						<img class="club_img" src="${path}/resources/img/club_test.png" />
						
						<c:forEach var="like" items="${likeList}">
							<c:if test="${like.club_code eq top.club_code}">
								<c:set var="in" value="true" />
							</c:if>
						</c:forEach>
						<c:choose>
							<c:when test="${in}">
								<span class="like_icon select">관심</span>
								<c:set var="in" value="false" />
							</c:when>
							<c:otherwise>
								<span class="like_icon">관심</span>
							</c:otherwise>
						</c:choose>
						
						<span class="area">${top.area_name}</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${top.cate_m}.png" /></span>
							<p class="club_name">${top.title}</p>
							<span class="memNum">${top.member_num}명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
						<input type="hidden" name="club_code" id="club_code" value="${top.club_code}" />
					</div>					
		      	</c:forEach>
			        
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
		      
		      	<c:forEach var="people" items="${peoList}">		      		
		      		<div class="swiper-slide">
						<img class="club_img" src="${path}/resources/img/club_test.png" />
						
						<c:forEach var="like" items="${likeList}">
							<c:if test="${like.club_code eq people.club_code}">
								<c:set var="in" value="true" />
							</c:if>
						</c:forEach>
						<c:choose>
							<c:when test="${in}">
								<span class="like_icon select">관심</span>
								<c:set var="in" value="false" />
							</c:when>
							<c:otherwise>
								<span class="like_icon">관심</span>
							</c:otherwise>
						</c:choose>
						
						<span class="area">${people.area_name}</span>
						<div class="club_info">
							<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${people.cate_m}.png" /></span>
							<p class="club_name">${people.title}</p>
							<span class="memNum">${people.member_num}명</span>
							<p class="club_schedule"><span class="s_icon"></span><span>6/11(토)</span><span class="s_icon2"></span><span>B1 자수공방자수공방</span></p>
						</div>
						<input type="hidden" name="club_code" id="club_code" value="${people.club_code}" />
					</div>					
		      	</c:forEach>
		      	
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