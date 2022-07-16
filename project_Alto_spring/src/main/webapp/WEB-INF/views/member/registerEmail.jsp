<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		let memberEmail = "${memberEmail}"
		
		alert(memberEmail + '님 회원가입을 축하합니다. 이제 로그인이 가능합니다. 확인 버튼을 누르면 로그인 페이지로 이동합니다.')
		
		self.location = "${path}/member/loginFrm.do"
	</script>
</body>
</html>