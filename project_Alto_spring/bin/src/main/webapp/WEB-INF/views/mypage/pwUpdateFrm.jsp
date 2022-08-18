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
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="${path}/resources/css/member.css" />
	<link rel="stylesheet" href="${path}/resources/css/mypage.css" />		
	<script type="text/javascript">	
		function checkPass(pwd1, pwd2) {
			if (!checkExistData(pwUpdateFrm.mem_pwd1, pwd1) && !checkExistData(pwUpdateFrm.mem_pwd2, pwd2))
				return false
			
			let password1RegExp = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,12}$/        
				
			if (!password1RegExp.test(pwd1)) {  
				pwUpdateFrm.mem_pwd1.className += " notiTxt"
				let nextEle = pwUpdateFrm.mem_pwd1.nextElementSibling
				nextEle.textContent = "영문 대소문자와 숫자 조합, 8~12자"
				nextEle.style.display = "block" 
				nextEle.style.color = "#00c7ae" 
				pwUpdateFrm.mem_pwd1.style.borderColor = "#00c7ae"       
				         
				pwUpdateFrm.mem_pwd1.value = ""  
				pwUpdateFrm.mem_pwd2.value = ""           
				pwUpdateFrm.mem_pwd1.focus()            
				return false     
			}        
			
			if (pwd1 != pwd2) {  
				nextEle = pwUpdateFrm.mem_pwd2.nextElementSibling
				nextEle.textContent = "패스워드가 일치하지 않습니다."
				nextEle.style.display = "block"
				nextEle.style.color = "#00c7ae"
				pwUpdateFrm.mem_pwd2.style.borderColor = "#00c7ae" 
				                    
				pwUpdateFrm.mem_pwd2.value = ""            
				pwUpdateFrm.mem_pwd2.focus()           
				return false        
			}
			return true
								
		}
		
		function checkPass2(pwd, pwd1) {
			if (pwd1 != "") {
				if (pwd == pwd1) {
					let nextEle = pwUpdateFrm.mem_pwd1.nextElementSibling
					nextEle.textContent = "기존 비밀번호와 다른 비밀번호를 입력하세요."
					nextEle.style.display = "block" 
					nextEle.style.color = "#00c7ae" 
					pwUpdateFrm.mem_pwd1.style.borderColor = "#00c7ae"       
					         
					pwUpdateFrm.mem_pwd1.value = ""  
					pwUpdateFrm.mem_pwd2.value = ""  
					pwUpdateFrm.mem_pwd2.style.borderColor = "#e4e4e4"  
					pwUpdateFrm.mem_pwd2.nextElementSibling.style.display = "none"       
					pwUpdateFrm.mem_pwd1.focus()            
					return false
				}
			}			
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
		
		
		$(function() {	
			$("span.noti2").css("display","none")
			$("#pwUpdate").click(function() {				
				let old_pass = checkExistData(pwUpdateFrm.mem_pwd, pwUpdateFrm.mem_pwd.value)
				let ch_pass = checkPass(pwUpdateFrm.mem_pwd1.value, pwUpdateFrm.mem_pwd2.value)
				let chage_pass = checkPass2(pwUpdateFrm.mem_pwd.value, pwUpdateFrm.mem_pwd1.value)
				
				let vali = ch_pass && old_pass && chage_pass
				if (!vali) {			
					return false
				} else {
					$.ajax({
						url: "${path}/mypage/pwCheck.do",
						type:"post",
						dataType: "json",
						data: $("#pwUpdateFrm").serializeArray(),
						success: function(data) {
							if(data == 0) {
								confirmPopup($('#confirm_popup'), '기존 비밀번호가 틀렸습니다.')
								$("#mem_pwd").val("")
								$("#mem_pwd").focus()
								return
							}else {
								if(confirm("비밀번호를 변경하시겠습니까?")) {
									$("#pwUpdateFrm").submit()
								}
							}
						}
					})
					return false
				}					
			})	
			
			/* 필수입력 체크 */	
			$("#memberInfo .essential").on("change keyup paste", function() {
				if ($(this).val() == "") {
					$(this).addClass("notiTxt")
					$(this).next("span.noti2").text("필수 입력입니다.")			
					$(this).next("span.noti2").css("display","block")
					$(this).css("border-color", "#F3BE34")	
					$(this).next("span.noti2").css("color","#F3BE34")
				}else {
					$(this).removeClass("notiTxt")
					$(this).css("border-color", "#e4e4e4")
					$(this).next("span.noti2").css("display","none")
				}
			})
			
			/* 비밀번호 입력 양식 알림 */
			$("#mem_pwd1").on("keyup click", function() {
				$(this).next("span.noti2").text("영문 대소문자와 숫자 조합, 8~12자")			
				$(this).next("span.noti2").css("display","block")
				$(this).next("span.noti2").css("color","#00c7ae")
				$(this).css("border-color","#00c7ae")
			})
		})
	</script>
</head>
<body>
	
	<section>
		<div id="memberInfo" class="form-check form-switch">
			<a href="${path}/mypage/myMain.do" class="backBtn">back</a>
			<h2>비밀번호 변경</h2>
			<form name="pwUpdateFrm" id="pwUpdateFrm" method="post" action="${path}/mypage/pwUpdate.do">
				<input type="hidden" name="mem_id" value="${login.mem_id}" />
				<input type="hidden" name="memberId_yn" value="${login.memberId_yn}" />
				<div class="memSection">												
					<input type="password" id="mem_pwd" name="mem_pwd" class="essential" placeholder="기존 비밀번호" />
					<span class="noti2">필수 입력입니다.</span>
					<input type="password" id="mem_pwd1" name="mem_pwd1" class="essential" placeholder="변경 비밀번호" />
					<span class="noti2">필수 입력입니다.</span>
					<input type="password" id="mem_pwd2" name="mem_pwd2" class="essential" placeholder="변경 비밀번호 확인" />	
					<span class="noti2">필수 입력입니다.</span>		
				</div>
				<button id="pwUpdate" type="button" class="pointBtn size0">비밀번호 변경하기</button>
			</form>			
		</div>
	</section>
	
</body>
</html>