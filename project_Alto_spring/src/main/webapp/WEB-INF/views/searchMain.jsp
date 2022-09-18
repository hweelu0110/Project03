<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="classSearch" value="${searchMainMap.classSearch}" />
<c:set var="itemSearch" value="${searchMainMap.itemSearch}" />
<c:set var="clubSearch" value="${searchMainMap.clubSearch}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<link rel="stylesheet" href="${contextPath }/resources/css/class/list.css" /> 	
	<link rel="stylesheet" href="${contextPath }/resources/css/class/club.css" /> 
	<link href="${contextPath }/resources/css/class/class_main_sl.css" rel="stylesheet" />
	<style type="text/css">
		h2 {
			padding : 13px;
			border-radius : 10px;
			background-color: #f0f0ef;
		}
		
	</style>
</head>
<body>
	
	<!-- CONTENTS -->
	<section>
		
		<div id="search_result">
			<h2> - 모임 검색 결과</h2>
			<div class="searchList">
				<ul class="club">
					<c:choose>
						<c:when test="${empty clubSearch }">
								<h3><span style="font-size: 9pt;">[ ${searchMainMap.keyword } ] 에 일치하는 모임이 없습니다.</span></h3>
						</c:when>
						
						<c:when test="${!empty clubSearch }">
							<c:forEach var="clubList" items="${clubSearch }" end="5">
								<li>
									<a href="${contextPath}/club/clubInfo.do?club_code=${clubList.club_code}">
										<c:choose>
										<c:when test="${club.img == 'noImg'}">
											<img class="club_img" src="${contextPath}/resources/img/club_noImg.png">
										</c:when>
										<c:otherwise>
											<img class="club_img" src="${contextPath}/club/clubImgDown.do?imageFileName=${clubList.img}" style="height: 170px"/>
										</c:otherwise>
									</c:choose>
									</a>
									<span class="area">${clubList.area_name}</span>
									<span class="hobby_icon">
									<img src="${contextPath}/resources/img/hobby_img/${clubList.cate_m}.png" /></span>
									<p class="club_name">${clubList.title}</p>
									<span class="memNum">${clubList.member_num}명</span>
									
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
								</li>			
							</c:forEach>
							<div align="right" style="margin-right:30px">
								<button onclick="location.href='${contextPath }/club/clubSearchList.do?keyword=${searchMainMap.keyword }'" class="btn secondary"> ... 검색 결과 전체보기</button>
							</div>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
		
		
		<div id="search_result">
			<h2> - 클래스 검색 결과</h2>
			<div class="searchList">
				<ul class="club">
					<c:choose>
						<c:when test="${empty classSearch }">
							<h3><span style="font-size: 9pt;">[ ${searchMainMap.keyword } ] 에 일치하는 클래스가 없습니다.</span></h3>
						</c:when>
						
						<c:when test="${!empty classSearch }">
							<c:forEach var="classList" items="${classSearch }" end="5">
								<li>
									<a href="${contextPath}/class/classDetail.do?class_code=${classList.class_code}">
									<div class="class_products_img"><img src="${contextPath}/download.do?imgName=${classList.imgName}&class_code=${classList.class_code}"></div>
									<span class="area">${classList.area_name }</span>
									<span class="hobby_icon"><img src="${contextPath }/resources/img/hobby_img/${classList.hobby_code }.png" /></span>
									<p class="club_name">${classList.className }</p>
									<span class="memNum" style="font-size: 11px">${classList.member_max }  명</span>
									<p class="club_schedule">
										<span class="s_icon2"></span><span><fmt:formatNumber value="${classList.price}" pattern="#,###" /> 원</span>
									</p>
									<span class="like_icon">관심</span>
									</a>
								</li>
							</c:forEach>
							<div align="right" style="margin-right:30px">
								<button onclick="location.href='${contextPath }/class/listClass.do?keyword=${searchMainMap.keyword }'" class="btn secondary"> ... 검색 결과 전체보기</button>
							</div>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
		
		<div id="search_result">
			<h2> - 취미용품 검색 결과</h2>
			<div class="searchList">
				<ul class="club">
					<c:choose>
						<c:when test="${empty itemSearch }">
							<h3><span style="font-size: 9pt;">[ ${searchMainMap.keyword } ] 에 일치하는 취미용품이 없습니다.</span></h3>
						</c:when>
						
						<c:when test="${!empty itemSearch }">
							<c:forEach var="itemList" items="${itemSearch }" end="5">
								<li>
									<a href="${contextPath}/item/itemDetail.do?item_code=${itemList.item_code}">
									<img class="class_products_img" src="${contextPath}/download.do?imgName=${itemList.imgName}&item_code=${itemList.item_code}" />
									<span class="hobby_icon"><img src="../resources/img/hobby_img/${itemList.hobby_code }.png" /></span>
									<p class="club_name">${itemList.item_name }</p>
									<span class="memNum" style="font-size: 11px">${itemList.quantity }  개</span>
									<p class="club_schedule">
										<span class="s_icon2"></span><span><fmt:formatNumber value="${itemList.price}" pattern="#,###" /> 원</span>
									</p>
									<span class="like_icon">관심</span>
									</a>
								</li>
							</c:forEach>
							<div align="right" style="margin-right:30px">
								<button onclick="location.href='${contextPath }/item/listItem.do?keyword=${searchMainMap.keyword }'" class="btn secondary"> ... 검색 결과 전체보기</button>
							</div>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
		
	</section>
</body>
</html>