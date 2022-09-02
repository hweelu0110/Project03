<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${contextPath}/resources/css/club/schedule.css" />
	<script src="../resources/ckeditor/ckeditor.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		function validateForm(form) {
			if($("#title2").val() == ""){
		        alert("제목을 입력하세요.");
		        $("#title2").focus();
		        return false;
		      }
			
			if($("#searchField").val() == ""){
		        alert("카테고리를 선택해주세요.");
		        return false;
		      }

			if($("#content").val() == ""){
		        alert("내용을 입력해주세요.");
		        $("#content").focus();
		        return false;

		      }
		}
		
		function backToList(obj) {
			obj.action = "${contextPath}/club_board/listArticles.do"
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
	<h2>게시판 등록</h2>
	<form  name="articleForm" method="post" action="${contextPath}/club_board/addNewArticle.do" enctype="multipart/form-data"  onsubmit="return validateForm(this)">
		<input type="hidden" name="club_code" value="${param.club_code}" />
		<input type="hidden" name="mem_id" value="${login.mem_id}" />
		<table style="border-bottom: none;">
			<tr>
				<td width=200 style="word-break:break-all;" >작성자</td>
				<td>
					<input type="text" style="width: 150px;" name="name" value="${login.mem_name }" disabled/>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" style="width: 70%" placeholder="제목을 입력해주세요." />
					<select name="category">
							<option value="">카테고리</option>
							<option value="content">자유글</option>
							<option value="review">정모후기</option>
							<option value="signup">가입인사</option>
							<option value="notice">공지사항</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="contents" style="width: 70%; height: 100px;"></textarea>
					<script>CKEDITOR.replace('content');</script>

				</td>
			</tr>
			<tr>
				<td>파일 첨부</td>
				<td>
					<div class="input-file"  >
  					<input type="text" readonly="readonly" class="file-name" />
					  <label for="upload01" class="file-label">찾아보기</label>
					  <input type="file" name="upload01" id="upload01" class="file-upload" />
					</div>
					<div class="input-file"  >
  					<input type="text" readonly="readonly" class="file-name" />
					  <label for="upload02" class="file-label">찾아보기</label>
					  <input type="file" name="upload02" id="upload02" class="file-upload" />
					</div>
					<div class="input-file"  >
  					<input type="text" readonly="readonly" class="file-name" />
					  <label for="upload03" class="file-label">찾아보기</label>
					  <input type="file" name="upload03" id="upload03" class="file-upload" />
					</div>
					
					<div class="input-file"  >
  					<p>- 파일 확장자가 zip, pdf, hwp, doc, docx, txt, xls, xlsx, ppt, pptx, jpg, jpeg, gif, png, egg, dwg, max, psd, ai인파일만 업로드하실 수 있습니다.</p>
					<p>(파일명은 특수문자 *,#, $ 등 & 공백 사용금지!)</p>
					<p>- 파일 업로드 시, 첨부파일 1개당 200MB 까지 가능합니다.</p>
					</div>
					
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="reset" class="btn01" onclick="backToList(this.form)">취소</button>
					<button type="submit" class="btn02">등록하기</button>
				</td>
			</tr>	
			
		</table>
		
	</form>
	</section>
</body>
</html>