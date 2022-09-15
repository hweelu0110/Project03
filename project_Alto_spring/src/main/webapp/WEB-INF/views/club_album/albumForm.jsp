<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="club_code" value="${param.club_code}" />
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
	<script src="${path}/resources/ckeditor/ckeditor.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		function validateForm() {
			if($("#title").val() == ""){
		        alert("제목을 입력하세요.");
		        $("#title").focus();
		        return false;
		      }
			if($("#upload01").val() == ""){
		        alert("사진을 첨부해주세요.");
		        $("#upload01").focus();
		        return false;
		      }
		}
		function backToList(obj) {
			obj.action = "${path}/club_album/albumList.do?club_code=${club_code}&cate=${cate}&tit=${tit}"
			obj.submit()
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
			<h3>사진첩 등록</h3>
			
			<form name="albumFrm" method="post" action="${path}/club_album/addNewAlbum.do?cate=${cate}&tit=${tit}" enctype="multipart/form-data" onsubmit="return validateForm()">
				<input type="hidden" name="club_code" value="${param.club_code}" />
				<input type="hidden" name="mem_id" value="${login.mem_id}" />
				
				<table id="boardFrm">					
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="title" id="title" style="width: 70%" placeholder="제목을 입력해주세요." />
						</td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td>
							<textarea name="contents" id="contents" rows="20" cols="20"></textarea>
							<script>CKEDITOR.replace('contents')</script>
						</td>
					</tr>
					
					<tr>
						<th>이미지 첨부</th>
						<td>
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
							
							<div class="input-file">
			  					<p>- 파일 확장자가 zip, pdf, hwp, doc, docx, txt, xls, xlsx, ppt, pptx, jpg, jpeg, gif, png, egg, dwg, max, psd, ai 인 파일만 업로드 하실 수 있습니다.</p>
								<p>  (파일명은 특수문자 *, #, $, &, 공백 사용이 오류가 발생할 수 있습니다.)</p>
								<p>- 첨부파일 1개당 최대 200MB 까지 업로드 가능합니다.</p>
							</div>
							
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<button type="reset" class="basicBtn" onclick="backToList(this.form)">취소</button>
							<button type="submit" class="pointBtn" onclick="return validateForm(this.form)">등록하기</button>
						</td>
					</tr>
				</table>	
			</form>
		</div>
	</section>
	
</body>
</html>