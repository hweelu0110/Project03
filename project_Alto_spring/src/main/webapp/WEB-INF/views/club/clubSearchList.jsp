<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="likeList" value="${memlikeList}" />
<c:set var="allHobbyList" value="${clubSearchMap.allHobbyList}" />
<c:set var="allAreaList" value="${clubSearchMap.allAreaList}" />
<c:set var="hobClubList" value="${clubSearchMap.hobClubList}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">		
	<link rel="stylesheet" href="${path}/resources/css/club/club.css" /> 
	<link rel="stylesheet" href="${path}/resources/css/common/list.css" /> 
	<script src="${path}/resources/js/search_tabmenu.js"></script>
	<script src="${path}/resources/js/club_open.js"></script>
	<script type="text/javascript">	
		$(function() {			
			/* 모임 메인에서 카테고리 선택 진입 시 */
			let text = $("#tab_menu li:nth-child(1) span").text().trim()
			$("#tab_menu li:nth-child(1) span").text(text)
						
			let _hobbyC = '${hobbyC}'
			if (_hobbyC != "" || _hobbyC != null) {
				$.ajax({
					url: "http://localhost:8080/alto/hobby/selectSubHobby.do",
					type:"post",
					dataType:"json",
					data: {hobbyC: _hobbyC},
					success: function(data, textStatus) {
						if(data.hobbySubList.length > 0) {
							$.each(data.hobbySubList, function(index, item) {										
								$("#s_cate ul").append("<li class="+
										item.MAIN_CODE+
										">"+item.SUB_NAME+"</li>")
							})
						}
					},
					error: function(data, textStatus) {
						alert("오류가 발생하였습니다. 다시 시도해주세요.")
					}
				})
			}			
			
		})
	</script>
</head>
<body>	
	<!-- CONTENTS -->
	<section>
		<ul id="tab_menu">
			<li><span>전체 취미</span></li>
			<li><span>전체 지역</span></li>
		</ul>
		
		<div id="tab_area">
			<div id="m_cate">
				<ul>
					<li id="m_cate_all" class="all">전체</li>
					<c:forEach var="hobby" items="${allHobbyList}">						
						<c:if test="${hobby.hobby_code eq hobbyC}">
							<c:set var="in" value="true" />
						</c:if>
						<c:choose>
							<c:when test="${in}">
								<li class="select">
									<img src="${path}/resources/img/hobby_img/${hobby.hobby_code}.png" />
									<p class="hobby_name">${hobby.name}</p>
								</li>
								<c:set var="in" value="false" />
							</c:when>
							<c:otherwise>
								<li>
									<img src="${path}/resources/img/hobby_img/${hobby.hobby_code}.png" />
									<p class="hobby_name">${hobby.name}</p>
								</li>
							</c:otherwise>
						</c:choose>												
					</c:forEach>					
				</ul>
			</div>
			<div id="s_cate">
				<ul>
					<li class="all select">전체</li>					
				</ul>
			</div>
			<div id="area_list">
				<ul>
					<li class="all">전체</li>
					<c:forEach var="area" items="${allAreaList}">						
						<c:choose>
							<c:when test="${area.name == '온라인'}">
								<li class="online">${area.name}</li>
							</c:when>	
							<c:otherwise>
								<li>${area.name}</li>
							</c:otherwise>	
						</c:choose>											
					</c:forEach>
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
			<h2>모임 검색 결과</h2>
			<div class="normalList">
				<c:if test="${empty hobClubList}">
					<h3 class="noList">검색 조건과 일치하는 모임이 없습니다.</h3>				
				</c:if>
				<ul class="club">
					<c:forEach var="club" items="${hobClubList}">
						<li>
							<a href="${path}/club/clubInfo.do?club_code=${club.club_code}">
								<img class="club_img" src="${path}/resources/img/club_test.png" />
							</a>
							<span class="area">${club.area_name}</span>
							<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${club.cate_m}.png" /></span>
							<p class="club_name">${club.title}</p>
							<span class="memNum">${club.member_num}명</span>
							<p class="club_schedule">
								<span class="s_icon"></span><span>6/11(토)</span>
								<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
							</p>
							
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
							
							<input type="hidden" name="club_code" id="club_code" value="${club.club_code}" />
						</li>
					</c:forEach>
					
				</ul>
			</div>
			
		</div>
		<c:if test="${not empty login}">
			<div class="info_div">
				<p>원하는 모임을 찾지 못하셨나요?</p>
				<span class="p_color">그럼 직접 만들어보세요!</span>
			</div>
			<div id="open_btn"></div>	
		</c:if>			
	</section>
	
	<%@include file="../layout/club_popup.jsp" %>	
	
</body>
</html>