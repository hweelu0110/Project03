<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@include file="../headinfo.jsp" %>
	<link rel="stylesheet" href="../resources/css/schedule.css" />
	<style type="text/css">
	.commetimg{margin-top: 5px;}
	</style>
</head>
<body>
	<%@include file="../header.jsp" %>
	<%@include file="../clubheader.jsp" %>
	
	<section>
	<h2>게시판</h2>
	<form method="post"  onsubmit="return validateForm()">
		<table>
			<tr>
				<td>작성자</td>
				<td>홍길동</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>모임제목</td>
			</tr>
			<tr>
				<td>내용</td>
				<td height="100px">모임은 즐거워요</td>
			</tr>
			<tr>
				<td>파일 첨부</td>
				<td>
					<div class="input-file"  >
  					<input type="text"  style="width: 70%">
  					<label>다운로드</label>
					</div>

				</td>
			</tr>
		</table>
		
		<div class="commetimg">
			<a>
				<img alt="" src="../resources/img/heart.png" style="width:10px; height: 10px;">
				<a>좋아요</a>
				<a class="like">2</a>
		
				<img alt="" src="../resources/img/review.png" style="width:10px; height: 10px;">
				<a>댓글</a>
				<a>4</a>
		    </a>	
		</div>
			<div class="comment">
				<h3>댓글</h3>
				<textarea class="comment2"  aplaceholder="댓글을 남겨보세요" ></textarea>
			</div>
				<div class="comment3">
					<button class="btn03">등록</button>
				</div>
				
		
			
			<table>
			<tr>
				<td colspan="4" align="center">
					<button type="button" class="btn02" onclick="location.href='Noticelist.jsp'">목록보기</button>
					<button type="button" class="btn02" onclick="location.href='NoticeUpdate.jsp'">수정하기</button>
					<button type="button" class="btn01">삭제</button>
				</td>
			</tr>
		</table>
		
		
	</form>
	</section>
	
	
	
	<%@include file="../footer.jsp" %>
</body>
</html>