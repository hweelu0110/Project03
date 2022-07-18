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
	<script src="${path}/resources/js/essential-textbox.js"></script>	
	<script type="text/javascript">
		function duplicate() {
			let _mem_id = $("#_mem_id").val()	
			if(_mem_id == "") {
				$("#_mem_id").addClass("notiTxt");
				$("#_mem_id").next("span.noti2").css("display","block")
				return
			}
						
			$.ajax({
				type: "post",
				url: "${path}/member/idCnt.do",
				dataType: "text",
				data: {mem_id: _mem_id},
				success: function (data, textStatus) {
					if (data == 'false') {
						$("#btnDupl").prop("disabled", true)
						$("#btnDupl").removeClass("pointBtn")
						$("#btnDupl").addClass("basicBtn")
						$("#_mem_id").prop("disabled", true)
						$("#mem_id").val(_mem_id)
						$("#_mem_id").next("span.noti2").css("display", "block")
						$("#_mem_id").next("span.noti2").css("color", "#00c7ae")
						$("#_mem_id").css("font-weight","bold")
						$("#_mem_id").css("border-color", "#e4e4e4")				
						$("#_mem_id").next("span.noti2").text("사용 가능한 이메일입니다.")
						$("#memberId_yn").val("Y")
						$("#mem_pwd").focus()
					}else {
						$("#_mem_id").next("span.noti2").css("display", "block")
						$("#_mem_id").next("span.noti2").css("color", "#00c7ae")
						$("#_mem_id").next("span.noti2").text("사용할 수 없는 이메일입니다.")
						$("#_mem_id").css("border-color", "#00c7ae")
						$("#_mem_id").focus()
					}
				},
				error: function (data, textStatus) {
					alert("에러가 발생했습니다.")
				}
			})
		}
	</script>
</head>
<body>
	
	<section>
		<div id="member_div" class="member_info">
			<h2>회원정보입력</h2>
			<form id="join" name="memberFrm" method="post" action="${path}/member/register.do">
				<div class="memSection">
					<div class="info_div">
						<div class="align_div float_left">
							<input type="hidden" id="memberId_yn" name="memberId_yn" value="N"/>
							<input type="hidden" name="mem_id" id="mem_id" />
							<input type="text" name="_mem_id" id="_mem_id" class="essential" placeholder="이메일" />
							<span class="noti2">필수 입력입니다.</span>
						</div>
						<div class="align_div float_right">
							<a class="pointBtn duplBtn" id="btnDupl" onclick="duplicate()">중복체크</a>
						</div>
					</div>
					
					<input type="password" name="mem_pwd" id="mem_pwd" class="essential" placeholder="비밀번호" />
					<span class="noti2">필수 입력입니다.</span>				
				
					<input type="password" name="mem_pwd_2" class="essential" placeholder="비밀번호 확인" />
					<span class="noti2">필수 입력입니다.</span>	
						
					<div class="info_div">
						<div class="align_div float_left">
							<input type="text" name="mem_name" class="essential" placeholder="이름" />
							<span class="noti2">필수 입력입니다.</span>
						</div>
						<div class="align_div float_right">
							<input type="hidden" name="gender" id="gender" value="" />
							<div class="gender_div"><span class="gender">남</span><span class="gender">여</span></div>
							<span class="noti2">필수 선택</span>
						</div>
					</div>				
										
					<input type="text" id="datepicker" name="birth" class="essential" placeholder="생일" autocomplete='off' />
					<span class="noti2">필수 입력입니다.</span>	
					
				</div>
				<button id="joinBtn" type="submit" class="pointBtn size0" onclick="return checkAll()">가입하기</button> 
			</form>			
			
		</div>
	</section>
	
</body>
</html>