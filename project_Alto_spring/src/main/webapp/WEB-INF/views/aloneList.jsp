<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="likeList" value="${memlikeList}" />
<c:set var="clubList" value="${aloneMap.aloneClubList}" />
<c:set var="classList" value="${aloneMap.aloneClassList}" />
<c:set var="itemList" value="${aloneMap.itemListNew}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">		
	<link rel="stylesheet" href="${path}/resources/css/common/list.css" /> 
	<link rel="stylesheet" href="${path}/resources/css/main.css" /> 	
</head>
<body>	
	<!-- Top Banner Area -->
	<div id="ban_area">
		<div>
			<div>
				<a href="${path}/main/aloneList.do">
					<span>혼자서도 가능한 취미생활</span>
				</a>			
			</div>
		</div>		
	</div>
	
	<!-- CONTENTS -->
	<section>		
		<div id="aloneList">			
			<div id="sec_08">
				<h2>온라인 모임도 가능해요!</h2>
				
			    <div class="swiper mySwiper2">
			      <div class="swiper-wrapper club">
			      
		        	<c:forEach var="club" items="${clubList}" end="8">
			      		<div class="swiper-slide">
							<a class="clubImg" href="${path}/club/clubInfo.do?club_code=${club.club_code}">
			      				<c:choose>
									<c:when test="${club.img == 'noImg'}">
										<img class="club_img" src="${path}/resources/img/club_noImg.png">
									</c:when>
									<c:otherwise>
										<img class="club_img" src="${path}/club/clubImgDown.do?imageFileName=${club.img}" />
									</c:otherwise>
								</c:choose>
			      			</a>
							
							<c:forEach var="like" items="${likeList}">
								<c:if test="${like.club_code eq club.club_code}">
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
							
							<span class="area">${club.area_name}</span>
							<div class="club_info">
								<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${club.cate_m}.png" /></span>
								<p class="club_name">${club.title}</p>
								<span class="memNum">${club.member_num}명</span>
								<c:if test="${club.schedule ne null }">
									<p class="club_schedule">
										<span class="s_icon"></span><span><fmt:parseDate value="${club.schedule}" var="schedule" pattern="yyyy-MM-dd" /><fmt:formatDate value="${schedule}" pattern="yy/MM(E)" type="date" /></span>
										<span class="s_icon2"></span><span>${club.place}</span>
									</p>
								</c:if>							
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
			
			<div id="sec_02">
				<h2>집에서 듣는 취미 클래스</h2>
				
			    <div class="swiper mySwiper2">
			      <div class="swiper-wrapper product">
			      
		        	<c:forEach var="item" items="${classList}" end="8">
			      		<div class="swiper-slide">
				      		<a href="${path}/class/classDetail.do?class_code=${item.class_code}">
								<img class="class_img" src="${path}/download.do?imgName=${item.imgName}&class_code=${item.class_code}" />
							</a>
							<c:forEach var="like" items="${likeList}">
								<c:if test="${like.class_code eq item.class_code}">
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
							
							<span class="area">${item.area_name }</span>	
							<div>
								<p class="class_name">${item.className }</p>
								<p class="hobby_name">${item.hobby_name }</p>
								<p class="class_price"><fmt:formatNumber value="${item.price }" pattern="#,###원" /></p>				
							</div>
							
							<input type="hidden" name="class_code" id="class_code" value="${item.class_code}" />
							
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
			
			<div id="sec_03">
				<h2>새로나온 취미용품</h2>
				
			    <div class="swiper mySwiper2">
			      <div class="swiper-wrapper product">
			      
		        	<c:forEach var="item" items="${itemList}" end="10">
			      		<div class="swiper-slide">
			      			<a href="${path}/item/itemDetail.do?item_code=${item.item_code}">
								<img class="class_img" src="${path}/download.do?imgName=${item.imgName}&item_code=${item.item_code}" />
							</a>
							<c:forEach var="like" items="${likeList}">
								<c:if test="${like.item_code eq item.item_code}">
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
	
							<div>
								<p class="class_name">${item.item_name }</p>
								<p class="hobby_name">${item.hobby_name }</p>
								<p class="class_price"><fmt:formatNumber value="${item.price }" pattern="#,###원" /></p>				
							</div>
							
							<input type="hidden" name="item_code" id="item_code" value="${item.item_code}" />
						</div>
			      	</c:forEach>
			      	
			      </div>
			      <div class="swiper-button-next"></div>
			      <div class="swiper-button-prev"></div>
			    </div>
				
				<!-- Initialize Swiper -->
			    <script>
			      var swiper = new Swiper(".mySwiper2", {
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
			
		</div>		
	</section>	
</body>
</html>