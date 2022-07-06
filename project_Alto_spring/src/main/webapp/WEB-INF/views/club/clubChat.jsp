<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<%@include file="../headinfo.jsp" %>		 
	<link rel="stylesheet" href="../resources/css/club.css" />
	<script type="text/javascript">		
	$(function() {
		/* 멤버리스트 마우스 오버효과 */
		$("#schedual_member ul li").mouseover(function() {
			$(this).css("background","#FFF")
		})
		$("#schedual_member ul li").mouseout(function() {
			$(this).css("background","none")
		})
	})			
	</script>
</head> 
<body>
	<%@include file="../header.jsp" %>
	
	<section>
		<!-- 채팅 접근 권한 알림 팝업 -->
		<div class="popup_div">
			<p>모임 채팅은<br/>모임 회원만 참여할 수 있습니다.</p>
			<button type="button" class="pointBtn">로그인</button>
			<button type="button" class="basicBtn closeBtn">닫기</button>
		</div>
		
		<div id="clubChat">
			<div id="clubChatWindow">
				<h2>일정 채팅</h2>
				
				<div id="chatView">
					<div class="noti date">2022년 6월 10일 금요일</div>
					<div class="reciveMsg">
						<img src="../resources/img/user_test.png" />
						<span class="msgUser">user22</span>
						<p>모임채팅방입니다~!</p>
						<p>반갑습니다.</p>
						<span class="msgTime">오후 10:00</span>
					</div>
					<div class="noti mem">user1님이 가입하셨습니다.</div>
					<div class="sendMsg">
						<p>반갑습니다.</p>
						<span class="msgTime">오후 10:00</span>
					</div>
				</div>
				<div>
					<input type="text" id="chatMessage" onkeyup="enterKey()" />
					<button id="sendBtn" class="basicBtn" onclick="sendMessage">전송</button>
				</div>
			</div>
			
			<div id="schedual_member">
				<h2>일정 멤버 (14명)</h2>
				<ul>
					<li>
						<img src="../resources/img/user_test.png" />
						<span class="memName">김이름</span>					
						<span class="manager">모임장</span>
					</li>
					<li>
						<img src="../resources/img/user_test.png" />
						<span class="memName">김이름</span>					
						<span class="manager"></span>
					</li>
				</ul>
			</div>		
		</div>
				
	</section>
	
	<%@include file="../footer.jsp" %>
</body>
</html>