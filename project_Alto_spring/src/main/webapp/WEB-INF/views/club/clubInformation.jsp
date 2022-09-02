<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="club_code" value="${clubInfo.club_code}" />
<%
	request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${path}/resources/css/club/clubInformation.css" />		
	<script type="text/javascript">
	function fn_articleForm(login,articleForm,loginFrm) {
		if (login != '' && login != 'false') {
			location.href = articleForm
		}
		else {
			alert("로그인 후 가입이 가능합니다.")
			location.href=loginFrm+'?action=/club_board/articleForm.do';
		}
	}
	</script>
</head>
<body>
	<section>
		<div id="clubMenu">
			<ul>
				<li><a href="${path}/club/clubInformation.do?club_code=${club_code}">정보</a></li>
				<li><a href="${path}/club_board/listArticles.do?club_code=${club_code}">게시판</a></li>
				<li><a href="${path}/club_album/Albumlist.do?club_code=${club_code}">사진첩</a></li>
				<li><a href="${path}/club/clubChat.do?club_code=${club_code}">채팅</a></li>
			</ul>
		</div>	
			
		<div>
			<div class="left">
				<div class="clubcontent2">
					<img src="${path}/resources/img/clubinformation_test.png">
					<span class="like_icon">관심</span>
				</div>
				
				<div class="clubcontent3">
					<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${clubInfo.cate_m}.png" /></span>
					<h3>${clubInfo.title}</h3>	
					<img class="edit" src="${path}/resources/img/edit.png"><br /><br/>
					<p>${clubInfo.intro}</p>
				</div><br/>
				
				<div class="clubcontent4">
					<img class="calendar" src="${path}/resources/img/calendar.png">
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
						<img class="gps" src="${path}/resources/img/gps.png">스쿠버 다이빙
						<img class="edit" src="${path}/resources/img/edit.png">
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
				
				<input class="schedulebtn" type="button" value="일정 추가하기" onclick="location.href='${path}/club/Schedule.do'" /><br/>
				<a href="javascript:fn_articleForm('${login}', '${path}/club/clubJoin.do',
													'${path}/member/loginFrm.do')" ><input class="joinbtn" type="button" value="가입하기"/></a>
				
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
	
</body>
</html>