<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@include file="/WEB-INF/views/layout/headinfo.jsp" %>
	<link rel="stylesheet" href="../resources/css/albumlayout.css" />
	<link rel="stylesheet" href="../resources/css/schedule.css" />
</head>
<body>
	<section>
		<h2>사진첩</h2>
	<div class="div1">
		<ul>
		<li class="image">
			<a>
				<img alt="" src="../resources/img/image.jpg" width="200" height="200">
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
				<img alt="" src="../resources/img/image.jpg" width="200" height="200">
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
		<li class="image">
			<a>
				<img alt="" src="../resources/img/image.jpg" width="200" height="200">
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
						<a href="${contextPath}/club_notice/Albumlist.do"><button class="btn02" type="button">사진등록</button></a>
					</td>
				</tr>
			</table>
	</div>
	
	</section>
	
</body>
</html>