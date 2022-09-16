<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="reviewList" value="${reviewList }" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${contextPath}/resources/css/club/board.css" />
</head>
<body>
	<section>
		<div id="clubMenu">
			<ul>
				<li style="width: 50%"><a href="${contextPath}/club/clubInfo.do?club_code=${club_code}">클래스</a></li>
				<li style="width: 50%"><a href="${contextPath}/club_board/listArticles.do?club_code=${club_code}&cate=${cate}&tit=${tit}">취미용품</a></li>
			</ul>
		</div>	
		
		<div id="clubCont">
			<h3>리뷰 작성 목록</h3>
			
			<c:choose>
				<c:when test="${not empty reviewList }">		<!-- 게시물이 없을 때 -->
					<p class="noList">등록된 게시물이 없습니다!</p>
				</c:when>
				
				<c:when test="${empty reviewList }">
					<table id="clubBoard">
						<!-- 컬럼이름 -->
						<thead>
							<tr>
								<th width="5%">번호</th>
								<th width="20%">상품명</th>
								<th width="5%">별점</th>
								<th width="50%">리뷰내용</th>
								<th width="10%">작성일</th>
								<th width="10%">비고</th>
							</tr>
						</thead>
						
						<tbody>
							<%-- <c:forEach var="article" items="${reviewList }" varStatus="articleNum">
								<tr>
									<td>${articleNum.count }</td>
									<td class="title"><a href="${contextPath}/club_board/viewArticle.do?notice_num=${article.notice_num}&cate=${cate}&tit=${tit}">${article.title }</a></td>
									<td>${article.mem_name }</td>
									<td>${article.score }</td>
									<td>${article.regidate }</td>
									<td>${article.like_num}</td>							
								</tr>
							</c:forEach> --%>
								<tr>
									<td>2</td>
									<td class="title"><a href="#">테스트 상품2</a></td>
									<td>★★★★★</td>
									<td>테스트 리뷰 내용입니다.2</td>
									<td>2022-09-16</td>
									<td></td>							
								</tr>
								<tr>
									<td>1</td>
									<td class="title"><a href="#">테스트 상품</a></td>
									<td>★★★★★</td>
									<td>테스트 리뷰 내용입니다.</td>
									<td>2022-09-16</td>
									<td>수정/삭제</td>							
								</tr>
						</tbody>					
					</table>
					
				</c:when>
			</c:choose>
			
		</div>
		
		
	</section>		
</body>
</html>