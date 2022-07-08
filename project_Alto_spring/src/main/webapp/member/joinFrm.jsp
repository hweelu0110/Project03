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
	<meta name="viewport" content="width=device-width, inital-scale=1.0">	
	<%@include file="../layout/headinfo.jsp" %>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="../resources/css/member.css" />	
	<script src="../resources/js/essential-textbox.js"></script>	
</head>
<body>
	<%@include file="../layout/header.jsp" %>
	
	<section>
		<div id="member_div" class="member_info">
			<h2>회원정보입력</h2>
			<form name="memberFrm" method="post" onsubmit="return checkAll()">
				<div class="memSection">
					<input type="text" name="email" class="essential" placeholder="이메일" />
					<span class="noti2">필수 입력입니다.</span>
					
					<input type="password" name="mem_pwd" class="essential" placeholder="비밀번호" />
					<span class="noti2">필수 입력입니다.</span>				
				
					<input type="password" name="mem_pwd_2" class="essential" placeholder="비밀번호 확인" />
					<span class="noti2">필수 입력입니다.</span>	
						
					<div class="info_div">
						<div class="align_div float_left">
							<input type="text" name="mem_name" class="essential" placeholder="이름" />
							<span class="noti2">필수 입력입니다.</span>
						</div>
						<div class="align_div float_right">
							<div class="gender_div"><span class="gender">남</span><span class="gender">여</span></div>
							<span class="noti2">필수 선택</span>
						</div>
					</div>				
										
					<input type="text" id="datepicker" name="birth" class="essential" placeholder="생일" autocomplete='off' />
					<span class="noti2">필수 입력입니다.</span>	
					
				</div>
				<button id="joinBtn" type="submit" class="pointBtn size0">가입하기</button>
			</form>			
			
		</div>
	</section>
	
	<%@include file="../layout/footer.jsp" %>
</body>
</html>