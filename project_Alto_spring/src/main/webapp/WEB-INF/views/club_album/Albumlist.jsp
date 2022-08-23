<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="albumList" value="${albumsMap.albumList }" />
<c:set var="totArtices" value="${albumsMap.totArtices }" />
<c:set var="section" value="${albumsMap.section }" />
<c:set var="pageNum" value="${albumsMap.pageNum }" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@include file="/WEB-INF/views/layout/headinfo.jsp" %>
	<link rel="stylesheet" href="${contextPath}/resources/css/albumlayout.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/club/schedule.css" />
	<script type="text/javascript">
		function fn_Albumregistration(login,Albumregistration,loginFrm) {
			if (login != '' && login != 'false') {
				location.href = Albumregistration
			}
			else {
				alert("로그인 후 글쓰기가 가능합니다.")
				location.href=loginFrm+'?action=/club_album/Albumregistration.do';
			}
		}
	</script>
</head>
<body>
	<section>
		<h2>사진첩</h2>
			<div class="div1">
				<c:choose>
						<c:when test="${ empty albumList }">		<!-- 게시물이 없을 때 -->
							<tr>
								<td colspan="6" align="center">
									등록된 게시물이 없습니다!
								</td>
							</tr>
						</c:when>
						<c:when test="${!empty albumList }">
						
							<c:forEach var="album" items="${albumList }" varStatus="albumNum">
								<ul>
								<li class="image">
									<a href="${contextPath}/club_album/Albumdetail.do?album_num=${album.album_num}">
										<img alt="" src="${album.imageFileName }" width="200" height="200">
									</a>
									<dl>
										<dt>
											<a>제목</a>
											<span>${album.title }</span>
										</dt>
										<dd>
											<span>${album.mem_id }</span>
										</dd>
										<dd>
											<span>${album.regidate }</span>
											<span>조회수&nbsp;${album.score }</span>
										</dd>
									</dl>
								</li>
							</ul>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
				
				
		
		<table width="100%" style="border-bottom: none; border-top: none;">
			<tr align="right" style="border-bottom: none;">
				<td class="td2" style="border-bottom: none;">
					<div class="cls2">
					<c:if test="${totArtices != null }">						<%-- 전체 글수에 따라 페이징 표시를 다르게 함 --%>
						<c:choose>
							<c:when test="${totArtices > 100 }">				<%-- 전체 글수가 100보다 클때 --%>
								<c:forEach var="page" begin="1" end="10" step="1">
									<c:if test="${section > 1 && page == 1 }">
										<a class="no_uline" href="${contextPath}/club_album/Albumlist.do?section=${section-1}&pageNum=${section-1}*10 + 1">&nbsp;이전</a>
									</c:if>
										<a class="no_uline" href="${contextPath}/club_album\Albumlist.do?section=${section}&pageNum=${page}">${section*10 + page }</a>
									<c:if test="${page == 10 }">
										<a class="no_uline" href="${contextPath}/club_album\Albumlist.do?section=${section-1}&pageNum=${section*10 + 1}">&nbsp;다음</a>
									</c:if>	
								</c:forEach>					
							</c:when>
																					
							<c:when test="${totArtices == 100 }">				<%-- 등록된 글개수가 100개인 경우 --%>
								<c:forEach var="page" begin="1" end="10" step="1">
									<c:choose >
										<%-- 페이지번호와 pageNum이 같은 경우 페이지 변호를 빨간색으로 표시 --%>
										<c:when test="${page == pageNum}">
											<a class="sel_page" href="${contextPath}/club_album\Albumlist.do?section=${section}&pageNum=${page}">${page}</a>
										</c:when>
										<c:otherwise>
											<a class="no_uline" href="${contextPath}/club_album\Albumlist.do?section=${section}&pageNum=${page}">${page}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
					
							<c:when test="${totArtices < 100 }">				<%-- 등록된 글개수가 100개미만인 경우 --%>
																<%-- 글수가 100개 되지 않으므로 표시되는 페이지는 10개가 되지 않고,
																	전체 글 수를 10으로 나누어 구한 몫에 1을 더한 페이지까지 표시됨 --%>
								<c:forEach var="page" begin="1" end="${totArtices/10 + 1 }">
									<c:choose >
										<%-- 페이지번호와 pageNum이 같은 경우 페이지 변호를 빨간색으로 표시 --%>
										<c:when test="${page == pageNum}">
											<a class="sel_page" href="${contextPath}/club_album\Albumlist.do?section=${section}&pageNum=${page}">${page}</a>
										</c:when>
										<c:otherwise>
											<a class="no_uline" href="${contextPath}/club_album\Albumlist.do?section=${section}&pageNum=${page}">${page}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>				
						</c:choose>
					</c:if>
				</div>
					<a href="javascript:fn_Albumregistration('${login}', '${contextPath}/club_album/Albumregistration.do',
													'${contextPath}/member/loginFrm.do')"><button class="btn02" type="button">사진등록</button></a>
				</td>
			</tr>
		</table>

	</section>
	
</body>
</html>