<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<title>AlTo - 혼자, 다같이 Alone Together</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/common.css" />
	<link rel="stylesheet" href="css/layout.css" />	
	<link rel="stylesheet" href="css/club.css" />  	 
	<script type="text/javascript">
	</script>
</head> 
<body>
	<%@include file="header.jsp" %>
	
	<section>
		<!-- 채팅 접근 권한 알림 팝업 -->
		<div class="popup_div">
			<p>모임 채팅은<br/>모임 회원만 참여할 수 있습니다.</p>
			<button type="button" class="pointBtn">로그인</button>
			<button type="button" class="basicBtn">닫기</button>
		</div>
		
		<div id="clubChatWindow">
			<h2>일정 채팅</h2>
			
			<div id="chatView">
				<div class="noti date">2022년 6월 10일 금요일</div>
				<div class="reciveMsg">
					<img src="img/user_test.png" />
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
				<input type="text" id="" onkeyup="enterKey()" />
				<button id="sendBtn" onclick="sendMessage">전송</button>
			</div>
		</div>
		
		<div id="schedual_member">
			<h2>일정 멤버 (14명)</h2>
			<ul>
				<li>
					<img src="img/user_test.png" />
					<span class="memName">김이름</span>					
					<span class="manager">모임장</span>
				</li>
				<li>
					<img src="img/user_test.png" />
					<span class="memName">김이름</span>					
					<span class="manager"></span>
				</li>
			</ul>
		</div>		
		
	</section>
	
	<%@include file="footer.jsp" %>
</body>
</html>