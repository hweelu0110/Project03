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
	<script src="${path}/resources/js/essential-textbox.js"></script>
	<c:choose>
		<c:when test="${param.result == 'loginCheck' }">
			<script type="text/javascript">
				window.onload=function() {
					loginFrm.mem_id.value = "${param.mem_id}";
					if(loginFrm.mem_id.value == "") {
						loginFrm.mem_id.focus()
					}else {
						loginFrm.mem_pwd.focus()
					}
					
					$("#login_error").css("visibility","visible")
					document.getElementById('login_error').innerHTML = "<p>아이디 또는 비밀번호를 잘못 입력했습니다.<br/>확인 후 다시 입력해주세요.</p>"
				}
			</script>
		</c:when>
		<c:when test="${param.result == 'authCheck' }">
			<script type="text/javascript">
				window.onload=function() {
					loginFrm.mem_id.focus()
					$("#login_error").css("visibility","visible")
					document.getElementById('login_error').innerHTML = "<p>이메일 인증이 완료되지 않았습니다.<br/>메일인증 후 로그인 해주세요.</p>"
				}
			</script>
		</c:when>
	</c:choose>
	<script type="text/javascript">
		$(function () {
			$('input').focusin(function() {
				$(this).css("border","1px solid #F3BE34")
			})
			$('input').focusout(function() {
				$(this).css("border","1px solid #e4e4e4")
			})
		})	
	
		function validation() {
			if(loginFrm.mem_id.value == "") {
				$("#login_error").css("visibility","visible")
				document.getElementById('login_error').innerHTML = "<p>아이디를 입력해주세요.</p>"
				loginFrm.mem_id.focus()
				return false
			}
			
			if(loginFrm.mem_pwd.value == "") {
				$("#login_error").css("visibility","visible")
				document.getElementById('login_error').innerHTML = "<p>비밀번호를 입력해주세요.</p>"
				loginFrm.mem_pwd.focus()
				return false
			}
			return true 
		}
	</script>
</head>
<body>	
	<section>
		<div id="login_div" class="form-check form-switch">
			<h1>로그인</h1>
			<form name="loginFrm" class="form-check" method="post" action="${path}/member/login.do">
				<input type="text" name="mem_id" class="essential" placeholder="이메일" /><br/>
				<input type="password" name="mem_pwd" class="essential" placeholder="비밀번호" /><br/>
				<input class="form-check-input" type="checkbox" name="useCookie" id="loginKeep" />
				<label class="form-check-label" for="loginKeep">로그인 상태 유지</label><br/>
				<div id="login_error"></div>
				<a>비밀번호를 잊으셨나요?</a>
				<a class="float_right">회원가입</a>
				<button type="submit" class="pointBtn size0" onclick="return validation()">로그인</button>
			</form>		
		</div>
	</section>
	
</body>
</html>