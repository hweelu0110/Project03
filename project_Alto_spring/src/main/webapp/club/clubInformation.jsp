<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@include file="../layout/headinfo.jsp" %>
	<link rel="stylesheet" href="../resources/css/clubInformation.css" /> 
</head>
<body>

	<%@include file="../layout/header.jsp" %>
	<%@include file="../layout/clubheader.jsp" %>
	
	<section>
		<div>
			<div class="left">
				<div class="clubcontent2">
					<img src="../resources/img/clubinformation_test.png">
					<span class="like_icon">관심</span>
				</div>
				
				<div class="clubcontent3">
					<span class="hobby_icon"><img src="../resources/img/hobby_img/h_002.png" /></span>
					<h3>모임제목</h3>	
					<img class="edit" src="../resources/img/edit.png"><br /><br/>
					<p>동해부터 제주도, 해외투어까지 다함께 즐길 수 있는 친목 모임입니다.</p>
				</div><br/>
				
				<div class="clubcontent4">
					<img class="calendar" src="../resources/img/calendar.png">
					<h3>모임일정</h3>
				</div>
				
				<section class="section">
					<div class="clubcontent5">
						<span>6/17</span>
					</div>
					<div class="clubcontent6">
						<span class="span1">다이빙 번개</span>&nbsp;
						<span class="span1">14명 참여중...</span><br/>
						<span class="span2">오후 7:30</span>&nbsp;
						<img class="gps" src="../resources/img/gps.png">스쿠버 다이빙
						<img class="edit" src="../resources/img/edit.png">
					</div>
				</section>
			
				<div class="member">
					<ul>
						<li><img src="../resources/img/user_test.png" /></li>
						<li><img src="../resources/img/user_test.png" /></li>
						<li><img src="../resources/img/user_test.png" /></li>
						<li><img src="../resources/img/user_test.png" /></li>
						<li><img class="plus" src="../resources/img/plus.png"/></li>
					</ul>
				</div>
				
				<input class="schedulebtn" type="button" value="일정 추가하기" onclick="location.href='Schedule.jsp'" /><br/>
				<input class="joinbtn" type="button" value="가입하기" onclick="location.href='clubJoin.jsp'" />
				
			</div>
			
			<div class="right">
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
		</div>
			
	</section>
	
	<%@include file="../layout/footer.jsp" %>
</body>
</html>