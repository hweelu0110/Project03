<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${path}/resources/css/member.css" />
</head>
<body>
	<section>
		<div id="regiCont">
			<h1>이메일 인증</h1>
			<div>
				<p>반갑습니다 <span class="memName">${memberName}님!</span></p>
				<p> AlTo에 가입해주셔서 감사합니다.</p>
				<p class="memEmail">${memberEmail}</p>
				<p>위 메일주소로 회원 가입 인증 메일을 보냈습니다.</p>
				<p>메일 확인 후 <b>인증버튼</b>을 눌러주세요!</p>
			</div>	
		</div>
			
	</section>	
</body>
</html>