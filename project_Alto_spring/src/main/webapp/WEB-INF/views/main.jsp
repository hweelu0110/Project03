<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="hobbyList" value="${memInfoMap.hobbyList}" />
<c:set var="areaList" value="${memInfoMap.areaList}" />
<c:set var="likeList" value="${memInfoMap.memlikeList}" />
<c:set var="clubList" value="${memInfoMap.memclubList}" />
<c:set var="topHobby" value="${mainListMap.topHobby}" />
<c:set var="bestList" value="${mainListMap.bestClubList}" />
<c:set var="newList" value="${mainListMap.newClubList}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<link rel="stylesheet" href="${path}/resources/css/common/list.css" /> 
	<link rel="stylesheet" href="${path}/resources/css/main.css" />  	 
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
						
			$("#member_section .mem_close").click(function() {
				$("#member_section").slideToggle();
				$("#quick_btn").css("display","inline-block")
			})
			$("#quick_btn").click(function() {
				$("#member_section").slideToggle();
				$("#quick_btn").css("display","none")
			})		
			
		})
	</script>
</head> 
<body>
	<!-- Top Banner Area -->
	<div id="ban_area">
		<div>
			<div><a href="${path}/main/aloneList.do"><span>혼자 오셨어요?</span></a></div>
			<div><a href="${path}/club/clubMain.do"><span>다함께 즐기는 취미생활</span></a></div>
			<div><a href="${path}/class/classMain.do"><span>취미!<br/>없으면 만들면 되지</span></a></div>
		</div>		
	</div>
	
	<c:if test="${not empty login}">
		<!-- Login Main Contents -->		
		<div id="member_section">
			<div>
				<h2>모임 바로가기</h2>
				<c:choose>
					<c:when test="${empty clubList}">
						<p class="noList">가입한 모임이 없습니다.</p>
					</c:when>
					<c:otherwise>
						<ul class="sub_menu">
						<li><a href="">전체목록</a></li>
							<li>설정</li>
						</ul>
						<ul class="my_club">
							
						</ul>
					</c:otherwise>
				</c:choose>				
			</div>
			<div>
				<p class="sub_menu"><a href="${path}/mypage/myMain.do">내정보수정</a></p>
				<h2 class="my_area">내 지역</h2>
				<ul class="area_list">
					<c:if test="${not empty areaList}">
						<c:forEach var="area" items="${areaList}">
							<li>${area.name}</li>
						</c:forEach>
					</c:if>
					<c:if test="${empty areaList}">
						<li><a href="${path}/mypage/memArea.do">지역 설정하기</a></li>
					</c:if>
				</ul>
				<h2 class="my_hobby">내 취미</h2>
				<ul class="hobby_list">
					<c:if test="${not empty hobbyList}">
						<c:forEach var="hobby" items="${hobbyList}">
							<li><img src="resources/img/hobby_img/${hobby.hobby_code}.png"></li>
						</c:forEach>
					</c:if>
					<c:if test="${empty hobbyList}">
						<li><a href="${path}/mypage/memHobby.do">취미 설정하기</a></li>
					</c:if>						
				</ul>
			</div>
			<p class="mem_close">접기</p>
		</div>
	</c:if>
	
	
	<!-- CONTENTS -->
	<section>
		<input type="hidden" name="loginChk" id="loginChk" value="${login.mem_id}" />				
		<div id="sec_01">
			<h2>지금 가장 '핫'한 취미</h2>
			<div class="swiper mySwiper">
		      <div class="swiper-wrapper">
		      
		      	<c:forEach var="top" items="${topHobby}" varStatus="sts">
		      		<div class="swiper-slide">
						<a href="${path}/club/clubSearchList.do?hobbyC=${top.CATE_M}">
							<img src="${path}/resources/img/hobby_img/${top.CATE_M}.png" />
							<c:if test="${sts.count < 6}">
								<span class="rank_info">${sts.count}</span>
							</c:if>
							
							<span class="hobby_name">${top.NAME}</span>
						</a>
					</div>
		      	</c:forEach>
	        	
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
		
		<!-- 회원인 경우에만 노출 추후 진행 -->
		<c:if test="${not empty login}">
			<div id="sec_member">
			<h2>AlTo추천 모임</h2>
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
				      <c:forEach var="classListBest" items="${classListBest }">
				      	<div class="swiper-slide">
							<img class="class_img" src="${path}/download.do?imgName=${classListBest.imgName}&class_code=${classListBest.class_code}" />
							<span class="like_icon">관심</span>
							<span class="area">${classListBest.area_name }</span>	
							<div>
								<p class="class_name">${classListBest.className }</p>
								<p class="hobby_name">${classListBest.hobby_name }</p>
								<p class="class_price">${classListBest.price }원</p>				
							</div>
						</div>
				      </c:forEach>
			      </div>
			      <div class="swiper-button-next"></div>
			      <div class="swiper-button-prev"></div>
			    </div>
			</div>
			
			<div class="float_right">
				<h2>추천 취미용품</h2>
				<div class="swiper mySwiper5">
			      <div class="swiper-wrapper product">
			      	<c:forEach var="itemListNew" items="${itemListNew }">
				      	<div class="swiper-slide">
							<img class="class_img" src="${path}/download.do?imgName=${itemListNew.imgName}&item_code=${itemListNew.item_code}" />
							<span class="like_icon">관심</span>
							<div>
								<p class="class_name">${itemListNew.item_name }</p>
								<p class="hobby_name">${itemListNew.hobby_name }</p>
								<p class="class_price">${itemListNew.price }원</p>				
							</div>
						</div>
				    </c:forEach>
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
		</c:if>
		
		
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
		
		<div id="sec_03">
			<h2>실시간 인기 클래스</h2>
			
			<div class="swiper mySwiper3">
		      <div class="swiper-wrapper product">
			      <c:forEach var="classListBest" items="${classListBest }">
			      	<div class="swiper-slide">
			      		<a href="${path}/class/classDetail.do?class_code=${classListBest.class_code}">
						<img class="class_img" src="${path}/download.do?imgName=${classListBest.imgName}&class_code=${classListBest.class_code}" />
						</a>
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
							<p class="class_price"><fmt:formatNumber value="${classListBest.price }" pattern="#,###원" /></p>				
						</div>
						
						<input type="hidden" name="class_code" id="class_code" value="${classListBest.class_code}" />
						
					</div>
			      </c:forEach>    
			      
		      </div>
		      
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
		 </div>
		</div>
		
		<div id="sec_04">
			<h2>지금 가장 잘 나가는 취미용품</h2>
			<div class="swiper mySwiper6">
		      <div class="swiper-wrapper product">
		      	<c:forEach var="itemListBest" items="${itemListBest }">
			      	<div class="swiper-slide">
				      	<a href="${path}/item/itemDetail.do?item_code=${itemListBest.item_code}">
						<img class="class_img" src="${path}/download.do?imgName=${itemListBest.imgName}&item_code=${itemListBest.item_code}" />
						</a>
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
							<p class="class_price"><fmt:formatNumber value="${itemListBest.price }" pattern="#,###원" /></p>				
						</div>
						
						<input type="hidden" name="item_code" id="item_code" value="${itemListBest.item_code}" />
					
					</div>
			    </c:forEach>		    
			    
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
									<span class="s_icon"></span><span><fmt:parseDate value="${brandnew.schedule}" var="schedule" pattern="yyyy-MM-dd" /><fmt:formatDate value="${schedule}" pattern="yy/MM(E)" type="date" /></span>
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
		
		<div id="sec_06">
			<h2>취미용품 신상</h2>
			<div class="swiper mySwiper3">
		      <div class="swiper-wrapper product">
		      	<c:forEach var="itemListNew" items="${itemListNew }">
			      	<div class="swiper-slide">
				      	<a href="${path}/item/itemDetail.do?item_code=${itemListNew.item_code}">
						<img class="class_img" src="${path}/download.do?imgName=${itemListNew.imgName}&item_code=${itemListNew.item_code}" />
						</a>
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
							<p class="class_price"><fmt:formatNumber value="${itemListNew.price }" pattern="#,###원" /></p>				
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
			      <c:forEach var="classListNew" items="${classListNew }">
			      	<div class="swiper-slide">
			      		<a href="${path}/class/classDetail.do?class_code=${classListNew.class_code}">
						<img class="class_img" src="${path}/download.do?imgName=${classListNew.imgName}&class_code=${classListNew.class_code}" />
						</a>
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
							<p class="class_price"><fmt:formatNumber value="${classListNew.price }" pattern="#,###원" /></p>				
						</div>
						
						<input type="hidden" name="class_code" id="class_code" value="${classListNew.class_code}" />
					
					</div>
			      </c:forEach>      
			      
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
			<c:forEach var="club" items="${clubList}">
				<li class="select">
					<a href="${path}/club/clubInfo.do?club_code=${club.club_code}">
						<img src="${path}/resources/img/hobby_img/${club.cate_m}.png">
						<span class="club_name">${club.title}</span>
						<c:if test="${club.schedule ne null }">
							<span class="club_schd">
								<fmt:parseDate value="${club.schedule}" var="schedule" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${schedule}" pattern="yy/MM(E)" type="date" />
								${club.place}
							</span>
						</c:if>
					</a>
				</li>			
			</c:forEach>			
		</ul>
		<button type="button" name="clubQuikBtn" class="basicBtn" onclick="return quickList()" >변경</button>
	</div>		
</body>
</html>