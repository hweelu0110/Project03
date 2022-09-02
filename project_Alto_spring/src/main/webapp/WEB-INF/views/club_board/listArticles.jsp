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
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${path}/resources/css/list02.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	$("select[name=searchField]").change(function() {
		console.log($(this).val());
		console.log($("select[name=searchField] option:selected").test());
	})
	
	function fn_articleForm(login,articleForm,loginFrm) {
			if (login != '' && login != 'false') {
				location.href = articleForm
			}
			else {
				alert("로그인 후 글쓰기가 가능합니다.")
				location.href=loginFrm+'?action=/club_board/articleForm.do';
			}
		}
	</script>
</head>
<body>
	<section>
		<div id="clubMenu">
			<ul>
				<li><a href="${path}/club/clubInformation.do?club_code=${club_code}">정보</a></li>
				<li><a href="${path}/club_board/listArticles.do?club_code=${club_code}">게시판</a></li>
				<li><a href="${path}/club_album/Albumlist.do?club_code=${club_code}">사진첩</a></li>
				<li><a href="${path}/club/clubChat.do?club_code=${club_code}">채팅</a></li>
			</ul>
		</div>
		
		<h2>게시판</h2>
	
		<table>
			<tr>
				<td class="td1" align="right">
					<select class="searchField" name="searchField">
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
			<tr class="tr1">
				<th width="10%">번호</th>
				<th width="*">제목</th>
				<th width="15%">작성자</th>
				<th width="10%">조회수</th>
				<th width="15%">작성일</th>
				<th width="8%">좋아요</th>
			</tr>
			<c:choose>
				<c:when test="${ empty articlesList }">		<!-- 게시물이 없을 때 -->
					<tr>
						<td colspan="6" align="center">
							등록된 게시물이 없습니다!
						</td>
					</tr>
				</c:when>
				
				<c:when test="${!empty articlesList }">
				
					<c:forEach var="article" items="${articlesList }" varStatus="articleNum">
						<tr align="center">
							<td width="10%">${articleNum.count }</td>
							<td width="*"><a class="cls1" href="${path}/club_board/viewArticle.do?notice_num=${article.notice_num}">${article.title }</a></td>
							<td width="15%">${article.mem_id }</td>
							<td width="10%">${article.score }</td>
							<td width="15%">${article.regidate }</td>
							<td width="8%">${article.like_num}</td>							
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
			
		<div class="cls2">
			<c:if test="${totArtices != null }">						
				<c:choose>
					<c:when test="${totArtices > 100 }">				
						<c:forEach var="page" begin="1" end="10" step="1">
							<c:if test="${section > 1 && page == 1 }">
								<a class="no_uline" href="${path}/club_board/listArticles.do?club_code=${club_code}&?section=${section-1}&pageNum=${section-1}*10 + 1">&nbsp;이전</a>
							</c:if>
								<a class="no_uline" href="${path}/club_board/listArticles.do?club_code=${club_code}&?section=${section}&pageNum=${page}">${section*10 + page }</a>
							<c:if test="${page == 10 }">
								<a class="no_uline" href="${path}/club_board/listArticles.do?club_code=${club_code}&?section=${section-1}&pageNum=${section*10 + 1}">&nbsp;다음</a>
							</c:if>	
						</c:forEach>					
					</c:when>
																			
					<c:when test="${totArtices == 100 }">				
						<c:forEach var="page" begin="1" end="10" step="1">
							<c:choose >								
								<c:when test="${page == pageNum}">
									<a class="sel_page" href="${path}/club_board/listArticles.do?club_code=${club_code}&?section=${section}&pageNum=${page}">${page}</a>
								</c:when>
								<c:otherwise>
									<a class="no_uline" href="${path}/club_board/listArticles.do?club_code=${club_code}&?section=${section}&pageNum=${page}">${page}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
					
					<c:when test="${totArtices < 100 }">														
						<c:forEach var="page" begin="1" end="${totArtices/10 + 1 }">
							<c:choose >								
								<c:when test="${page == pageNum}">
									<a class="sel_page" href="${path}/club_board/listArticles.do?club_code=${club_code}&?section=${section}&pageNum=${page}">${page}</a>
								</c:when>
								<c:otherwise>
									<a class="no_uline" href="${path}/club_board/listArticles.do?club_code=${club_code}&section=${section}&pageNum=${page}">${page}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>				
				</c:choose>
			</c:if>
		</div>
			
		<!-- 글쓰기 버튼 -->
		<c:if test="${not empty login}">
			<table width="100%" style="border-bottom: none;">
				<tr align="right" style="border-bottom: none;">
					<td class="td2" style="border-bottom: none;">
						<button class="btn01" type="button" onclick="location.href = '${path}/club_board/articleForm.do?club_code=${club_code}'">글쓰기</button>
					</td>
				</tr>
			</table>
		</c:if>
		
	</section>		
</body>
</html>