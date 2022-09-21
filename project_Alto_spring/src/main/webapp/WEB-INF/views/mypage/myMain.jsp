<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="hobbyList" value="${mypageMap.hobbyList}" />
<c:set var="areaList" value="${mypageMap.areaList}" />
<c:set var="likeList" value="${myMainMap.memlikeList}" />
<c:set var="activeList" value="${myMainMap.activClubList}" />
<c:set var="likeClubList" value="${myMainMap.likeClubList}" />
<c:set var="classList" value="${myMainMap.classList}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${path}/resources/css/mypage.css" />
	<link rel="stylesheet" href="${path}/resources/css/common/list.css" />
	<script src="${path}/resources/js/mypage.js"></script>
</head>
<body>
	<section>
		<div id="myInfo">
			<div class="profile">				
				<input type="hidden" name="mem_id" id="mem_id" value="${login.mem_id}" />
				<c:choose>
					<c:when test="${login.img eq null || login.img eq '' }">
						<img src="${path}/resources/img/profile_default.png" />
					</c:when>
					<c:otherwise>
						<img src="${path}/memberImgDown.do?imageFileName=${login.img}" />	
					</c:otherwise>
				</c:choose>			
				<a class="editBtn01" onclick="fn_imgEditPopup()">편집</a>
				<h1>${login.mem_name}</h1>
				<p>${login.mem_id}</p>
				<a class="editBtn02" href="${path}/mypage/infoEditFrm.do">회원정보수정</a>
			</div>
			
			<div class="hobby">
				<h2>내 취미</h2>
				<c:if test="${not empty hobbyList}">
					<a class="editBtn02" href="${path}/mypage/memHobby.do">편집</a>
					<ul>
						<c:forEach var="hobby" items="${hobbyList}">
							<li>
								<img src="${path}/resources/img/hobby_img/${hobby.hobby_code}.png" />
							</li>						
						</c:forEach>						
					</ul>
				</c:if>
				<c:if test="${empty hobbyList}">
					<ul>
						<li class="noCnt">
							<a href="${path}/mypage/memHobby.do">취미 설정하기</a>
						</li>
					</ul>
				</c:if>				
			</div>
			
			<div class="area">
				<h2>내 지역</h2>
				<c:if test="${not empty areaList}">
					<a class="editBtn02" href="${path}/mypage/memArea.do">편집</a>
					<ul>
						<c:forEach var="area" items="${areaList}">
							<li class="areaIcon">${area.name}</li>
						</c:forEach>						
					</ul>
				</c:if>
				<c:if test="${empty areaList}">
					<ul>
						<li class="noCnt">
							<a href="${path}/mypage/memArea.do">지역 설정하기</a>
						</li>
					</ul>
				</c:if>
			</div>
		</div>
		
		<div id="myMenu">
			<h3>관심사</h3>
			<ul>
				<li><a href="${path}/mypage/myActivList.do">내 취미활동</a></li>
				<li><a href="${path}/mypage/mylikeList.do">관심목록</a></li>
				<li><a href="${path}/mypage/myAddItem.do">내 등록상품</a></li>
			</ul>
			
			<h3>구매활동</h3>
			<ul>
				<li><a href="${path}/mypage/cartClass.do">장바구니</a></li>
				<li><a href="${path}/order/contractList.do">구매 내역</a></li>
			</ul>
			
			<h3>게시물</h3>
			<ul>
				<li><a href="${path}/mypage/myReview.do">후기 관리</a></li>
			</ul>
		</div>
		
		<div id="myPageCont">
			<div class="myClub">
				<h3>활동중인 모임</h3>
				<c:choose>
					<c:when test="${empty activeList}">
						<p class="noCnt">아직 모임 활동을 하지 않았습니다. 모임을 찾으러 가자! <br/>
						<a href="${path}/club/clubSearchList.do">모임검색하기</a></p>									
					</c:when>
					<c:otherwise>
						<div class="swiper mySwiper4">
					      <div class="swiper-wrapper club">
					      
					      	<c:forEach var="active" items="${activeList}">
					      		<div class="swiper-slide">
									<a class="clubImg" href="${path}/club/clubInfo.do?club_code=${active.club_code}">
										<c:choose>
											<c:when test="${active.img == 'noImg'}">
												<img class="club_img" src="${path}/resources/img/club_noImg.png">
											</c:when>
											<c:otherwise>
												<img class="club_img" src="${path}/club/clubImgDown.do?imageFileName=${active.img}" />
											</c:otherwise>
										</c:choose>
									</a>
									
									<c:forEach var="like" items="${likeList}">
										<c:if test="${like.club_code eq active.club_code}">
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
									<c:if test="${active.manager == 'Y'}">
										<span class="manager">모임장</span>
									</c:if>
									<span class="area">${active.area_name}</span>
									<div class="club_info">
										<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${active.cate_m}.png" /></span>
										<p class="club_name">${active.title}</p>
										<span class="memNum">${active.member_num}명</span>
										<c:if test="${active.schedule ne null }">
											<p class="club_schedule">
												<span class="s_icon"></span><span><fmt:parseDate value="${active.schedule}" var="schedule" pattern="yyyy-MM-dd" /><fmt:formatDate value="${schedule}" pattern="yy/MM(E)" type="date" /></span>
												<span class="s_icon2"></span><span>${active.place}</span>
											</p>
										</c:if>
									</div>
									<input type="hidden" name="club_code" id="club_code" value="${active.club_code}" />
								</div>
					      	</c:forEach>
				        	
					      </div>
					      <div class="swiper-button-next"></div>
					      <div class="swiper-button-prev"></div>
					    </div>
						
						<!-- Initialize Swiper -->
					    <script>
					      var swiper = new Swiper(".mySwiper4", {
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
					</c:otherwise>
				</c:choose>								
			</div>
			
			<div class="myClass">
				<h3>수강중인 클래스</h3>				
				<c:choose>
					<c:when test="${empty classList}">
						<p class="noCnt">아직 클래스 정보가 없습니다. 클래스를 찾아볼까요? <br/>
						<a href="${path}/club/classSearchList.do">클래스검색하기</a></p>									
					</c:when>
					<c:otherwise>
						<div class="swiper mySwiper4">
					      <div class="swiper-wrapper club">
					      
					      	<c:forEach var="order" items="${classList}">
					      		<div class="swiper-slide">
									<a href="${path}/class/classDetail.do?class_code=${order.class_code}">
										<img class="class_img" src="${path}/download.do?imgName=${order.imgName}&class_code=${order.class_code}" />
									</a>
									
									<c:forEach var="like" items="${likeList}">
										<c:if test="${like.club_code eq order.class_code}">
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
									
									<span class="area">${order.area_name}</span>
									<div class="club_info">
										<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${order.hobby_code}.png" /></span>
										<p class="club_name">${order.className}</p>
										<span class="memNum">${order.hobby_name}</span>
										<p class="class_price"><fmt:formatNumber value="${order.price}" pattern="#,###원" /></p>
									</div>
									
									<input type="hidden" name="class_code" id="class_code" value="${order.class_code}" />
								</div>
					      	</c:forEach>
				        	
					      </div>
					      <div class="swiper-button-next"></div>
					      <div class="swiper-button-prev"></div>
					    </div>
						
						<!-- Initialize Swiper -->
					    <script>
					      var swiper = new Swiper(".mySwiper4", {
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
					</c:otherwise>
				</c:choose>	
				
			</div>
			
			<div class="myLike">
				<h3>관심 목록</h3>
				
				<c:choose>
					<c:when test="${empty likeClubList}">
						<p class="noCnt">관심 목록이 없습니다.<br/>							
					</c:when>
					<c:otherwise>
						<div class="swiper mySwiper4">
					      <div class="swiper-wrapper club">
					      
					      	<c:forEach var="likeClub" items="${likeClubList}">
					      		<div class="swiper-slide">
									<a class="clubImg" href="${path}/club/clubInfo.do?club_code=${likeClub.club_code}">
										<c:choose>
											<c:when test="${likeClub.img == 'noImg'}">
												<img class="club_img" src="${path}/resources/img/club_noImg.png">
											</c:when>
											<c:otherwise>
												<img class="club_img" src="${path}/club/clubImgDown.do?imageFileName=${likeClub.img}" />
											</c:otherwise>
										</c:choose>
									</a>
									
									<c:forEach var="like" items="${likeList}">
										<c:if test="${like.club_code eq likeClub.club_code}">
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
									
									<span class="area">${likeClub.area_name}</span>
									<div class="club_info">
										<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${likeClub.cate_m}.png" /></span>
										<p class="club_name">${likeClub.title}</p>
										<span class="memNum">${likeClub.member_num}명</span>
										<c:if test="${likeClub.schedule ne null }">
											<p class="club_schedule">
												<span class="s_icon"></span><span><fmt:parseDate value="${likeClub.schedule}" var="schedule" pattern="yyyy-MM-dd" /><fmt:formatDate value="${schedule}" pattern="yy/MM(E)" type="date" /></span>
												<span class="s_icon2"></span><span>${likeClub.place}</span>
											</p>
										</c:if>
									</div>
									<input type="hidden" name="club_code" id="club_code" value="${likeClub.club_code}" />
								</div>
					      	</c:forEach>
				        	
					      </div>
					      <div class="swiper-button-next"></div>
					      <div class="swiper-button-prev"></div>
					    </div>
						
						<!-- Initialize Swiper -->
					    <script>
					      var swiper = new Swiper(".mySwiper4", {
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
					</c:otherwise>
				</c:choose>
			</div>
		</div>		
	</section>
	
	<div id="imgEdit_div" class="popup_div profile">
		<h4>프로필 사진 변경</h4>
		<button class="closeBtn">닫기</button>
		<form action="${path}/mypage/updateImg.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="mem_id" id="mem_id" value="${login.mem_id}" />
			<input type="hidden" name="oldFileName" value="${login.img}" />
			<c:choose>
				<c:when test="${login.img eq null}">
					<img id="mem_img" src="${path}/resources/img/profile_default.png" />
				</c:when>
				<c:otherwise>
					<img id="mem_img" src="${path}/memberImgDown.do?imageFileName=${login.img}" />
				</c:otherwise>
			</c:choose>
			
			<input type="file" name="file" id="mem_imgfile" onchange="readURL(this, 0)" />
			<button type="submit" class="pointBtn">적용</button>
			<button type="button" class="basicBtn" onclick="fn_delURL()">삭제</button>
		</form>
	</div>
</body>
</html>