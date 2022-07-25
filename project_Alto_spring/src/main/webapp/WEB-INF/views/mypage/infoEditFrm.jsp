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
	<script src="${path}/resources/js/essential-textbox.js"></script>	
	<script type="text/javascript">
		$(function() {
			if($("#gender").val() == 'M') {
				$(".gender_div span:nth-child(1)").addClass("select")
			}else {
				$(".gender_div span:nth-child(2)").addClass("select")
			}
			
			if($("#mem_open").val() == 'Y') {
				$("#_mem_open").val() = 'on'
			}else {
				$("#_mem_open").val() = 'off'
			}
			
			/* $("#_mem_open").click(function() {
				if($(this).val() == 'on') {
					$(this).attr("checked","checked")
				}else {
					$(this).attr()
				}
			}) */
		})
	</script>
</head>
<body>
	
	<section>
		<div id="memberInfo" class="form-check form-switch">
			<h2>회원정보수정</h2>
			<form id="join" name="modMemberFrm" method="post" action="${path}/mypage/modMemberInfo.do">
				<input type="hidden" name="mem_id" value="${login.mem_id}" />
				<input type="hidden" name="memberId_yn" value="${login.memberId_yn}" />
				<div class="memSection">
					<div class="info_div">
						<div class="align_div float_left">
							<input type="text" name="mem_name" class="essential" placeholder="이름" value="${login.mem_name}" />
							<span class="noti2">필수 입력입니다.</span>
						</div>
						<div class="align_div float_right">
							<input type="hidden" name="gender" id="gender" value="${login.gender}" />
							<div class="gender_div"><span class="gender">남</span><span class="gender">여</span></div>
							<span class="noti2">필수 선택</span>
						</div>
					</div>										
					<input type="text" id="datepicker" name="birth" class="essential" placeholder="생일" value="${login.birth}" autocomplete='off' />
					<span class="noti2">필수 입력입니다.</span>	
					<input type="text" id="phone" name="phone" placeholder="휴대폰" value="${login.phone}" />
					<input type="hidden" id="mem_open" name="mem_open" value="${login.mem_open}" />
					<input class="form-check-input" type="checkbox" name="_mem_open" id="_mem_open" checked="none" />
					<label class="form-check-label" for="_mem_open">정보 공개 여부</label><br/>					
				</div>
				<button id="joinBtn" type="submit" class="pointBtn size0" onclick="return checkAll(modMemberFrm)">수정하기</button> 
				<button type="button" class="basicBtn02 size0">비밀번호 변경하기</button>
				<button type="button" class="basicBtn size0">회원탈퇴</button>				 
			</form>			
		</div>
	</section>
	
</body>
</html>