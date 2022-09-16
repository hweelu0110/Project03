<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="articlesList" value="${articlesMap.articlesList}" />
<c:set var="totArtices" value="${articlesMap.totArtices }" />
<c:set var="section" value="${articlesMap.section }" />
<c:set var="pageNum" value="${articlesMap.pageNum }" />
<c:set var="club_code" value="${articlesMap.club_code }"/>
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
	<link rel="stylesheet" href="${path}/resources/css/club/board.css" />
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
			<h3>게시판 목록</h3>
			
			<c:choose>
				<c:when test="${ empty articlesList }">		<!-- 게시물이 없을 때 -->
					<p class="noList">등록된 게시물이 없습니다!</p>
				</c:when>
				
				<c:when test="${!empty articlesList }">
					<p class="align_right">
						<select class="searchField" name="searchField">
							<option value="all">전체보기</option>
							<option value="content">자유글</option>
							<option value="review">정모후기</option>
							<option value="signup">가입인사</option>
							<option value="notice">공지사항</option>
						</select>
					</p>
				
					<!-- 게시물 목록 테이블 -->
					<table id="clubBoard">
						<!-- 컬럼이름 -->
						<thead>
							<tr>
								<th width="5%">번호</th>
								<th width="*">제목</th>
								<th width="10%">작성자</th>
								<th width="8%">조회수</th>
								<th width="10%">작성일</th>
								<th width="8%">좋아요</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="article" items="${articlesList }" varStatus="articleNum">
								<tr>
									<td>${articleNum.count }</td>
									<td class="title"><a href="${path}/club_board/viewArticle.do?notice_num=${article.notice_num}&cate=${cate}&tit=${tit}">${article.title }</a></td>
									<td>${article.mem_name }</td>
									<td>${article.score }</td>
									<td>${article.regidate }</td>
									<td>${article.like_num}</td>							
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
											<a href="${path}/club_board/listArticles.do?club_code=${club_code}&section=${section-1}&pageNum=${section-1}*10 + 1&cate=${cate}&tit=${tit}">&nbsp;이전</a>
										</c:if>
											<a href="${path}/club_board/listArticles.do?club_code=${club_code}&section=${section}&pageNum=${page}&cate=${cate}&tit=${tit}">${section*10 + page }</a>
										<c:if test="${page == 10 }">
											<a href="${path}/club_board/listArticles.do?club_code=${club_code}&section=${section-1}&pageNum=${section*10 + 1}&cate=${cate}&tit=${tit}">&nbsp;다음</a>
										</c:if>	
									</c:forEach>					
								</c:when>
																						
								<c:when test="${totArtices == 100 }">				
									<c:forEach var="page" begin="1" end="10" step="1">
										<c:choose >								
											<c:when test="${page == pageNum}">
												<a class="select" href="${path}/club_board/listArticles.do?club_code=${club_code}&section=${section}&pageNum=${page}&cate=${cate}&tit=${tit}">${page}</a>
											</c:when>
											<c:otherwise>
												<a href="${path}/club_board/listArticles.do?club_code=${club_code}&section=${section}&pageNum=${page}&cate=${cate}&tit=${tit}">${page}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								
								<c:when test="${totArtices < 100 }">														
									<c:forEach var="page" begin="1" end="${totArtices/10 + 1 }">
										<c:choose >								
											<c:when test="${page == pageNum}">
												<a class="select" href="${path}/club_board/listArticles.do?club_code=${club_code}&section=${section}&pageNum=${page}&cate=${cate}&tit=${tit}">${page}</a>
											</c:when>
											<c:otherwise>
												<a href="${path}/club_board/listArticles.do?club_code=${club_code}&section=${section}&pageNum=${page}&cate=${cate}&tit=${tit}">${page}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>				
							</c:choose>
						</c:if>
					</div>
					
				</c:when>
			</c:choose>
			
			<!-- 글쓰기 버튼 -->
			<c:if test="${not empty login}">
				<p class="align_right">
					<button class="pointBtn" type="button" onclick="location.href='${path}/club_board/articleForm.do?club_code=${club_code}&cate=${cate}&tit=${tit}'">글쓰기</button>
				</p>
			</c:if>
		</div>
		
		
	</section>		
</body>
</html>