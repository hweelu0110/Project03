<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="articlesList" value="${articlesMap.articlesList}" />
<c:set var="totArtices" value="${articlesMap.totArtices }" />
<c:set var="section" value="${articlesMap.section }" />
<c:set var="pageNum" value="${articlesMap.pageNum }" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${contextPath}/resources/css/list02.css" />
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
							<td width="*"><a class="cls1" href="${contextPath}/club_board/viewArticle.do?notice_num=${article.notice_num}">${article.title }</a></td>
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
		<c:if test="${totArtices != null }">						<%-- 전체 글수에 따라 페이징 표시를 다르게 함 --%>
			<c:choose>
				<c:when test="${totArtices > 100 }">				<%-- 전체 글수가 100보다 클때 --%>
					<c:forEach var="page" begin="1" end="10" step="1">
						<c:if test="${section > 1 && page == 1 }">
							<a class="no_uline" href="${contextPath}/club_board/listArticles.do?section=${section-1}&pageNum=${section-1}*10 + 1">&nbsp;이전</a>
						</c:if>
							<a class="no_uline" href="${contextPath}/club_board/listArticles.do?section=${section}&pageNum=${page}">${section*10 + page }</a>
						<c:if test="${page == 10 }">
							<a class="no_uline" href="${contextPath}/club_board/listArticles.do?section=${section-1}&pageNum=${section*10 + 1}">&nbsp;다음</a>
						</c:if>	
					</c:forEach>					
				</c:when>
																		
				<c:when test="${totArtices == 100 }">				<%-- 등록된 글개수가 100개인 경우 --%>
					<c:forEach var="page" begin="1" end="10" step="1">
						<c:choose >
							<%-- 페이지번호와 pageNum이 같은 경우 페이지 변호를 빨간색으로 표시 --%>
							<c:when test="${page == pageNum}">
								<a class="sel_page" href="${contextPath}/club_board/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
							</c:when>
							<c:otherwise>
								<a class="no_uline" href="${contextPath}/club_board/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
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
								<a class="sel_page" href="${contextPath}/club_board/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
							</c:when>
							<c:otherwise>
								<a class="no_uline" href="${contextPath}/club_board/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>				
			</c:choose>
		</c:if>
	</div>
		
		<!-- 글쓰기 버튼 -->
		<table width="100%" style="border-bottom: none;">
			<tr align="right" style="border-bottom: none;">
				<td class="td2" style="border-bottom: none;">
					<a href="javascript:fn_articleForm('${login}', '${contextPath}/club_board/articleForm.do',
													'${contextPath}/member/loginFrm.do')"><button class="btn01" type="button">글쓰기</button></a>
				</td>
			</tr>
		</table>
	</section>		
</body>
</html>