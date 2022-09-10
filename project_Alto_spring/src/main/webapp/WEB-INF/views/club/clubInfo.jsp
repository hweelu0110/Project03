<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="clubInfo" value="${clubInfoMap.clubInfo}" />
<c:set var="clubMember" value="${clubInfoMap.clubMemberList}" />
<c:set var="club_code" value="${clubInfoMap.clubInfo.club_code}" />
<c:set var="cate" value="${clubInfoMap.clubInfo.cate_m}" />
<c:set var="tit" value="${clubInfoMap.clubInfo.title}" />
<%
	request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${path}/resources/css/club/club.css" />
	<link rel="stylesheet" href="${path}/resources/css/club/clubInfo.css" />
	<script src="${path}/resources/js/club_open.js"></script>		
	<script type="text/javascript">
		function fn_articleForm(login) {
			if (login != '' && login != 'false') {
				confirmPopup($("#popupJoin"))
			}else {
				alert("로그인 후 가입이 가능합니다.")
				location.href='${path}/member/loginFrm.do';
			}
		}
		
		function validateForm() {
			if($("#title").val() == ""){
		        alert("제목을 입력하세요.");
		        $("#title").focus();
		        return false;
		      }
			if($("#contents").val() == ""){
		        alert("가입인사를 작성해주세요.");
		        $("#contents").focus();
		        return false;
		      }
		}
		
		$(function() {
			$("#editBtn").click(function() {
				confirmPopup($("#step4"))
			})
		})
	</script>
</head>
<body>
	<section>
		<div id="clubMenu">
			<ul>
				<li><a href="${path}/club/clubInfo.do?club_code=${club_code}">정보</a></li>
				<li><a href="${path}/club_board/listArticles.do?club_code=${club_code}&cate=${cate}&tit=${tit}">게시판</a></li>
				<li><a href="${path}/club_album/albumList.do?club_code=${club_code}&cate=${cate}&tit=${tit}">사진첩</a></li>
				<li><a href="${path}/club/clubChat.do?club_code=${club_code}&cate=${cate}&tit=${tit}">채팅</a></li>
			</ul>
		</div>		
			
		<div>
			<div class="left">
				<div id="clubTit">					
					<img src="${path}/resources/img/hobby_img/${cate}.png" />
					<h2>${tit}</h2>
					<c:if test="${login.mem_id eq clubInfo.manager}">
						<img id="editBtn" class="edit" src="${path}/resources/img/edit.png">
					</c:if>					
				</div>	
				
				<div class="clubImg">
					<img src="${path}/resources/img/clubinformation_test.png">
					<span class="like_icon">관심</span>
				</div>
				
				<div class="clubIntro">					
					<p>${clubInfo.intro}</p>
				</div>
								
				<h3 class="schTit">모임일정</h3>
				
				<div id="schedule">
					<div class="schDate">
						<span>6/17</span>
					</div>
					<div class="schInfo">
						<span class="span1">다이빙 번개</span>&nbsp;
						<span class="span1">14명 참여중...</span><br/>
						<span class="span2">오후 7:30</span>&nbsp;
						<img class="gps" src="${path}/resources/img/gps.png">스쿠버 다이빙
						<img class="edit" src="${path}/resources/img/edit.png">
					</div>
				</div>
			
				<div class="member">
					<ul>
						<li><img src="../resources/img/user_test.png" /></li>
						<li><img src="../resources/img/user_test.png" /></li>
						<li><img src="../resources/img/user_test.png" /></li>
						<li><img src="../resources/img/user_test.png" /></li>
						<li><img class="plus" src="../resources/img/plus.png"/></li>
					</ul>
				</div>
				
				<button type="button" class="basicBtn02" onclick="location.href='${path}/club/Schedule.do'">일정추가하기</button>
				<button type="button" class="pointBtn" onclick="fn_articleForm('${login}')" >가입하기</button>
				
			</div>
			
			<div class="right">
				<div id="schedual_member">
					<h3>일정 멤버 (14명)</h3>
					<ul>
						<c:forEach var="member" items="${clubMember}">
							<li>
								<img src="${path}/memImgDown.do?imageFileName=${member.img}" />
								<span class="memName">${member.name}</span>
								<c:if test="${manager eq 'Y'}">
									<span class="manager">모임장</span>
								</c:if>	
							</li>
						</c:forEach>						
					</ul>
				</div>		
			</div>
		</div>			
	</section>
	
	<!-- 모임 가입 팝업 -->
	<div id="popupJoin" class="clubPopup">
		<button type="button" class="closeBtn">닫기</button>
		<h3>모임 가입</h3>
		<form name="clubJoinFrm" method="post" action="${path}/club/clubJoin.do?club_code=${club_code}">
			<c:if test="${login.mem_id eq clubInfo.manager}">
				<input type="hidden" name="manager" value="Y" />
			</c:if>	
			<input type="hidden" name="manager" value="N" />
			
			<img src="${path}/memImgDown.do?imageFileName=${login.img}" />
			<p>${login.mem_name}님! 가입인사 글을 작성해 주세요.</p>			
			<input type="text" name="title" id="title" placeholder="제목을 입력하세요" />
			<input type="hidden" name="category" value="signup" />
			<textarea name="contents" id="contents" rows="20" cols="30" placeholder="가입인사를 작성하세요"></textarea>
			<button type="submit" id="joinBtn" class="pointBtn" onclick="return validateForm()">클럽 가입하기</button>
		</form>			
	</div>
	
	<!-- 모임 편집 팝업 -->
	<div id="step4" class="clubPopup">
		<button type="button" class="closeBtn">닫기</button>
		<h3>모임 수정</h3>
		<p class="club_since">모임 개설일 since 2022/06/10</p>
		<form action="" name="clubEditFrm" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
			<span class="icon_area"></span><label>주요지역</label>
			<input type="text" class="size3" name="mainArea" value="${clubInfo.area_name}" /><br/>
			<span class="icon_hobby">
				<img src="${path}/resources/img/hobby_img/${cate}.png" />
			</span>
			<label>상세 취미</label>			
			<input type="text" class="size3" name="clubHobby" value="${clubInfo.cate_s_name}" /><br/>
			<input type="button" class="size0 non_img" name="clubPhoto" value="모임 사진 등록하기" /><br/>
			<textarea name="clubCont">${clubInfo.intro}</textarea><br/>
			<span class="icon_mem"></span><p>모임 최대 인원</p>
			<input type="text" class="size2" name="maxMam" value="${clubInfo.member_max}" /><br/>
			<input type="submit" class="pointBtn size0" value="수정하기" />
		</form>
	</div>
	
</body>
</html>