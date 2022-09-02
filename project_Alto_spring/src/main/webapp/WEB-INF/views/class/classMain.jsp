<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="hobbyList" value="${classMainMap.AllHobbyList}"/>
<c:set var="likeList" value="${classMainMap.memlikeList}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${contextPath }/resources/css/common/list.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/club/clubMain.css" />
	<link href="${contextPath }/resources/css/class/class_main_style.css?after" rel="stylesheet" />
	<title>ALTO - 클래스 메인</title>
	<script type="text/javascript">
		$(function() {
			$("#main_menu li").css("color","#000");
			$("#main_menu li:nth-child(2)").css("color","#00c7ae");
		})
	</script>
</head>
<body>
	<section>
		<div id="cate_menu">
			<ul>
				<c:forEach var="hobby" items="${hobbyList}">
					<li>
						<a href="${contextPath}/class/listClass.do?hobbyC=${hobby.hobby_code}">
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
			      <c:forEach var="classListBest" items="${classListBest }">
			      	<div class="swiper-slide">
						<a href="${contextPath}/class/classDetail.do?class_code=${classListBest.class_code}">
						<img class="class_img" src="${contextPath}/download.do?imgName=${classListBest.imgName}&class_code=${classListBest.class_code}" />
						
						<c:forEach var="like" items="${likeList}">
							<c:if test="${like.class_code eq classListBest.class_code}">
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
						
						<span class="area">${classListBest.area_name }</span>	
						<div>
							<p class="class_name">${classListBest.className }</p>
							<p class="hobby_name">${classListBest.hobby_name }</p>
							<p class="class_price">${classListBest.price }원</p>				
						</div>
						
						<input type="hidden" name="class_code" id="class_code" value="${classListBest.class_code}" />
					</div>
					</a>
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
			      <c:forEach var="classListNew" items="${classListNew }">
			      	<div class="swiper-slide">
						<a href="${contextPath}/class/classDetail.do?class_code=${classListNew.class_code}">
						<img class="class_img" src="${contextPath}/download.do?imgName=${classListNew.imgName}&class_code=${classListNew.class_code}" />
						
						<c:forEach var="like" items="${likeList}">
							<c:if test="${like.class_code eq classListNew.class_code}">
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
						
						<span class="area">${classListNew.area_name }</span>	
						<div>
							<p class="class_name">${classListNew.className }</p>
							<p class="hobby_name">${classListNew.hobby_name }</p>
							<p class="class_price">${classListNew.price }원</p>				
						</div>
						
						<input type="hidden" name="class_code" id="class_code" value="${classListNew.class_code}" />
					</div>
					</a>
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