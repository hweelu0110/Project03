<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="article" value="${articleMap.article }" />
<c:set var="fileList" value="${articleMap.fileList }" />
<c:set var="club_code" value="${articleMap.article.club_code}"/>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="${path}/resources/css/club/board.css" />
	<script type="text/javascript">
		function backToList(obj) {
			obj.action = "${path}/club_board/listArticles.do?club_code=${club_code}&cate=${cate}&tit=${tit}"
			obj.submit()
		}
		
		function fn_edit(obj) {
			obj.action = "${path}/club_board/editArticle.do?notice_num=${article.notice_num}&cate=${cate}&tit=${tit}"
			obj.submit()
		}
										
		function fn_remove_article(url, notice_num) {
			let form = document.createElement("form")		
			form.setAttribute("method", "post")
			form.setAttribute("action", url)
			let articleNoInput = document.createElement("input")		
			articleNoInput.setAttribute("type", "hidden")		
			articleNoInput.setAttribute("name", "notice_num")
			articleNoInput.setAttribute("value", notice_num)
			form.appendChild(articleNoInput)				
			document.body.appendChild(form)					
			form.submit()									
		}			
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
			<h3>게시글 보기</h3>
			
			<form action="#" name="frmArticle" method="post" enctype="multipart/form-data">
				<table id="clubView">
					<thead>
						<tr>
							<th colspan="6">
								${article.title} 
								<span class="category">
									<c:if test="${article.category eq 'content'}">자유글</c:if>
									<c:if test="${article.category eq 'review'}">정모후기</c:if>
									<c:if test="${article.category eq 'signup'}">가입인사</c:if>
									<c:if test="${article.category eq 'notice'}">공지사항</c:if>
								</span>
							</th>
						</tr>					
						<tr>
							<td width="10%" align="right">작성자 ${article.mem_name}</td>
							<td width="*"><span class="regidate">${article.regidate}</span></td>
							<td width="8%">조회수</td>
							<td width="8%">${article.score}</td>
							<td width="8%">좋아요</td>
							<td width="8%">${article.like_num}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="6" class="contents">
								${article.contents}
							</td>
						</tr>
						
						<c:if test="${not empty fileList}">
							<tr>
								<th class="tit01">첨부파일</th>
								<td class="cont01" colspan="5">
									<c:forEach var="file" items="${fileList}">
										<div class="input-file">
					  						<input type="text" readonly="readonly" class="file-name" value="${file.fileName}" />
					  						<a class="file-label" href="${path}/club_board/filedownload.do?fileNo=${file.fileNo}">다운로드</a>
										</div>
									</c:forEach>				
								</td>
							</tr>	
						</c:if>
					</tbody>				
							
				</table>				
								
				<div>
					<div>
						<textarea placeholder="댓글을 남겨보세요"></textarea>
					</div>
					
					<div>
						<a role="button">취소</a>
						<a role="button">등록</a>
					</div>				
				</div>
				
				<div id="tr_btn" class="align_right">
					<c:if test="${login.mem_id == article.mem_id }">	
						<input type="button" class="basicBtn" value="수정하기" onclick="fn_edit(frmArticle)" />
						<input type="button" class="basicBtn" value="삭제하기" onclick="fn_remove_article('${path}/club_board/removeArticle.do?club_code=${club_code}&cate=${cate}&tit=${tit}', ${article.notice_num})" />
					</c:if>
					<input type="button" class="basicBtn02" value="목록보기" onclick="backToList(frmArticle)" />
				</div>
			</form>
		</div>		
		
	</section>
</body>
</html>