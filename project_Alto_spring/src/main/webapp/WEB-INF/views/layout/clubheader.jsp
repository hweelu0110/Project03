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
</head>
<body>
	<div id="menu1">
		<ul>
			<li><a href="${path}/club/clubInformation.do?club_code=${clubInfo.club_code}">정보</a></li>
			<li><a href="${path}/club/Noticelist.do?club_code=${clubInfo.club_code}">게시판</a></li>
			<li><a href="${path}/club/Albumlist.do?club_code=${clubInfo.club_code}">사진첩</a></li>
			<li><a href="${path}/club/clubChat.do?club_code=${clubInfo.club_code}">채팅</a></li>
		</ul>
	</div>	
</body>
</html>