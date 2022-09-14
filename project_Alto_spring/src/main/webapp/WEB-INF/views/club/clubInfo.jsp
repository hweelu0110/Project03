<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="allAreaList" value="${areaList}" />
<c:set var="subhobbyList" value="${hobbySubList}"/>
<c:set var="allHobbyList" value="${hobbyList}" />
<c:set var="clubInfo" value="${clubInfoMap.clubInfo}" />
<c:set var="clubMember" value="${clubInfoMap.clubMemberList}" />
<c:set var="club_code" value="${clubInfoMap.clubInfo.club_code}" />
<c:set var="cate" value="${clubInfoMap.clubInfo.cate_m}" />
<c:set var="tit" value="${clubInfoMap.clubInfo.title}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${path}/resources/css/club/club.css" />
	<link rel="stylesheet" href="${path}/resources/css/club/clubInfo.css" />	
	<script src="${path}/resources/js/club_info.js"></script>
</head>
<body>
	<section>
		<div id="clubMenu">
			<ul>
				<li><a href="${path}/club/clubInfo.do?club_code=${club_code}">정보</a></li>
				<li><a href="${path}/club_board/listArticles.do?club_code=${club_code}&cate=${cate}&tit=${tit}">게시판</a></li>
				<li><a href="${path}/club_album/albumList.do?club_code=${club_code}&cate=${cate}&tit=${tit}">사진첩</a></li>
				<li><a href="${path}/club/clubChat.do?club_code=${club_code}&cate=${cate}&tit=${tit}">채팅</a></li>
			</ul>
		</div>		
			
		<div>
			<div class="left">
				<div id="clubTit">					
					<img src="${path}/resources/img/hobby_img/${cate}.png" />
					<h2>${tit}</h2>
					<c:if test="${login.mem_id eq clubInfo.manager}">
						<img id="editBtn" class="edit" src="${path}/resources/img/edit.png">
					</c:if>					
				</div>	
				
				<div class="clubImg">
					<c:choose>
						<c:when test="${clubInfo.img == 'noImg'}">
							<img src="${path}/resources/img/club_noImg.png">
						</c:when>
						<c:otherwise>
							<img src="${path}/club/clubImgDown.do?imageFileName=${clubInfo.img}" />
						</c:otherwise>
					</c:choose>					
					<span class="like_icon">관심</span>
				</div>
				
				<div class="clubIntro">					
					<p>${clubInfo.intro}</p>
				</div>
								
				<h3 class="schTit">모임일정</h3>
				
				<div id="schedule">
					<div class="schDate">
						<span>6/17</span>
					</div>
					<div class="schInfo">
						<span class="span1">다이빙 번개</span>&nbsp;
						<span class="span1">14명 참여중...</span><br/>
						<span class="span2">오후 7:30</span>&nbsp;
						<img class="gps" src="${path}/resources/img/gps.png">스쿠버 다이빙
						<img class="edit" src="${path}/resources/img/edit.png">
					</div>
				</div>
			
				<div class="member">
					<ul>
						<li><img src="../resources/img/user_test.png" /></li>
						<li><img src="../resources/img/user_test.png" /></li>
						<li><img src="../resources/img/user_test.png" /></li>
						<li><img src="../resources/img/user_test.png" /></li>
						<li><img class="plus" src="../resources/img/plus.png"/></li>
					</ul>
				</div>
				
				<button type="button" class="basicBtn02" onclick="location.href='${path}/club/Schedule.do'">일정추가하기</button>
				<c:set var="memYn" value="N" />
				<c:forEach var="member" items="${clubMember}">
					<c:if test="${login.mem_id eq member.mem_id}">
						<c:set var="memYn" value="Y" />
					</c:if>
				</c:forEach>
				
				<c:choose>
					<c:when test="${memYn eq 'Y'}">
						<button type="button" class="basicBtn" onclick="fn_cluOut()" >모임 나가기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="pointBtn" onclick="fn_articleForm('${login}')" >가입하기</button>
					</c:otherwise>
				</c:choose>
			</div>
			
			<div class="right">
				<div id="schedual_member">
					<h3>모임 멤버 (${clubInfo.member_num}명)</h3>
					<ul>
						<c:forEach var="member" items="${clubMember}">
							<li>
								<c:choose>
									<c:when test="${member.img eq null || member.img eq '' }">
										<img src="${path}/resources/img/profile_default.png" />
									</c:when>
									<c:otherwise>
										<img src="${path}/mypage/memImgDown.do?imageFileName=${member.img}" />	
									</c:otherwise>
								</c:choose>		
								<span class="memName">${member.name}</span>
								<c:if test="${member.manager eq 'Y'}">
									<span class="manager">모임장</span>
								</c:if>	
							</li>
						</c:forEach>						
					</ul>
				</div>		
			</div>
		</div>			
	</section>	
	
	<%@include file="../layout/club_popup.jsp" %>
</body>
</html>