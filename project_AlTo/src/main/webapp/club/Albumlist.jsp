<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@include file="../headinfo.jsp" %>
	<link rel="stylesheet" href="../css/albumlayout.css" />
	<link rel="stylesheet" href="../css/schedule.css" />
</head>
<body>
	<%@include file="../header.jsp" %>
	<%@include file="../clubheader.jsp" %>
	
	<section>
		<h2>사진첩</h2>
	<ul>
	<li class="image">
		<a>
			<img alt="" src="../img/image.jpg" width="200" height="200">
		</a>
		<dl>
			<dt>
				<a>제목</a>
				<span></span>
			</dt>
			<dd>
				<span>작성자</span>
			</dd>
			<dd>
				<span>날짜</span>
				<span>조회수</span>
			</dd>
		</dl>
	</li>
	<li class="image">
		<a>
			<img alt="" src="../img/image.jpg" width="200" height="200">
		</a>
		<dl>
			<dt>
				<a>제목</a>
			</dt>
			<dd>
				<span>작성자</span>
			</dd>
			<dd>
				<span>날짜</span>
				<span>조회수</span>
			</dd>
		</dl>
	</li>
	<li>
		<a>
			<img alt="" src="../img/image.jpg" width="200" height="200">
		</a>
		<dl>
			<dt>
				<a>제목</a>
			</dt>
			<dd>
				<span>작성자</span>
			</dd>
			<dd>
				<span>날짜</span>
				<span>조회수</span>
			</dd>
		</dl>
	</li>
	</ul>
		<table width="100%">
			<tr align="right">
				<td class="td2">
					<button class="btn01" type="button" onclick="location.href='Albumregistration.jsp'">사진등록</button>
				</td>
			</tr>
		</table>
	</section>
	
		<%@include file="../footer.jsp" %>
</body>
</html>