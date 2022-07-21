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
			<h1>임시비밀번호 발급</h1>
			<div>
				<p>아래의 메일주소로 임시 비밀번호가 전송되었습니다.</p>
				<p class="memEmail">${param.mem_id}</p>
				<button type="button" class="pointBtn" onclick="location.href='${path}/member/loginFrm.do'">로그인 하기</button>
				<button type="button" class="basicBtn" onclick="location.href='${path}/main.do'">메인페이지</button>
			</div>		
		</div>
	</section>	
</body>
</html>