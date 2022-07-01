<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@include file="../headinfo.jsp" %>
	<link rel="stylesheet" href="../css/schedule.css" />
	
</head>
<body>
	<%@include file="../header.jsp" %>
	<%@include file="../clubheader.jsp" %>
	
	<section>
	<h2>일정 등록</h2>
	<form method="post"  onsubmit="return validateForm()">
		<table>
			<tr>
				<td>작성자</td>
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
	
	
	<%@include file="../footer.jsp" %>
</body>
</html>