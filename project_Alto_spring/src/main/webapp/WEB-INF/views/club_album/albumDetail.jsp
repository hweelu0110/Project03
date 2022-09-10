<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="album" value="${albumMap.album }" />
<c:set var="imageFileList" value="${albumMap.imageFileList }" />
<c:set var="club_code" value="${albumMap.album.club_code}"/>
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
	<link rel="stylesheet" href="${path}/resources/css/club/album.css" />
	<script type="text/javascript">
		function backToList(obj) {
			obj.action = "${path}/club_album/albumList.do?club_code=${club_code}&cate=${cate}&tit=${tit}"
			obj.submit()
		}
		
		function fn_edit(obj) {
			obj.action = "${path}/club_album/editAlbum.do?album_num=${album.album_num}&cate=${cate}&tit=${tit}"
			obj.submit()
		}
				
		function fn_remove_article(url, album_num) {
			let form = document.createElement("form")		
			form.setAttribute("method", "post")
			form.setAttribute("action", url)
			let articleNoInput = document.createElement("input")		
			articleNoInput.setAttribute("type", "hidden")		
			articleNoInput.setAttribute("name", "album_num")
			articleNoInput.setAttribute("value", album_num)
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
			<h3>사진첩 보기</h3>
			
			<form action="#" name="frmAlbum" method="post" enctype="multipart/form-data">
				<table id="viewAlbum">
					<thead>
						<tr>
							<th colspan="6">
								${album.title} 
							</th>
						</tr>					
						<tr>
							<td width="10%" align="right">작성자 ${album.mem_name}</td>
							<td width="*"><span class="regidate">${album.regidate}</span></td>
							<td width="8%">조회수</td>
							<td width="8%">${album.score}</td>
							<td width="8%">좋아요</td>
							<td width="8%">${album.like_num}</td>
						</tr>
					</thead>
					
					<tbody>
						<c:set var="img_index" />
						<c:choose>
							<c:when test="${not empty imageFileList && imageFileList != 'null' }">
								<c:forEach var="item" items="${imageFileList}" varStatus="status">
									<tr id="tr_${status.count}">
										<td class="image" colspan="6">
											<!-- 이미지 수정시 미리 원래 이미지 파일이름을 저장함 -->
											<input type="hidden" name="oldFileName" value="${item.imageFileName}" />
											<input type="hidden" name="imageFileNo" value="${item.imageFileNo}" />
											<img alt="이미지" src="${path}/club_album/albumImage.do?album_num=${item.album_num}&imageFileName=${item.imageFileName}"
												id="preview${status.index}" >
										</td>									
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>	
						
						<tr>
							<td colspan="6" class="contents">
								${album.contents}
							</td>
						</tr>
					
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
						<c:if test="${login.mem_id == album.mem_id }">
							<input type="button" class="basicBtn" value="수정하기" onclick="fn_edit(frmAlbum)" />
							<input type="button" class="basicBtn" value="삭제하기" onclick="fn_remove_article('${path}/club_album/removeAlbum.do?club_code=${club_code}&cate=${cate}&tit=${tit}', ${album.album_num})" />
						</c:if>
						<input type="button" class="basicBtn02" value="목록보기" onclick="backToList(frmAlbum)" />
				</div>
				
			</form>
		</div>
	</section>
</body>
</html>