<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@include file="../headinfo.jsp" %>
	<link rel="stylesheet" href="../css/schedule.css" />
	<style type="text/css">
	.img {margin-top: 10px; margin-bottom: 10px;}
	</style>
</head>
<body>

	<%@include file="../header.jsp" %>
	<%@include file="../clubheader.jsp" %>
	
	<section>
	<h2>사진첩</h2>
	<form>
		<table>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" class="title2" style="width: 150px" id="name" />
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="title2" class="title2" style="width: 70%"/>
				</td>
			</tr>
			
			
		</table>
		<div class="img">
				<img alt="" src="../img/image.jpg" style="width:500px; height: 500px;"><br/>
				<img alt="" src="../img/image.jpg" style="width:500px; height: 500px;"><br/>
				<img alt="" src="../img/image.jpg" style="width:500px; height: 500px;">
		</div>
		<hr>
		
		<div>
				<a>
					<img alt="" src="image/heart.png" style="width:10px; height: 10px;">
					<a>좋아요</a>
					<a></a>
				</a>
					<img alt="" src="image/review.png" style="width:10px; height: 10px;">
					<a>댓글</a>
					<a></a>
					
			</div>
			<div>
				<div>
					<h3>댓글</h3>
				</div>
			</div>
			<div>
				<div>
					<strong>댓글을 입력하세요</strong>
					<em></em>
					<textarea rows="" cols="" placeholder="댓글을 남겨보세요">
					
					</textarea>
				</div>
				<div>
					<a role="button">취소</a>
					<a role="button">등록</a>
				</div>
				
			</div>
			
			<table>
			<tr>
				<td colspan="4" align="center">
					<button type="button" class="btn02" onclick="location.href='Albumlist.jsp'">목록보기</button>
					<button type="button" class="btn02" onclick="location.href='Albumupdate.jsp'">수정하기</button>
					<button type="button" class="btn01">삭제</button>
				</td>
			</tr>
		</table>
		
		
	</form>
	</section>
	
	
    
	<%@include file="../footer.jsp" %>
</body>
</html>