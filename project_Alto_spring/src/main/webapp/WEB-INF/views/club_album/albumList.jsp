<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="albumList" value="${albumsMap.albumList }" />
<c:set var="totArtices" value="${albumsMap.totArtices }" />
<c:set var="section" value="${albumsMap.section }" />
<c:set var="pageNum" value="${albumsMap.pageNum }" />
<c:set var="club_code" value="${albumsMap.club_code}" />
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
	<link rel="stylesheet" href="${path}/resources/css/club/album.css" />
	<script type="text/javascript">
	</script>
</head>
<body>
	<section>
		<div id="clubMenu">
			<ul>
				<li><a href="${path}/club/clubInformation.do?club_code=${club_code}">정보</a></li>
				<li><a href="${path}/club_board/listArticles.do?club_code=${club_code}&cate=${cate}&tit=${tit}">게시판</a></li>
				<li><a href="${path}/club_album/albumList.do?club_code=${club_code}&cate=${cate}&tit=${tit}">사진첩</a></li>
				<li><a href="${path}/club/clubChat.do?club_code=${club_code}&cate=${cate}&tit=${tit}">채팅</a></li>
			</ul>
		</div>
		<div id="clubTit">
			<img src="${path}/resources/img/hobby_img/${cate}.png" />
			<h2>${tit}</h2>
		</div>
		
		<div id="clubCont">
			<h3>사진첩 목록</h3>
			<c:choose>
				<c:when test="${ empty albumList }">		<!-- 게시물이 없을 때 -->
					<p class="noList">등록된 게시물이 없습니다!</p>
				</c:when>
				
				<c:when test="${!empty albumList }">
					<ul id="clubAlbum">
						<c:forEach var="album" items="${albumList }" varStatus="albumNum">
							<li>
								<a href="${path}/club_album/albumDetail.do?album_num=${album.album_num}&cate=${cate}&tit=${tit}">
									<img src="${path}/club_album/albumImage.do?album_num=${album.album_num}&imageFileName=${album.imageFileName}">
								</a>
								
								<dl>
									<dt><a href="${path}/club_album/albumDetail.do?album_num=${album.album_num}&cate=${cate}&tit=${tit}">${album.title}</a></dt>
									<dd>
										<span>${album.mem_name}</span>
									</dd>
									<dd>
										<span>${album.regidate}</span>
										<span>조회수&nbsp;${album.score }</span>
									</dd>
								</dl>
								
							</li>
						</c:forEach>
					</ul>
					
					<div id="paging">
						<c:if test="${totArtices != null }">						
							<c:choose>
								<c:when test="${totArtices > 100 }">				
									<c:forEach var="page" begin="1" end="10" step="1">
										<c:if test="${section > 1 && page == 1 }">
											<a href="${path}/club_album/albumList.do?club_code=${club_code}&section=${section-1}&pageNum=${section-1}*10 + 1&cate=${cate}&tit=${tit}">&nbsp;이전</a>
										</c:if>
											<a href="${path}/club_album/albumList.do?club_code=${club_code}&section=${section}&pageNum=${page}&cate=${cate}&tit=${tit}">${section*10 + page }</a>
										<c:if test="${page == 10 }">
											<a href="${path}/club_album/albumList.do?club_code=${club_code}&section=${section-1}&pageNum=${section*10 + 1}&cate=${cate}&tit=${tit}">&nbsp;다음</a>
										</c:if>	
									</c:forEach>					
								</c:when>
																						
								<c:when test="${totArtices == 100 }">				
									<c:forEach var="page" begin="1" end="10" step="1">
										<c:choose >								
											<c:when test="${page == pageNum}">
												<a class="select" href="${path}/club_album/albumList.do?club_code=${club_code}&section=${section}&pageNum=${page}&cate=${cate}&tit=${tit}">${page}</a>
											</c:when>
											<c:otherwise>
												<a href="${path}/club_album/albumList.do?club_code=${club_code}&section=${section}&pageNum=${page}&cate=${cate}&tit=${tit}">${page}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								
								<c:when test="${totArtices < 100 }">														
									<c:forEach var="page" begin="1" end="${totArtices/20 + 1 }">
										<c:choose >								
											<c:when test="${page == pageNum}">
												<a class="select" href="${path}/club_album/albumList.do?club_code=${club_code}&section=${section}&pageNum=${page}&cate=${cate}&tit=${tit}">${page}</a>
											</c:when>
											<c:otherwise>
												<a href="${path}/club_album/albumList.do?club_code=${club_code}&section=${section}&pageNum=${page}&cate=${cate}&tit=${tit}">${page}</a>
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
					<button class="pointBtn" type="button" onclick="location.href='${path}/club_album/albumForm.do?club_code=${club_code}&cate=${cate}&tit=${tit}'">사진등록</button>
				</p>
			</c:if>
		</div>					

	</section>
	
</body>
</html>