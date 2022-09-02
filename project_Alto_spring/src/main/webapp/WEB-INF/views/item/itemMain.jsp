<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="hobbyList" value="${itemMainMap.AllHobbyList}"/>
<c:set var="likeList" value="${itemMainMap.memlikeList}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${contextPath}/resources/css/class/list.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/club/clubMain.css" />
	<link href="${contextPath}/resources/css/class/class_main_style.css?after" rel="stylesheet" />
	<title>ALTO - 클래스 메인</title>
	<script type="text/javascript">
		$(function() {
			$("#main_menu li").css("color","#000");
			$("#main_menu li:nth-child(3)").css("color","#00c7ae");
		})
	</script>
</head>
<body>
	<section>
		<div id="cate_menu">
			<ul>
				<c:forEach var="hobby" items="${hobbyList}">
					<li>
						<a href="${contextPath}/item/listItem.do?hobbyC=${hobby.hobby_code}">
							<img src="${contextPath}/resources/img/hobby_img/${hobby.hobby_code}.png" />
							<span class="hobby_name">${hobby.name}</span>
						</a>
					</li>				
				</c:forEach>				
			</ul>
		</div>

		<div id="sec_03">
			<h2>BEST</h2>
			<div class="swiper mySwiper4">
		      <div class="swiper-wrapper product">
	        	<c:forEach var="itemListBest" items="${itemListBest }">
			      	<div class="swiper-slide">
						<img class="class_img" src="${contextPath}/download.do?imgName=${itemListBest.imgName}&item_code=${itemListBest.item_code}" />
						
						<c:forEach var="like" items="${likeList}">
							<c:if test="${like.item_code eq itemListBest.item_code}">
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
							<p class="class_name">${itemListBest.item_name }</p>
							<p class="hobby_name">${itemListBest.hobby_name }</p>
							<p class="class_price">${itemListBest.price }원</p>				
						</div>
						
						<input type="hidden" name="item_code" id="item_code" value="${itemListBest.item_code}" />
					</div>
			    </c:forEach>
				</div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
			</div>
		</div>
			
		<div id="sec_04">
			<h2>NEW</h2>
			<div class="swiper mySwiper4">
		      <div class="swiper-wrapper product">
		      	<c:forEach var="itemListNew" items="${itemListNew }">
			      	<div class="swiper-slide">
						<img class="class_img" src="${contextPath}/download.do?imgName=${itemListNew.imgName}&item_code=${itemListNew.item_code}" />
						
						<c:forEach var="like" items="${likeList}">
							<c:if test="${like.item_code eq itemListNew.item_code}">
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
							<p class="class_name">${itemListNew.item_name }</p>
							<p class="hobby_name">${itemListNew.hobby_name }</p>
							<p class="class_price">${itemListNew.price }원</p>				
						</div>
						
						<input type="hidden" name="item_code" id="item_code" value="${itemListNew.item_code}" />
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

	</section>
</body>
</html>