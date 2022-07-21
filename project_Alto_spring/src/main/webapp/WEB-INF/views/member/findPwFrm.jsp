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
	<script type="text/javascript">
		$(function () {	
			if ($("#login_error p").text() != "") {
				findPwFrm.mem_id.focus()
				findPwFrm.mem_id.style.border = "1px solid #F3BE34"
				$("#login_error").css("visibility","visible")
			}		
		
			$('input').focusin(function() {
				$(this).css("border","1px solid #F3BE34")
			})
			$('input').focusout(function() {
				$(this).css("border","1px solid #e4e4e4")
			})
			
			$('input').keyup(function() {
				if ($(this).val().length > 1) {
					$("#login_error").css("visibility","hidden")
				} 
			})
		})	
	</script>
</head>
<body>
	<section>
		<div id="login_div">
			<h1>임시비밀번호 발급</h1>
			<div id="login_error"><p>${msg}</p></div>
			<form name="findPwFrm" class="form-check" method="post" action="${path}/member/findPw.do">
				<input type="text" name="mem_id" class="essential" placeholder="이메일" /><br/>
				<button type="submit" class="pointBtn size0">임시 비밀번호 전송</button>
			</form>		
		</div>
	</section>	
</body>
</html>