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
	<script type="text/javascript">
		function checkAll() {
			if (!checkUserMail(memberFrm.email.value) &&
				!checkPass(memberFrm.mem_pwd.value, memberFrm.mem_pwd_2.value) &&
				!checkName(memberFrm.mem_name.value) &&
				!checkBirth(memberFrm.birth.value) &&
				$(".gender_div").find("span.select").length == 0) {
				$(".gender_div").next("span.noti2").css("display","block")
				return false
			}
			alert("입력완료!")
			return true	
		}
		
		function checkExistData(element, value) {
			if(value == "") {
				element.className += " notiTxt"
				let nextEle = element.nextElementSibling
				nextEle.textContent = "필수 입력입니다."
				nextEle.style.display = "block"
				return false
			}
			return true
		}
		
		function checkUserMail(email) {
			if (!checkExistData(memberFrm.email, email))
				return false
			
			let emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/
			if (!emailRegExp.test(email)) {
				memberFrm.email.className += " notiTxt"
				let nextEle = memberFrm.email.nextElementSibling
				nextEle.textContent = "올바른 이메일이 아닙니다."
				nextEle.style.display = "block"
				
				memberFrm.email.value=""
				memberFrm.email.focus()
				return false
			}
		}
		
		function checkPass(pwd1, pwd2) {
			if (!checkExistData(memberFrm.mem_pwd, pwd1) && 
				!checkExistData(memberFrm.mem_pwd_2, pwd2))
				return false
			
			let password1RegExp = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,12}$/        
				
			if (!password1RegExp.test(pwd1)) {  
				memberFrm.mem_pwd.className += " notiTxt"
				let nextEle = memberFrm.mem_pwd.nextElementSibling
				nextEle.textContent = "영문 대소문자와 숫자 조합, 8~12자"
				nextEle.style.display = "block"          
				         
				memberFrm.mem_pwd.value = ""  
				memberFrm.mem_pwd_2.value = ""           
				memberFrm.mem_pwd.focus()            
				return false     
			}        
			
			if (pwd1 != pwd2) {  
				nextEle = memberFrm.mem_pwd_2.nextElementSibling
				nextEle.textContent = "패스워드가 일치하지 않습니다."
				nextEle.style.display = "block"
				                    
				memberFrm.mem_pwd_2.value = ""            
				memberFrm.mem_pwd_2.focus()           
				return false        
			}					
		}
		
		function checkName(name) {
			if (!checkExistData(memberFrm.mem_name, name))
				return false
		}
		
		function checkBirth(birth) {
			if (!checkExistData(memberFrm.birth, birth))
				return false
		}
						
		$(function() {
			$("#datepicker").datepicker({
				changeMonth: true,
				changeYear: true,
				minDate: '-70y',
				yearRange: 'c-70:c+0',
				dateFormat: 'yy-mm-dd',
				showMonthAfterYear: true,
				dayNamesMin: ['일','월','화','수','목','금','토'],
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			})
			
			$(".gender_div span").click(function() {
				$(this).addClass("select")
				$(this).siblings().removeClass("select")
				$(".gender_div").next("span.noti2").css("display","none")
			})
		})
	</script>	
</head>
<body>
	<%@include file="../layout/header.jsp" %>
	
	<section>
		<div id="member_div">
			<h2>회원정보입력</h2>
			<form name="memberFrm" method="post" onsubmit="return checkAll()">
				<div class="memSection memInfo">
					<input type="text" name="email" class="essential" placeholder="이메일" />
					<span class="noti2">필수 입력입니다.</span>
					<div class="align_div float_left">
						<input type="password" name="mem_pwd" class="essential" placeholder="비밀번호" />
						<span class="noti2">필수 입력입니다.</span>
					</div>
					<div class="align_div float_right">
						<input type="password" name="mem_pwd_2" class="essential" placeholder="비밀번호 확인" />
						<span class="noti2">필수 입력입니다.</span>	
					</div>	
					<div class="info_div">
						<div class="align_div float_left">
							<input type="text" name="mem_name" class="essential" placeholder="이름" />
							<span class="noti2">필수 입력입니다.</span>
						</div>
						<div class="align_div float_right">
							<div class="gender_div"><span class="gender">남</span><span class="gender">여</span></div>
							<span class="noti2">필수 입력입니다.</span>
						</div>
					</div>				
					
					<div class="align_div float_left">
						<input type="text" id="datepicker" name="birth" class="essential" placeholder="생일" autocomplete='off' />
						<span class="noti2">필수 입력입니다.</span>	
					</div>					
					<div class="align_div float_right">
						<input type="text" name="phone" placeholder="휴대폰" />
					</div>
				</div>
				<button id="joinBtn" type="submit" class="pointBtn size0">가입하기</button>
			</form>			
			
		</div>
	</section>
	
	<%@include file="../layout/footer.jsp" %>
</body>
</html>