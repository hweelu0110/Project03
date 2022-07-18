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
		<div id="login_div">
			<h1>로그인</h1>
			<form name="loginFrm" method="post" action="${path}/member/login.do">
				<input type="text" name="mem_id" placeholder="이메일" /><br/>
				<input type="password" name="mem_pwd" placeholder="비밀번호" /><br/>
				<input type="checkbox" name="useCookie" id="loginKeep" />
				<label for="loginKeep">로그인 상태 유지</label><br/>
				<a>비밀번호를 잊으셨나요?</a>
				<a class="float_right">회원가입</a>
				<button type="submit" class="pointBtn size0" >로그인</button>
			</form>		
		</div>
	</section>
	
</body>
</html>