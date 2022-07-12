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
	<h2>일정 등록</h2>
	<form method="post"  onsubmit="return validateForm()">
		<table>
			<tr>
				<td width=200 style="word-break:break-all">작성자</td>
				<td>
					<input type="text" class="title" style="width: 150px" id="name" />
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="title2" class="title" style="width: 70%" placeholder="제목을 입력해주세요." />
				</td>
			</tr>
			<tr>
				<td>날짜/시간</td>
				<td>
					날짜 : <input type="date" id="date" class="title" />
					시간 : <input type="time" id="time" class="title"/>
				</td>
			</tr>
			<tr>
				<td>장소</td>
				<td>
					<div id="location">
						<span id="location2">장소를 입력해주세요.</span>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="reset" class="btn01" onclick="location.href='Schedule.jsp'">취소</button>
					<button type="submit" class="btn02">수정하기</button>
				</td>
			</tr>	
			
		</table>
		
	</form>
	</section>
	
	
	<%@include file="../layout/footer.jsp" %>
</body>
</html>