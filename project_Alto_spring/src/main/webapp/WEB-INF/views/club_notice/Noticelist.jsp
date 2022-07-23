<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${contextPath}/resources/css/common/list02.css" />

</head>
<body>
	<section>
	<h2>게시판</h2>
		<table>
			<tr>
				<td class="td1" align="right">
					<select class="searchField">
						<option value="all">전체보기</option>
						<option value="content">자유글</option>
						<option value="review">정모후기</option>
						<option value="signup">가입인사</option>
						<option value="notice">공지사항</option>
					</select>
				</td>
			</tr>
	</table>
	
	<!-- 게시물 목록 테이블 -->
		<table border="1" width="100%">
			<!-- 컬럼이름 -->
			<tr>
				<th width="10%">번호</th>
				<th width="*">제목</th>
				<th width="15%">작성자</th>
				<th width="10%">조회수</th>
				<th width="15%">작성일</th>
				<th width="8%">좋아요</th>
			</tr>
			<c:choose>
				<c:when test="${ empty boardList }">		<!-- 게시물이 없을 때 -->
					<tr>
						<td colspan="6" align="center">
							등록된 게시물이 없습니다!
						</td>
					</tr>
				</c:when>
				
				<c:when test="${!empty boardList }">
				
					<c:forEach var="notice" items="${boardList }" varStatus="noticeNum">
						<tr align="center">
							<td width="10%">${noticeNum.count }</td>
							<td width="*"><a class="cls1" href="${contextPath}/club_notice/Noticeregistration.do?articleNO=${notice.notice_num}">${notice.title }</a></td>
							<td width="15%">${notice.mem_id }</td>
							<td width="10%">${notice.score }</td>
							<td width="15%">${notice.regidate }</td>
							<td width="8%">${notice.like_num}</td>
							
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		
		<!-- 글쓰기 버튼 -->
		<table width="100%">
			<tr align="right">
				<td class="td2">
					<a href="${contextPath}/club_notice/Noticeregistration.do"><button class="btn01" type="button">글쓰기</button></a>
				</td>
			</tr>
		</table>
		
		<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/club_notice/Noticeregistration.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/club_notice/Noticeregistration.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/club_notice/Noticeregistration.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	</section>		
</body>
</html>