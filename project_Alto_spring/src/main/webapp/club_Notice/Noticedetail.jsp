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
	<h2>게시판</h2>
	<form method="post"  onsubmit="return validateForm()">
		<table>
			<tr>
<<<<<<< HEAD
				<td>작성자</td>
				<td>
					<input type="text" class="title2" style="width: 150px" id="name" />
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="title2" class="title2" style="width: 70%" />
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
				</td>
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
=======
				<td width=200 style="word-break:break-all">작성자</td>
				<td>홍길동</td>
			</tr>
			<tr>
				<td width=200 style="word-break:break-all">제목</td>
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
				
		
>>>>>>> refs/remotes/origin/woosb
			
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