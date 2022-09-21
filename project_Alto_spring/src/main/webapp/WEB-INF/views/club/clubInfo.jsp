<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="allAreaList" value="${areaList}" />
<c:set var="allHobbyList" value="${hobbyList}" />
<c:set var="subhobbyList" value="${hobbySubList}"/>
<c:set var="clubInfo" value="${clubInfoMap.clubInfo}" />
<c:set var="clubMember" value="${clubInfoMap.clubMemberList}" />
<c:set var="schedule" value="${scheduleInfo}"/>
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
		<input type="hidden" name="loginChk" id="loginChk" value="${login.mem_id}" />		
		<div id="clubMenu">
			<ul>
				<li><a href="${path}/club/clubInfo.do?club_code=${club_code}">정보</a></li>
				<li><a href="javascript:memberChk('${path}/club_schedule/listSchedule.do?club_code=${club_code}&cate=${cate}&tit=${tit}')">일정</a></li>
				<li><a href="javascript:memberChk('${path}/club_board/listArticles.do?club_code=${club_code}&cate=${cate}&tit=${tit}')">게시판</a></li>
				<li><a href="javascript:memberChk('${path}/club_album/albumList.do?club_code=${club_code}&cate=${cate}&tit=${tit}')">사진첩</a></li>
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
					
					<c:choose>
						<c:when test="${like_code eq null}">
							<span class="like_icon">관심</span>
						</c:when>
						<c:otherwise>
							<span class="like_icon select">관심</span>
						</c:otherwise>							
					</c:choose>					
					<input type="hidden" name="club_code" id="club_code" value="${club_code}" />
				</div>
				
				<div class="clubIntro">					
					<p>${clubInfo.intro}</p>
				</div>
								
				<h3 class="schTit">모임일정</h3>
				
				<c:choose>
					<c:when test="${schedule eq null}">
						<p class="noSchedule">등록된 일정이 없습니다.</p>
					</c:when>
					<c:otherwise>
						<div id="schedule">
							<p class="schDate">
								<span class="month">
									<fmt:parseDate value="${schedule.sdate}" var="sdate" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${sdate}" pattern="MM/" />
								</span>
								<span class="day">
									<fmt:formatDate value="${sdate}" pattern="dd" />
								</span>
							</p>
							<div class="schInfo">
								<p class="title">${schedule.title}</p>
								<div class="promCount">(<span>${schedule.mem_cnt}</span>/<span>${schedule.snum}</span>)</div>
								<ul>
									<li class="promTime">
										<fmt:parseDate value="${schedule.stime}" var="stime" pattern="HH:mm" />
										<fmt:formatDate value="${stime}" pattern="a hh:mm" />								
									</li>
									<c:choose>
										<c:when test="${schedule.sprice ne null }">
											<li class="promIcon promPlace">장소</li>
											<li class="promData">${schedule.splace}</li>
											<li class="promIcon promPrice">회비</li>
											<li class="promData">${schedule.sprice}</li>
										</c:when>
										<c:otherwise>
											<li class="promIcon promPlace">장소</li>
											<li class="promData2">${schedule.splace}</li>
										</c:otherwise>
									</c:choose>								
								</ul>
								
								<c:if test="${login.mem_id eq schedule.mem_id}">
									<a href="${path}/club_schedule/editSchedule.do?schedule_code=${schedule.schedule_code}&cate=${cate}&tit=${tit}">
										<img id="editBtn" class="edit" src="${path}/resources/img/edit.png">
									</a>
								</c:if>	
							</div>
							
							<div class="member">
								<ul>
									<c:set var="in" value="false" />
									<c:forEach var="prom" items="${promiseList}">
										<c:if test="${login.mem_id eq prom.mem_id}">	
											<c:set var="in" value="ture" />
										</c:if>
										<c:choose>
											<c:when test="${prom.manager eq 'Y'}">
												<li class="manager">
													<c:choose>
														<c:when test="${prom.img eq null || prom.img eq '' }">
															<img src="${path}/resources/img/profile_default.png" />
														</c:when>
														<c:otherwise>
															<img src="${path}/memberImgDown.do?imageFileName=${prom.img}" />	
														</c:otherwise>
													</c:choose>
												</li>
											</c:when>
											<c:otherwise>
												<li>
													<c:choose>
														<c:when test="${prom.img eq null || prom.img eq '' }">
															<img src="${path}/resources/img/profile_default.png" />
														</c:when>
														<c:otherwise>
															<img src="${path}/memberImgDown.do?imageFileName=${prom.img}" />	
														</c:otherwise>
													</c:choose>
												</li>
											</c:otherwise>
										</c:choose>	
									</c:forEach>
									
									<c:if test="${in}">
										<li>
											<a href="${path}/club_schedule/promiseIn.do?club_code=${club_code}&schedule_code=${schedule.schedule_code}">
												<img class="plus" src="../resources/img/plus.png"/>
											</a>
										</li>
									</c:if>
									
								</ul>
							</div>
						
						</div>
						
						<a class="listMore" href="javascript:memberChk('${path}/club_schedule/listSchedule.do?club_code=${club_code}&cate=${cate}&tit=${tit}')">일정 목록보기</a>
					</c:otherwise>
				</c:choose>			
				
				<button type="button" class="basicBtn02" onclick="javascript:memberChk('${path}/club_schedule/scheduleForm.do?club_code=${club_code}&cate=${cate}&tit=${tit}')">일정추가하기</button><br/>
				
				<c:set var="memYn" value="N" />
				<c:forEach var="member" items="${clubMember}">
					<c:if test="${login.mem_id eq member.mem_id}">
						<c:set var="memYn" value="Y" />
					</c:if>
				</c:forEach>
				
				<c:choose>
					<c:when test="${memYn eq 'Y'}">
						<button type="button" class="clubBtn basicBtn" onclick="fn_cluOut()" >모임 나가기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="clubBtn pointBtn" onclick="fn_articleForm('${login}')" >가입하기</button>
					</c:otherwise>
				</c:choose>
			</div>
			
			<div class="right">
				<div id="schedule_member">
					<h3>모임 멤버 (${clubInfo.member_num}명)</h3>
					<ul>
						<c:forEach var="member" items="${clubMember}">
							<c:choose>
								<c:when test="${login.mem_id eq member.mem_id}">
									<input type="hidden" name="memberYN" id="memberYN" value="Y" />
								</c:when>
								<c:otherwise>
									<input type="hidden" name="memberYN" id="memberYN" value="N" />
								</c:otherwise>	
							</c:choose>
							
							
							<li>
								<input type="hidden" name="mem_id" id="mem_id" value="${member.mem_id}" />
								<c:choose>
									<c:when test="${member.img eq null || member.img eq '' }">
										<img src="${path}/resources/img/profile_default.png" />
									</c:when>
									<c:otherwise>
										<img src="${path}/memberImgDown.do?imageFileName=${member.img}" />	
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