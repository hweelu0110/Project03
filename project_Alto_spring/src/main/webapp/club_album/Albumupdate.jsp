<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@include file="../layout/headinfo.jsp" %>
	<link rel="stylesheet" href="../resources/css/schedule.css" />
</head>
<body>
	<%@include file="../layout/header.jsp" %>
	<%@include file="../layout/clubheader.jsp" %>
	<section>
	<h2>사진첩</h2>
	<form>
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
				</td>
			</tr>
			
			<tr>
				<td>파일 첨부</td>
				<td>
					<div class="input-file"  >
  					<input type="text"  style="width: 70%">
  					<label>삭제</label>
  					<label>찾아보기</label>
					</div>
					<div class="input-file"  >
  					<input type="text"  style="width: 70%">
  					<label>찾아보기</label>
					</div>
					<div class="input-file"  >
  					<input type="text"  style="width: 70%">
  					<label>찾아보기</label>
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
					<button type="reset" class="btn01" onclick="location.href='Albumdetail.jsp'">취소</button>
					<button type="submit" class="btn02">수정하기</button>
				</td>
			</tr>	
			
		</table>
		
	</form>
	</section>
	
	
	<%@include file="../layout/footer.jsp" %>
</body>
</html>