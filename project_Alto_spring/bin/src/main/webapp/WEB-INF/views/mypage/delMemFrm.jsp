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
			$("#memDelet").click(function() {				
				let vali = checkExistData(memDelFrm.mem_pwd, memDelFrm.mem_pwd.value)
			
				if (!vali) {			
					return false
				} else {
					$.ajax({
						url: "${path}/mypage/pwCheck.do",
						type:"post",
						dataType: "json",
						data: $("#memDelFrm").serializeArray(),
						success: function(data) {
							if(data == 0) {
								confirmPopup($('#confirm_popup'), '비밀번호를 확인해주세요.')
								$("#mem_pwd").val("")
								$("#mem_pwd").focus()
								return
							}else {
								if(confirm("회원 탈퇴합니다.")) {
									$("#memDelFrm").submit()
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
			
		})
	</script>
</head>
<body>
	
	<section>
		<div id="memberInfo" class="form-check form-switch">
			<a href="${path}/mypage/myMain.do" class="backBtn">back</a>
			<h2>회원 탈퇴</h2>
			<form name="memDelFrm" id="memDelFrm" method="post" action="${path}/mypage/delMember.do">			
				<div class="memSection">
					<div class="memDelInfo">
						<p>회원탈퇴 신청 전 아래 사항을 확인해주세요.</p>
						<p>1. 사용하고 계신 아이디 (<span>${login.mem_id}</span>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</p>
						<p>2. 회원탈퇴 후에도 AlTo에 게시한 게시물은 그대로 남아있습니다.</p>
						<p>탈퇴 후에는 게시물을 편집하거나 삭제할 수 없습니다. 삭제를 원하시거나, 수정이 필요한 게시글이 있다면 <span>반드시 탈퇴 전 처리하거나 삭제하시기 바랍니다.</span></p>
						<p>3. 탈퇴 후 회원정보 및 개인 서비스 이용기록은 모두 삭제됩니다.</p>
						<p>4. 회원탈퇴 시 클래스, 취미용품에 대한 환불은 불가능합니다.</p>
					</div>
					
					<p>탈퇴하시겠습니까?</p>
					<p>탈퇴를 원하시면 비밀번호를 입력해주세요.</p>
					<input type="hidden" name="mem_id" value="${login.mem_id}" />
					<input type="text" name="_mem_id" value="${login.mem_id}" disabled />												
					<input type="password" id="mem_pwd" name="mem_pwd" class="essential" placeholder="비밀번호" />
					<span class="noti2">필수 입력입니다.</span>
				</div>
				<button id="memBack" type="button" class="basicBtn size0" onclick="location.href='${path}/mypage/infoEditFrm.do'">AlTo 계속 이용하기</button>
				<button id="memDelet" type="button" class="pointBtn size0">회원 탈퇴하기</button>
			</form>			
		</div>
	</section>
	
</body>
</html>