<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="scheduleList" value="${scheduleMap.scheduleList}" />
<c:set var="totArtices" value="${scheduleMap.totArtices }" />
<c:set var="section" value="${scheduleMap.section }" />
<c:set var="pageNum" value="${scheduleMap.pageNum }" />
<c:set var="club_code" value="${scheduleMap.club_code }"/>
<c:set var="cate" value="${param.cate}" />
<c:set var="tit" value="${param.tit}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${path}/resources/css/club/schedule.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		$("select[name=searchField]").change(function() {
			console.log($(this).val());
			console.log($("select[name=searchField] option:selected").text());
		})
	</script>
</head>
<body>
	<section>
		<div id="clubMenu">
			<ul>
				<li><a href="${path}/club/clubInfo.do?club_code=${club_code}">정보</a></li>
				<li><a href="${path}/club_schedule/listSchedule.do?club_code=${club_code}&cate=${cate}&tit=${tit}">일정</a></li>
				<li><a href="${path}/club_board/listArticles.do?club_code=${club_code}&cate=${cate}&tit=${tit}">게시판</a></li>
				<li><a href="${path}/club_album/albumList.do?club_code=${club_code}&cate=${cate}&tit=${tit}">사진첩</a></li>
			</ul>
		</div>
		<div id="clubTit">
			<img src="${path}/resources/img/hobby_img/${cate}.png" />
			<h2>${tit}</h2>
		</div>			
		
		<div id="clubCont">
			<h3>일정 목록</h3>
			
			<c:choose>
				<c:when test="${ empty scheduleList }">		
					<p class="noList">등록된 일정이 없습니다!</p>
				</c:when>
				
				<c:when test="${!empty scheduleList }">							
					<table id="clubboard">
						<thead>
							<tr>
								<th width="10%">모임일</th>
								<th width="*">모임 정보</th>
								<th width="8%"></th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="schedule" items="${scheduleList}">
								<tr>
									<td>
										<p class="schDate">
											<span class="month">
												<fmt:parseDate value="${schedule.sdate}" var="sdate" pattern="yyyy-MM-dd" />
												<fmt:formatDate value="${sdate}" pattern="MM/" />
											</span>
											<span class="day">
												<fmt:formatDate value="${sdate}" pattern="dd" />
											</span>
										</p>
									</td>
									<td class="title">
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
														<li>${schedule.splace}</li>
													</c:otherwise>
												</c:choose>								
											</ul>	
										</div>
									</td>
									<td class="editBtn">										
										<c:if test="${login.mem_id eq schedule.mem_id}">
											<a class="editIcon edit" href="${path}/club_schedule/editSchedule.do?
																			schedule_code=${schedule.schedule_code}&cate=${cate}&tit=${tit}">편집</a>
											<a class="editIcon del" href="${path}/club_schedule/removeSchedule.do?
																			schedule_code=${schedule.schedule_code}&club_code=${club_code}&cate=${cate}&tit=${tit}">삭제</a>
										</c:if>										
									</td>						
								</tr>
							</c:forEach>
						</tbody>					
					</table>
					
					<div id="paging">
						<c:if test="${totArtices != null }">						
							<c:choose>
								<c:when test="${totArtices > 100 }">				
									<c:forEach var="page" begin="1" end="10" step="1">
										<c:if test="${section > 1 && page == 1 }">
											<a href="${path}/club_schedule/listschedule.do?club_code=${club_code}&section=${section-1}&pageNum=${section-1}*10 + 1&cate=${cate}&tit=${tit}">&nbsp;이전</a>
										</c:if>
											<a href="${path}/club_schedule/listschedule.do?club_code=${club_code}&section=${section}&pageNum=${page}&cate=${cate}&tit=${tit}">${section*10 + page }</a>
										<c:if test="${page == 10 }">
											<a href="${path}/club_schedule/listschedule.do?club_code=${club_code}&section=${section-1}&pageNum=${section*10 + 1}&cate=${cate}&tit=${tit}">&nbsp;다음</a>
										</c:if>	
									</c:forEach>					
								</c:when>
																						
								<c:when test="${totArtices == 100 }">				
									<c:forEach var="page" begin="1" end="10" step="1">
										<c:choose >								
											<c:when test="${page == pageNum}">
												<a class="select" href="${path}/club_schedule/listschedule.do?club_code=${club_code}&section=${section}&pageNum=${page}&cate=${cate}&tit=${tit}">${page}</a>
											</c:when>
											<c:otherwise>
												<a href="${path}/club_schedule/listschedule.do?club_code=${club_code}&section=${section}&pageNum=${page}&cate=${cate}&tit=${tit}">${page}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								
								<c:when test="${totArtices < 100 }">														
									<c:forEach var="page" begin="1" end="${totArtices/10 + 1 }">
										<c:choose >								
											<c:when test="${page == pageNum}">
												<a class="select" href="${path}/club_schedule/listschedule.do?club_code=${club_code}&section=${section}&pageNum=${page}&cate=${cate}&tit=${tit}">${page}</a>
											</c:when>
											<c:otherwise>
												<a href="${path}/club_schedule/listschedule.do?club_code=${club_code}&section=${section}&pageNum=${page}&cate=${cate}&tit=${tit}">${page}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>				
							</c:choose>
						</c:if>
					</div>
					
				</c:when>
			</c:choose>
			
			<!-- 일정등록 버튼 -->
			<c:if test="${not empty login}">
				<p class="align_right">
					<button class="pointBtn" type="button" onclick="location.href='${path}/club_schedule/scheduleForm.do?club_code=${club_code}&cate=${cate}&tit=${tit}'">일정등록</button>
				</p>
			</c:if>
		</div>
		
		
	</section>		
</body>
</html>