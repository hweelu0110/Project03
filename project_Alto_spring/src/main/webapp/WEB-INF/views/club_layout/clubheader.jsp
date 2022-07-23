<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div id="title">
		<h2>
			<a>모임 이름</a>
		</h2>
		
	</div>
	<div id="menu1">
		<ul>
			<li><a href="${contextPath}/club/clubInformation.do">정보</a></li>
			<li><a href="${contextPath}/club_notice/Noticelist.do">게시판</a></li>
			<li><a href="${contextPath}/club_album/Albumlist.do">사진첩</a></li>
			<li><a href="../club/clubChat.jsp">채팅</a></li>
		</ul>
	</div>