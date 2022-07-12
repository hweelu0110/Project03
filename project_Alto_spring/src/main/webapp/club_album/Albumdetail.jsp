<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@include file="../layout/headinfo.jsp" %>
	<link rel="stylesheet" href="../resources/css/schedule.css" />
	<style type="text/css">
	.img {margin-top: 10px; margin-bottom: 10px;}
	</style>
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
				<td>홍길동</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>모임제목</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<div class="img">
						<img alt="" src="../resources/img/image.jpg" style="width:500px; height: 500px;"><br/>
						<img alt="" src="../resources/img/image.jpg" style="width:500px; height: 500px;"><br/>
						<img alt="" src="../resources/img/image.jpg" style="width:500px; height: 500px;">
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
	
	
    
	<%@include file="../layout/footer.jsp" %>
</body>
</html>