<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="likeList" value="${memlikeList}" />
<c:set var="allHobbyList" value="${clubSearchMap.allHobbyList}" />
<c:set var="allAreaList" value="${clubSearchMap.allAreaList}" />
<c:set var="hobClubList" value="${clubSearchMap.hobClubList}" />
<c:set var="resultList" value="${clubSearchMap.resultClubList}" />
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
		function fn_sortList(sortType) {
			let searchFrm = document.searchList
			let sort = document.getElementById("sort")
			
			sort.value = sortType
			searchFrm.method = 'get'				
			searchFrm.action = '${path}/club/clubSearchList.do?hobbyC=${searchMap.hobbyC}&keyword=${searchMap.keyword}'
			searchFrm.submit()
		}
		
		$(function() {			
			/* select option */
			let sortVal = $("#sort").val()
			
			if(sortVal == ' ' || sortVal == 'new') {
				$("#selectBoxArea div:eq(0)").text('신규 모임순')
			}else if(sortVal == 'old') {
				$("#selectBoxArea div:eq(0)").text('오래된 모임순')
			}else if(sortVal == 'fast') {
				$("#selectBoxArea div:eq(0)").text('최근 일정순')
			}else if(sortVal == 'stuU') {
				$("#selectBoxArea div:eq(0)").text('회원수 많은순')
			}else if(sortVal == 'stuD') {
				$("#selectBoxArea div:eq(0)").text('회원수 적은순')
			}
			
			/* 모임 메인에서 카테고리 선택 진입 시 */						
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
								if(item.SUB_NAME != '없음') {
									$("#s_cate ul").append("<li class=" + item.MAIN_CODE + ">\n" +
											"<input type='hidden' value=" + item.SUB_CODE + " />\n" +
											item.SUB_NAME + "\n</li>")
								}								
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
		<input type="hidden" name="loginChk" id="loginChk" value="${login.mem_id}" />
		<ul id="tab_menu">
			<li><span>전체 취미</span></li>
			<li><span>전체 지역</span></li>
		</ul>
		
		<div id="tab_area">
			<form action="${path}/club/clubSearchList.do" name="searchList">
				<input type="hidden" name="sort" id="sort" value="${searchMap.sort}" />
				<div id="m_cate">
					<ul>
						<c:choose>
							<c:when test="${searchMap.allhobbys}">
								<li id="m_cate_all" class="all select">
									<input type="hidden" value="all" name="hobbyCode" />
									전체
								</li>	
							</c:when>
							<c:otherwise>
								<li id="m_cate_all" class="all">
									<input type="hidden" value="all" />
									전체
								</li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="hobby" items="${allHobbyList}">	
							<c:choose>
								<c:when test="${hobby.hobby_code eq hobbyC}">
									<c:set var="in" value="true" />
								</c:when>
								<c:otherwise>
									<c:if test="${searchMap.hobbyCodeList ne null}">
										<c:forEach var="hobbyCode" items="${searchMap.hobbyCodeList}">
											<c:if test="${hobby.hobby_code eq hobbyCode}">
												<c:set var="in" value="true" />
											</c:if>
										</c:forEach>
									</c:if>									
								</c:otherwise>
							</c:choose>					
							<c:if test="${hobby.hobby_code eq hobbyC}">
								<c:set var="in" value="true" />
							</c:if>
							<c:choose>
								<c:when test="${in}">
									<li class="select">
										<input type="hidden" value="${hobby.hobby_code}" name="hobbyCode" />
										<img src="${path}/resources/img/hobby_img/${hobby.hobby_code}.png" />
										<p class="hobby_name">${hobby.name}</p>
									</li>
									<c:set var="in" value="false" />
								</c:when>
								<c:otherwise>
									<li>
										<input type="hidden" value="${hobby.hobby_code}" />
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
						<c:if test="${not empty selectHobbySubList}">
							<c:forEach var="hobbysub" items="${selectHobbySubList}">
								<c:forEach var="hobbySubCode" items="${searchMap.hobbySubCodeList}">
									<c:if test="${hobbysub.SUB_CODE eq hobbySubCode}">
										<c:set var="in" value="true" />
									</c:if>
								</c:forEach>
								
								<c:if test="${hobbysub.SUB_NAME ne '없음'}">
									<c:choose>
										<c:when test="${in}">
											<li class="${hobbysub.MAIN_CODE} select">
												<input type="hidden" value="${hobbysub.SUB_CODE}" name="hobbySubCode" />
												${hobbysub.SUB_NAME}
											</li>
											<c:set var="in" value="false" />
										</c:when>
										<c:otherwise>
											<li class="${hobbysub.MAIN_CODE}">
												<input type="hidden" value="${hobbysub.SUB_CODE}" />
												${hobbysub.SUB_NAME}
											</li>
										</c:otherwise>
									</c:choose>
								</c:if>																
							</c:forEach>
						</c:if>					
					</ul>
				</div>
				<div id="area_list">
					<ul>
						<li class="all">전체</li>
						<c:forEach var="area" items="${allAreaList}">
							<c:forEach var="areaCode" items="${searchMap.areaCodeList}">
								<c:if test="${area.area_code eq areaCode}">
									<c:set var="in" value="true" />
								</c:if>
							</c:forEach>
							
							<c:choose>
								<c:when test="${in}">
									<c:choose>
										<c:when test="${area.name == '온라인'}">
											<li class="online select">
												<input type="hidden" value="${area.area_code}" />
												${area.name}										
											</li>
										</c:when>	
										<c:otherwise>
											<li class="select">
												<input type="hidden" value="${area.area_code}" />
												${area.name}
											</li>
										</c:otherwise>	
									</c:choose>								
									<c:set var="in" value="false" />
								</c:when>
								
								<c:otherwise>
									<c:choose>
										<c:when test="${area.name == '온라인'}">
											<li class="online">
												<input type="hidden" value="${area.area_code}" />
												${area.name}										
											</li>
										</c:when>	
										<c:otherwise>
											<li>
												<input type="hidden" value="${area.area_code}" />
												${area.name}
											</li>
										</c:otherwise>	
									</c:choose>
								</c:otherwise>							
							</c:choose>																		
						</c:forEach>
					</ul>
				</div>
				<button type="submit" id="opSearch_btn">선택 조건으로 검색</button>
			</form>
		</div>
		
		<div id="selectBoxArea">
			<div class="selectBox">신규 모임순</div>
			<div class="selectBox select_list">
				<ul>
					<li><a href="javascript:fn_sortList('new')">신규 모임순</a></li>
					<li><a href="javascript:fn_sortList('old')">오래된 모임순</a></li>
					<li><a href="javascript:fn_sortList('fast')">최근 일정순</a></li>
					<li><a href="javascript:fn_sortList('stuU')">회원수 많은순</a></li>
					<li><a href="javascript:fn_sortList('stuD')">회원수 적은순</a></li>					
				</ul>
			</div>
		</div>
		
		
		<div id="search_result">
			<h2>모임 검색 결과</h2>
			<div class="normalList">
				<c:if test="${empty hobClubList and empty resultList}">
					<h3 class="noList">검색 조건과 일치하는 모임이 없습니다.</h3>				
				</c:if>
				<ul class="club">
					<c:if test="${not empty hobClubList}">
						<c:forEach var="club" items="${hobClubList}">
							<li>
								<a href="${path}/club/clubInfo.do?club_code=${club.club_code}">
									<c:choose>
										<c:when test="${club.img == 'noImg'}">
											<img class="club_img" src="${path}/resources/img/club_noImg.png">
										</c:when>
										<c:otherwise>
											<img class="club_img" src="${path}/club/clubImgDown.do?imageFileName=${club.img}" />
										</c:otherwise>
									</c:choose>
								</a>
								<span class="area">${club.area_name}</span>
								<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${club.cate_m}.png" /></span>
								<p class="club_name">${club.title}</p>
								<span class="memNum">${club.member_num}명</span>
								<c:if test="${club.schedule ne null }">
									<p class="club_schedule">
										<span class="s_icon"></span><span><fmt:parseDate value="${club.schedule}" var="schedule" pattern="yyyy-MM-dd" /><fmt:formatDate value="${schedule}" pattern="yy/MM(E)" type="date" /></span>
										<span class="s_icon2"></span><span>${club.place}</span>
									</p>
								</c:if>
								
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
					</c:if>
					
					<c:if test="${not empty resultList}">
						<c:forEach var="club" items="${resultList}">
							<li>
								<a href="${path}/club/clubInfo.do?club_code=${club.club_code}">
									<c:choose>
										<c:when test="${club.img == 'noImg'}">
											<img class="club_img" src="${path}/resources/img/club_noImg.png">
										</c:when>
										<c:otherwise>
											<img class="club_img" src="${path}/club/clubImgDown.do?imageFileName=${club.img}" />
										</c:otherwise>
									</c:choose>
								</a>
								<span class="area">${club.area_name}</span>
								<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${club.cate_m}.png" /></span>
								<p class="club_name">${club.title}</p>
								<span class="memNum">${club.member_num}명</span>
								<c:if test="${club.schedule ne null }">
									<p class="club_schedule">
										<span class="s_icon"></span><span><fmt:parseDate value="${club.schedule}" var="schedule" pattern="yyyy-MM-dd" /><fmt:formatDate value="${schedule}" pattern="yy/MM(E)" type="date" /></span>
										<span class="s_icon2"></span><span>${club.place}</span>
									</p>
								</c:if>
								
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
					</c:if>
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