<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<%@include file="../layout/headinfo.jsp" %>
	<link rel="stylesheet" href="../resources/css/member.css" />	
	<script src="../resources/js/essential-textbox.js"></script>	
	<script type="text/javascript">
		$(function() {
						
		})
	</script>	
</head>
<body>
	<%@include file="../layout/header.jsp" %>
	
	<section>
		<div id="member_div">
			<h2>회원정보입력</h2>
						
			<div class="memSection memInfo">
				<form action="" name="deliveryFrm" method="post">
					<input type="text" name="email" class="essential" placeholder="이메일" />
					<span class="noti2">필수 입력입니다.</span>
					<div class="align_div float_left">
						<input type="text" name="mem_pwd" class="essential" placeholder="비밀번호" />
						<span class="noti2">필수 입력입니다.</span>
					</div>
					<div class="align_div float_right">
						<input type="text" name="mem_pwd_confirm" class="essential" placeholder="비밀번호 확인" />
						<span class="noti2">필수 입력입니다.</span>	
					</div>					
					<input type="text" name="mem_name" class="essential size1" placeholder="이름" />
					<span class="noti2">필수 입력입니다.</span>
					<div class="gender_div"><span class="gender">남</span><span class="gender">여</span></div>
					<div class="align_div float_left">
						<input type="text" name="birth" class="essential" placeholder="생일" />
						<span class="noti2">필수 입력입니다.</span>	
					</div>					
					<div class="align_div float_right">
						<input type="text" name="phone" placeholder="휴대폰" />
					</div>									
				</form>				
			</div>
						
			<button id="joinBtn" type="submit" class="pointBtn size0" disabled onclick="location.href='mainConfirm.jsp'">가입하기</button>
		</div>
	</section>
	
	<%@include file="../layout/footer.jsp" %>
</body>
</html>