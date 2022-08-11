<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="hobbyList" value="${mylikeMap.hobbyList}" />
<c:set var="areaList" value="${mylikeMap.areaList}" />
<c:set var="likeList" value="${mylikeMap.memlikeList}" />
<c:set var="clubList" value="${mylikeMap.clubList}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<link rel="stylesheet" href="${path}/resources/css/common/list.css" />	
	<link rel="stylesheet" href="${path}/resources/css/mypage.css" />	
	<script type="text/javascript">
		
	</script>
</head>
<body>
	<!-- CONTENTS -->
	<section>
		<div id="myInfo">
			<div class="profile">				
				<input type="hidden" name="mem_id" id="mem_id" value="${login.mem_id}" />
				<c:if test="${login.img == null}">
					<img src="${path}/resources/img/profile_default.png" />
				</c:if>
				<c:if test="${login.img != null}">
					<img src="${path}/memImgDown.do?imageFileName=${login.img}" />				
				</c:if>				
				<a class="editBtn01" onclick="fn_imgEditPopup()">편집</a>
				<h1>${login.mem_name}</h1>
				<p>${login.mem_id}</p>
				<a class="editBtn02" href="${path}/mypage/infoEditFrm.do">회원정보수정</a>
			</div>
			
			<div class="hobby">
				<h2>내 취미</h2>
				<c:if test="${not empty hobbyList}">
					<a class="editBtn02" href="${path}/mypage/memHobby.do">편집</a>
					<ul>
						<c:forEach var="hobby" items="${hobbyList}">
							<li>
								<img src="${path}/resources/img/hobby_img/${hobby.hobby_code}.png" />
							</li>						
						</c:forEach>						
					</ul>
				</c:if>
				<c:if test="${empty hobbyList}">
					<ul>
						<li class="noCnt">
							<a href="${path}/mypage/memHobby.do">취미 설정하기</a>
						</li>
					</ul>
				</c:if>				
			</div>
			
			<div class="area">
				<h2>내 지역</h2>
				<c:if test="${not empty areaList}">
					<a class="editBtn02" href="${path}/mypage/memArea.do">편집</a>
					<ul>
						<c:forEach var="area" items="${areaList}">
							<li class="areaIcon">${area.name}</li>
						</c:forEach>						
					</ul>
				</c:if>
				<c:if test="${empty areaList}">
					<ul>
						<li class="noCnt">
							<a href="${path}/mypage/memArea.do">지역 설정하기</a>
						</li>
					</ul>
				</c:if>
			</div>
		</div>
		
		<div id="myMenu">
			<h3>관심사</h3>
			<ul>
				<li><a href="">내 취미활동</a></li>
				<li><a href="${path}/mypage/mylikeList.do">관심목록</a></li>
			</ul>
			
			<h3>구매활동</h3>
			<ul>
				<li><a href="">장바구니</a></li>
				<li><a href="">구매 내역</a></li>
			</ul>
			
			<h3>게시물</h3>
			<ul>
				<li><a href="">후기 관리</a></li>
				<li><a href="">문의 내역</a></li>
			</ul>
		</div>		
		
		<div id="myPageCont">
			<ul id="tab_menu">
				<li class="select">모임</li>
				<li>클래스</li>
				<li>취미용품</li>
			</ul>
			
			<div>
				<div class="normalList">
					<ul class="club">
						<c:if test="${not empty clubList}">
							
							<c:forEach var="club" items="${clubList}">
								<li>
									<img class="club_img" src="${path}/resources/img/club_test.png" />
									<span class="area">${club.area_name}</span>
									<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${club.cate_m}.png" /></span>
									<p class="club_name">${club.title}</p>
									<span class="memNum">${club.member_num}명</span>
									<p class="club_schedule">
										<span class="s_icon"></span><span>6/11(토)</span>
										<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
									</p>
									<span class="like_icon select">관심</span>
								</li>	
							</c:forEach>	
							
						</c:if>
						<c:if test="${empty clubList}">
							<li>관심 모임이 없습니다.</li>
						</c:if>										
					</ul>
				</div>
			
		</div>
			
		</div>
		
		
		<div id="imgEdit_div" class="popup_div profile">
			<h4>프로필 사진 변경</h4>
			<button class="closeBtn">닫기</button>
			<form action="${path}/mypage/updateImg.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="mem_id" id="mem_id" value="${login.mem_id}" />
				<c:if test="${login.img == null}">
					<img id="mem_img" src="${path}/resources/img/profile_default.png" />
				</c:if>
				<c:if test="${login.img != null}">
					<img id="mem_img" src="${path}/memImgDown.do?imageFileName=${login.img}" />				
				</c:if>
				<input type="file" name="file" id="mem_imgfile" onchange="readURL(this, 0)" />
				<button type="submit" class="pointBtn">적용</button>
				<button type="button" class="basicBtn" onclick="fn_delURL()">삭제</button>
			</form>
		</div>		
	</section>
</body>
</html>