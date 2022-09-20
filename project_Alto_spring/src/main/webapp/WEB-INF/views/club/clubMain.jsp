<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			$("#main_menu li:nth-child(1)").css("color","#00c7ae");				
			
			// 인기취미모임 
			$("#pop_list .swiper.list1").css("display","none")
			$("#pop_list .swiper.list2").css("display","none")
			$("#pop_hobby ul li").css("cursor","pointer")
			
			$("#pop_hobby ul li:nth-child(1)").click(function() {
				$("#pop_list .swiper.list0").css("display","block")
				$("#pop_list .swiper.list1").css("display","none")
				$("#pop_list .swiper.list2").css("display","none")
			})
			$("#pop_hobby ul li:nth-child(2)").click(function() {
				$("#pop_list .swiper.list1").css("display","block")
				$("#pop_list .swiper.list0").css("display","none")
				$("#pop_list .swiper.list2").css("display","none")
			})
			$("#pop_hobby ul li:nth-child(3)").click(function() {
				$("#pop_list .swiper.list2").css("display","block")
				$("#pop_list .swiper.list0").css("display","none")
				$("#pop_list .swiper.list1").css("display","none")
			})
			
		})
	</script>
</head>
<body>	
	<!-- CONTENTS -->
	<section>
		<input type="hidden" name="loginChk" id="loginChk" value="${login.mem_id}" />
		<div id="cate_menu">
			<ul>
				<c:forEach var="hobby" items="${hobbyList}">
					<li>
						<a href="${path}/club/clubSearchList.do?hobbyC=${hobby.hobby_code}">
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
						<a class="clubImg" href="${path}/club/clubInfo.do?club_code=${best.club_code}">
							<span class="bestBg"></span>
							<c:choose>
								<c:when test="${best.img == 'noImg'}">
									<img class="club_img" src="${path}/resources/img/club_noImg.png">
								</c:when>
								<c:otherwise>
									<img class="club_img" src="${path}/club/clubImgDown.do?imageFileName=${best.img}" />
								</c:otherwise>
							</c:choose>
						</a>
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
						<a class="clubImg" href="${path}/club/clubInfo.do?club_code=${brandnew.club_code}">
							<c:choose>
								<c:when test="${brandnew.img == 'noImg'}">
									<img class="club_img" src="${path}/resources/img/club_noImg.png">
								</c:when>
								<c:otherwise>
									<img class="club_img" src="${path}/club/clubImgDown.do?imageFileName=${brandnew.img}" />
								</c:otherwise>
							</c:choose>
						</a>
						
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
							
							<c:if test="${brandnew.schedule ne null }">
								<p class="club_schedule">
									<span class="s_icon"></span><span><fmt:parseDate value="${brandnew.schedule}" var="schedule" pattern="yyyy-MM-dd" /><fmt:formatDate value="${schedule}" pattern="MM/dd(E)" type="date" /></span>
									<span class="s_icon2"></span><span>${brandnew.place}</span>
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
					<c:if test="${sts.count < 4}">
						<li>
							<img src="${path}/resources/img/hobby_img/${top.CATE_M}.png" />
							<span class="rank_info">${sts.count}</span>
							<p class="hobby_name">${top.NAME}</p>
						</li>
					</c:if>					
				</c:forEach>
			</ul>
			
			<div id="pop_list">
				<div class="swiper mySwiper6 list0">
			      <div class="swiper-wrapper club">		   
			         				      		
		      		<c:forEach var="top" items="${clubMainMap.topHobbyList0}">		      		
			      		<div class="swiper-slide">
							<a class="clubImg" href="${path}/club/clubInfo.do?club_code=${top.club_code}">
								<c:choose>
									<c:when test="${top.img == 'noImg'}">
										<img class="club_img" src="${path}/resources/img/club_noImg.png">
									</c:when>
									<c:otherwise>
										<img src="${path}/club/clubImgDown.do?imageFileName=${top.img}" />
									</c:otherwise>
								</c:choose>
							</a>
							
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
								
								<c:if test="${top.schedule ne null }">
									<p class="club_schedule">
										<span class="s_icon"></span><span><fmt:parseDate value="${top.schedule}" var="schedule" pattern="yyyy-MM-dd" /><fmt:formatDate value="${schedule}" pattern="MM/dd(E)" type="date" /></span>
										<span class="s_icon2"></span><span>${top.place}</span>
									</p>
								</c:if>	
							</div>
							<input type="hidden" name="club_code" id="club_code" value="${top.club_code}" />
						</div>					
			      	</c:forEach>
			      	
			      </div>
			      <div class="swiper-button-next"></div>
			      <div class="swiper-button-prev"></div>
			    </div>	
			    
			    <div class="swiper mySwiper6 list1">
			      <div class="swiper-wrapper club">		   
			         				      		
		      		<c:forEach var="top" items="${clubMainMap.topHobbyList1}">		      		
			      		<div class="swiper-slide">
							<a class="clubImg" href="${path}/club/clubInfo.do?club_code=${top.club_code}">
								<c:choose>
									<c:when test="${top.img == 'noImg'}">
										<img class="club_img" src="${path}/resources/img/club_noImg.png">
									</c:when>
									<c:otherwise>
										<img src="${path}/club/clubImgDown.do?imageFileName=${top.img}" />
									</c:otherwise>
								</c:choose>
							</a>
							
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
								
								<c:if test="${top.schedule ne null }">
									<p class="club_schedule">
										<span class="s_icon"></span><span><fmt:parseDate value="${top.schedule}" var="schedule" pattern="yyyy-MM-dd" /><fmt:formatDate value="${schedule}" pattern="MM/dd(E)" type="date" /></span>
										<span class="s_icon2"></span><span>${top.place}</span>
									</p>
								</c:if>	
							</div>
							<input type="hidden" name="club_code" id="club_code" value="${top.club_code}" />
						</div>					
			      	</c:forEach>
			      	
			      </div>
			      <div class="swiper-button-next"></div>
			      <div class="swiper-button-prev"></div>
			    </div>
			    
			    <div class="swiper mySwiper6 list2">
			      <div class="swiper-wrapper club">		   
			         				      		
		      		<c:forEach var="top" items="${clubMainMap.topHobbyList2}">		      		
			      		<div class="swiper-slide">
							<a class="clubImg" href="${path}/club/clubInfo.do?club_code=${top.club_code}">
								<c:choose>
									<c:when test="${top.img == 'noImg'}">
										<img class="club_img" src="${path}/resources/img/club_noImg.png">
									</c:when>
									<c:otherwise>
										<img src="${path}/club/clubImgDown.do?imageFileName=${top.img}" />
									</c:otherwise>
								</c:choose>
							</a>
							
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
								<c:if test="${top.schedule ne null }">
									<p class="club_schedule">
										<span class="s_icon"></span><span><fmt:parseDate value="${top.schedule}" var="schedule" pattern="yyyy-MM-dd" /><fmt:formatDate value="${schedule}" pattern="MM/dd(E)" type="date" /></span>
										<span class="s_icon2"></span><span>${top.place}</span>
									</p>
								</c:if>	
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
						<a class="clubImg" href="${path}/club/clubInfo.do?club_code=${people.club_code}">
							<c:choose>
								<c:when test="${people.img == 'noImg'}">
									<img class="club_img" src="${path}/resources/img/club_noImg.png">
								</c:when>
								<c:otherwise>
									<img src="${path}/club/clubImgDown.do?imageFileName=${people.img}" />
								</c:otherwise>
							</c:choose>
						</a>
						
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
							
							<c:if test="${people.schedule ne null }">
								<p class="club_schedule">
									<span class="s_icon"></span><span><fmt:parseDate value="${people.schedule}" var="schedule" pattern="yyyy-MM-dd" /><fmt:formatDate value="${schedule}" pattern="MM/dd(E)" type="date" /></span>
									<span class="s_icon2"></span><span>${people.place}</span>
								</p>
							</c:if>	
						</div>
						<input type="hidden" name="club_code" id="club_code" value="${people.club_code}" />
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
		
		
	</section>
	<%@include file="../layout/common_popup.jsp" %>
</body>
</html>