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
	<script src="${path}/resources/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		 
		function fn_modify_article(obj) {
			obj.action = "${path}/club_album/modAlbum.do?album_num=${album.album_num}&cate=${cate}&tit=${tit}"
			obj.submit()
		}		
		
		function fn_removeModImage(_imageFileNo, _album_num, _imageFileName, rowNum) {
			$.ajax({
				type: "post",
				url: "${path}/club_album/removeModImage.do",
				dataType: "text",
				data: {imageFileNo: _imageFileNo, album_num: _album_num, imageFileName: _imageFileName},
				success: function(result, textStatus) {
					if (result == 'success') {
						alert("이미지를 삭제했습니다.")
						location.href="${path}/club_album/editAlbum.do?removeCompleted=true&album_num=${album.album_num}&cate=${cate}&tit=${tit}"
						$('#tr_'+rowNum).remove()
					}
					else {
						alert("다시 시도해 주세요.")
					}
				},
				error: function(result, textStatus) {
					alert("에러가 발했습니다.")
				},
				complete: function(result, textStatus) {
				
				}
			})
		}
		
		$(function(){
			  
			  let $fileBox = null;
			  
			  $(function() {
			    init();
			  })
			  
			  function init() {
			    $fileBox = $('.input-file');
			    fileLoad();
			  }
			  
			  function fileLoad() {
			    $.each($fileBox, function(idx){
			      var $this = $fileBox.eq(idx),
			          $btnUpload = $this.find('[type="file"]'),
			          $label = $this.find('.file-label');
			      
			      $btnUpload.on('change', function() {
			        var $target = $(this),
			            fileName = $target.val(),
			            $fileText = $target.siblings('.file-name');
			        $fileText.val(fileName);
			      })
			      
			      $btnUpload.on('focusin focusout', function(e) {
			        e.type == 'focusin' ?
			          $label.addClass('file-focus') : $label.removeClass('file-focus');
			      })
			      
			    })
			  }
			  
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
			<h3>사진첩 수정</h3>
			
			<form action="#" name="frmAlbum" method="post" enctype="multipart/form-data">
				<input type="hidden" name="club_code" value="${param.club_code}" />
				<input type="hidden" name="mem_id" value="${login.mem_id}" />
				
				<table id="boardFrm">
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="title" id="title" style="width: 70%" value="${album.title}" placeholder="제목을 입력해주세요." />
						</td>
					</tr>
					<tr>
						<th>이미지</th>
						<td>
							<c:choose>
								<c:when test="${not empty imageFileList && imageFileList != 'null' }">
									<c:forEach var="item" items="${imageFileList}" varStatus="status">								
										<div id="tr_${status.count}">
											<!-- 이미지 수정시 미리 원래 이미지 파일이름을 저장함 -->
											<input type="hidden" name="oldFileName" value="${item.imageFileName}" />
											<input type="hidden" name="imageFileNo" value="${item.imageFileNo}" />
											<img class="image" alt="이미지" src="${path}/club_album/albumImage.do?album_num=${item.album_num}&imageFileName=${item.imageFileName}"
												id="preview${status.index}" ><br />
												
											<div class="input-file imgEdit">
												<input type="text" readonly="readonly" class="file-name" value="${item.imageFileName}" />
												<%-- <label for="upload0${status.count}" class="file-label">찾아보기</label> --%>										
												<input type="file" name="file${status.count}" id="upload0${status.count}" class="file-upload" />												
						  						
												<input type="button" value="이미지 삭제" class="editOp"
														onclick="fn_removeModImage(${item.imageFileNo}, ${item.album_num}, '${item.imageFileName}', ${status.count})">
											</div>
										</div>
										<c:set var="cnt" value="${status.count}" />
									</c:forEach>
									
									<c:set var="endNum" value="${3 - cnt}" />
									<c:forEach var="i" begin="1" end="${endNum}">
										<div class="input-file">
					  						<input type="text" readonly="readonly" class="file-name" />
										  	<label for="upload0${i+cnt}" class="file-label">찾아보기</label>
										  	<input type="file" name="file${i+cnt}" id="upload0${i+cnt}" class="file-upload" />
										</div>									
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="input-file">
				  						<input type="text" readonly="readonly" class="file-name" />
									  	<label for="upload01" class="file-label">찾아보기</label>
									  	<input type="file" name="file1" id="upload01" class="file-upload" />
									</div>
									<div class="input-file">
				  						<input type="text" readonly="readonly" class="file-name" />
									  	<label for="upload02" class="file-label">찾아보기</label>
									 	<input type="file" name="file2" id="upload02" class="file-upload" />
									</div>
									<div class="input-file">
				  						<input type="text" readonly="readonly" class="file-name" />
									  	<label for="upload03" class="file-label">찾아보기</label>
									  	<input type="file" name="file3" id="upload03" class="file-upload" />
									</div>
								</c:otherwise>
							</c:choose>
						</td>									
					</tr>
					
					<tr>
						<th>내용</th>
						<td class="contents">
							<textarea name="contents" id="contents" rows="20" cols="20">${album.contents}</textarea>
							<script>CKEDITOR.replace('contents')</script>
						</td>
					</tr>
					
				</table>
					
				<div id="tr_btn" class="align_right">
					<input type="button" class="pointBtn" value="수정등록" onclick="fn_modify_article(frmAlbum)" />
					<input type="button" class="basicBtn" value="취소" onclick="location.href='${path}/club_album/albumList.do?club_code=${club_code}&cate=${cate}&tit=${tit}'" />					
				</div>
			</form>
		</div>
	</section>
</body>
</html>