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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
		function validateForm() {
			if($("#title2").val() == ""){
		        alert("제목을 입력하세요.");
		        $("#title2").focus();
		        return false;
		      }
			if($("#upload01").val() == ""){
		        alert("사진을 첨부해주세요.");
		        $("#upload01").focus();
		        return false;
		      }
		}
		function backToList(obj) {
			obj.action = "${contextPath}/club_album/Albumlist.do"
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
	<h2>사진 등록</h2>
	<form name="Albumregistration" method="post" action="${contextPath}/club_album/addNewAlbum.do" enctype="multipart/form-data" onsubmit="return validateForm()">
		<table>
			<tr>
				<td width=200 style="word-break:break-all">작성자</td>
				<td>
					<input type="text" class="title2" value="${login.mem_id }" style="width: 150px" id="name" disabled />
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="title2" class="title2" style="width: 70%" placeholder="제목을 입력해주세요." />
				</td>
			</tr>
			
			<tr>
				<td>파일 첨부</td>
				<td>
					<div class="input-file"  >
  					<input type="text" readonly="readonly" class="file-name" />
					  <label for="upload01" class="file-label">찾아보기</label>
					  <input type="file" name="" id="upload01" class="file-upload" />
					</div>
					<div class="input-file"  >
  					<input type="text" readonly="readonly" class="file-name" />
					  <label for="upload02" class="file-label">찾아보기</label>
					  <input type="file" name="" id="upload02" class="file-upload" />
					</div>
					<div class="input-file"  >
  					<input type="text" readonly="readonly" class="file-name" />
					  <label for="upload03" class="file-label">찾아보기</label>
					  <input type="file" name="" id="upload03" class="file-upload" />
					</div>
					
					<div class="input-file"  >
  					<p>- 파일 확장자가 zip,pdf,hwp,doc,docx,txt,xls,xlsx,ppt,pptx,jpg,jpeg,gif,png,egg,dwg,max,psd,ai인파일만 업로드하실 수 있습니다.</p>
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