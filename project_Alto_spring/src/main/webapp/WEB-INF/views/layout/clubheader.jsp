<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>clubheader</title>	
</head>
<body>

	<div id="title">
		<h2>
			<a>모임 이름</a>
		</h2>
		
	</div>
	<div id="menu1">
		<ul>
			<li><a href="${path}/club/clubInformation.do">정보</a></li>
			<li><a href="${path}/club/Noticelist.do">게시판</a></li>
			<li><a href="${path}/club/Albumlist.do">사진첩</a></li>
			<li><a href="${path}/club/clubChat.do">채팅</a></li>
		</ul>
	</div>
	
</body>
</html>