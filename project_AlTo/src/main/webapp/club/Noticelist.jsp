<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@include file="../headinfo.jsp" %>
	<link rel="stylesheet" href="../css/clublist.css" />
</head>
<body>
	<%@include file="../header.jsp" %>
	<%@include file="../clubheader.jsp" %>
	
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
				<c:when test="${ empty boardLists }">		<!-- 게시물이 없을 때 -->
					<tr>
						<td colspan="6" align="center">
							등록된 게시물이 없습니다!
						</td>
					</tr>
				</c:when>
			</c:choose>
		</table>
		
		<!-- 글쓰기 버튼 -->
		<table width="100%">
			<tr align="right">
				<td class="td2">
					<button class="btn01" type="button" onclick="location.href='Noticeregistration.jsp'">글쓰기</button>
				</td>
			</tr>
		</table>
	</section>
	
		
		
	<%@include file="../footer.jsp" %>		
</body>
</html>