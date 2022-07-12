<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@include file="../layout/headinfo.jsp" %>
	<link rel="stylesheet" href="../resources/css/schedule.css" />
	<script src="../resources/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		function validateForm() {
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
	</script>
	<style type="text/css">
		.input-file [type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0 none;
}
.input-file .file-label {
  display: inline-block;
  min-width: 53px;
  height: 27px;
  line-height: 24px;
  padding: 0 10px;
  border-radius: 2px;
  font-size: 13px;
  background-color: #333;
  color: #fff;
  text-align: center;
}
.input-file .file-name {
  width: 500px;
  background: #f5f5f5;
  height: 27px;
  line-height: 26px;
  text-indent: 5px;
  border: 1px solid #bbb;
}

/* 접근성 탭 포커스 스타일 */
.file-focus {
  outline: 1px dotted #d2310e;
}
	</style>
</head>

<body>
	<%@include file="../layout/header.jsp" %>
	<%@include file="../layout/clubheader.jsp" %>
	
	<section>
	<h2>게시판 등록</h2>
	<form method="post"  onsubmit="return validateForm()">
		<table>
			<tr>
				<td width=200 style="word-break:break-all">작성자</td>
				<td>
					<input type="text" class="title2" style="width: 150px" id="name" />
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="title2" class="title2" style="width: 70%" placeholder="제목을 입력해주세요." />
					<select id="searchField">
							<option value="">전체보기</option>
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
					<textarea id="content" style="width: 70%; height: 100px;"></textarea>
					<script>CKEDITOR.replace('content');</script>

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
					  <label for="upload01" class="file-label">찾아보기</label>
					  <input type="file" name="" id="upload01" class="file-upload" />
					</div>
					<div class="input-file"  >
  					<input type="text" readonly="readonly" class="file-name" />
					  <label for="upload01" class="file-label">찾아보기</label>
					  <input type="file" name="" id="upload01" class="file-upload" />
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
					<button type="reset" class="btn01" onclick="location.href='Noticelist.jsp'">취소</button>
					<button type="submit" class="btn02">등록하기</button>
				</td>
			</tr>	
			
		</table>
		
	</form>
	</section>
	
	
 	<%@include file="../layout/footer.jsp" %>
</body>
</html>