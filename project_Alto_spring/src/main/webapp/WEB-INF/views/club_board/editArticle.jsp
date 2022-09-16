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
	<script src="${path}/resources/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		function backToList(obj) {
			obj.action = "${path}/club_board/listArticles.do?club_code=${club_code}&cate=${cate}&tit=${tit}"
			obj.submit()
		}		
		
		//수정등록 버튼 클릭시 컨트롤러에게 수정 데이터를 전송 
		function fn_modify_article(obj) {
			obj.action = "${path}/club_board/modArticle.do?club_code=${club_code}&cate=${cate}&tit=${tit}"
			obj.submit()
		}
		
		function fn_removeModFile(_fileNo, _notice_num, _fileName, rowNum) {
			$.ajax({
				type: "post",
				url: "${path}/club_board/removeModFile.do",
				data : {fileNo: _fileNo, notice_num: _notice_num, fileName: _fileName},
				success: function(result, textStatus) {
					if(result == 'success') {
						alert("첨부파일을 삭제했습니다.")
						location.href="${path}/club_board/editArticle.do?removeCompleted=true&notice_num=${article.notice_num}&club_code=${club_code}&cate=${cate}&tit=${tit}"						
					}else {
						alert("다시 시도해 주세요.")
					}
				},
				error: function(result, textStatus) {
					alert("에러가 발생했습니다.")
				},
				complete: function(result, textStatus) {
					
				}					
			})
		}
		
		(function($){
			  
			  var $fileBox = null;
			  
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
			  
		})(jQuery);
		
		$(function() {
			$("#category").val('${article.category}')
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
			<h3>게시글 수정</h3>
			
			<form action="#" name="frmArticle" method="post" enctype="multipart/form-data">
				<input type="hidden" name="notice_num" id="notice_num" value="${article.notice_num}"/>
				<table id="boardFrm">
					<thead>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" name="title" id="title" style="width: 70%" value="${article.title}" placeholder="제목을 입력해주세요." />
								<select name="category" id="category">
									<option value="">카테고리</option>
									<option value="content">자유글</option>
									<option value="review">정모후기</option>
									<option value="signup">가입인사</option>
									<option value="notice">공지사항</option>
								</select>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>내용</th>
							<td>
								<textarea name="contents" id="contents" rows="20" cols="30">${article.contents}</textarea>
								<script>CKEDITOR.replace('contents')</script>								
							</td>
						</tr>
						
						<tr>
							<th>첨부파일</th>
							<td colspan="5">
								<c:set var="cnt" value="0" />
								<c:forEach var="file" items="${fileList}" varStatus="status">
									<div class="input-file">
										<input type="hidden" name="oldFileName" value="${file.fileName}" />
										<input type="hidden" name="fileNo" value="${file.fileNo}" />
				  						<input type="text" readonly="readonly" class="file-name" value="${file.fileName}" />
				  						<label for="upload0${status.count}" class="file-label">파일수정</label>
				  						<input type="file" name="file${status.count}" id="upload0${status.count}" class="file-upload" />
				  						<input type="button" value="삭제" class="file-label"
									   onclick="fn_removeModFile(${file.fileNo}, ${file.notice_num}, '${file.fileName}', ${status.count})" />
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
								
								<div class="input-file">
				  					<p>- 파일 확장자가 zip, pdf, hwp, doc, docx, txt, xls, xlsx, ppt, pptx, jpg, jpeg, gif, png, egg, dwg, max, psd, ai 인 파일만 업로드 하실 수 있습니다.</p>
									<p>  (파일명은 특수문자 *, #, $, &, 공백 사용이 오류가 발생할 수 있습니다.)</p>
									<p>- 첨부파일 1개당 최대 200MB 까지 업로드 가능합니다.</p>
								</div>				
							</td>
						</tr>
					</tbody>				
							
				</table>
				
				<div id="tr_btn" class="align_right">
					<input type="button" class="pointBtn" value="수정등록" onclick="fn_modify_article(frmArticle)" />
					<input type="button" class="basicBtn" value="취소" onclick="backToList(frmArticle)" />
				</div>				
			</form>
		</div>		
		
	</section>
</body>
</html>