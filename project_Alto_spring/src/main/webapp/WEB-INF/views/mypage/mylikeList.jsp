<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="hobbyList" value="${mylikeMap.hobbyList}" />
<c:set var="areaList" value="${mylikeMap.areaList}" />
<c:set var="likeList" value="${mylikeMap.memlikeList}" />
<c:set var="clubList" value="${mylikeMap.clubList}" />
<c:set var="classList" value="${mylikeMap.classList}" />
<c:set var="itemList" value="${mylikeMap.itemList}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<link rel="stylesheet" href="${path}/resources/css/common/list.css" />	
	<link rel="stylesheet" href="${path}/resources/css/mypage.css" />	
	<script type="text/javascript">
		$(function() {
			$("#myMenu ul:eq(0)").find("li:eq(1)").addClass("select")			
			
			$("#tab_menu li").click(function() {
				$(this).addClass("select")
				$(this).siblings().removeClass("select")
			})
			
			$("#tab_menu li:eq(0)").click(function() {
				$("#likeClubList").css("display","block")
				$("#likeClassList").css("display","none")
				$("#likeItemList").css("display","none")
			})
			
			$("#tab_menu li:eq(1)").click(function() {
				$("#likeClubList").css("display","none")
				$("#likeClassList").css("display","block")
				$("#likeItemList").css("display","none")
			})
			
			$("#tab_menu li:eq(2)").click(function() {
				$("#likeClubList").css("display","none")
				$("#likeClassList").css("display","none")
				$("#likeItemList").css("display","block")
			})
		})
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
					<img src="${path}/memberImgDown.do?imageFileName=${login.img}" />				
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
				<li><a href="${path}/mypage/myActivList.do">내 취미활동</a></li>
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
			</ul>
		</div>		
		
		<div id="myPageCont">
			<ul id="tab_menu">
				<li class="select">모임</li>
				<li>클래스</li>
				<li>취미용품</li>
			</ul>
			
			<div id="likeClubList">
				<div class="normalList">
					<ul class="club">
						<c:if test="${not empty clubList}">
							
							<c:forEach var="club" items="${clubList}">
								<li>
									<c:choose>
										<c:when test="${club.img == 'noImg'}">
											<img class="club_img" src="${path}/resources/img/club_noImg.png">
										</c:when>
										<c:otherwise>
											<img class="club_img" src="${path}/club/clubImgDown.do?imageFileName=${club.img}" />
										</c:otherwise>
									</c:choose>
									<span class="area">${club.area_name}</span>
									<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${club.cate_m}.png" /></span>
									<p class="club_name">${club.title}</p>
									<span class="memNum">${club.member_num}명</span>
									<c:if test="${club.schedule ne null }">
										<p class="club_schedule">
											<span class="s_icon"></span><span><fmt:parseDate value="${club.schedule}" var="schedule" pattern="yyyy-MM-dd" /><fmt:formatDate value="${schedule}" pattern="yy/MM(E)" type="date" /></span>
											<span class="s_icon2"></span><span>${club.place}</span>
										</p>
									</c:if>
									<span class="like_icon select">관심</span>																	
									<input type="hidden" name="club_code" id="club_code" value="${club.club_code}" />
								</li>	
							</c:forEach>	
							
						</c:if>
						<c:if test="${empty clubList}">
							<li>관심 모임이 없습니다.</li>
						</c:if>										
					</ul>
				</div>			
			</div>
			
			<div id="likeClassList">
				<div class="normalList">
					<c:if test="${not empty classList}">
						<ul class="club">
							<c:forEach var="order" items="${classList}">
								<li>
									<a href="${path}/class/classDetail.do?class_code=${order.class_code}">
										<img class="club_img" src="${path}/download.do?imgName=${order.imgName}&class_code=${order.class_code}" />
									</a>
									<span class="area">${order.area_name}</span>
									<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${order.hobby_code}.png" /></span>
									<p class="club_name">${order.className}</p>
									<p class="hobby_name">${order.hobby_name}</p>
									<p class="class_price"><fmt:formatNumber value="${order.price}" pattern="#,###원" /></p>
									
									<c:forEach var="like" items="${likeList}">
										<c:if test="${like.class_code eq order.class_code}">
											<c:set var="in" value="true" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${in}">
											<span class="like_icon select">관심</span>
											<c:set var="in" value="false" />
										</c:when>
										<c:otherwise>
											<span class="like_icon">관심</span>
										</c:otherwise>
									</c:choose>
																		
									<input type="hidden" name="class_code" id="class_code" value="${order.class_code}" />
								</li>	
							</c:forEach>					
						</ul>
					</c:if>
					<c:if test="${empty classList}">
						<div class="noList">관심 클래스가 없습니다.</div>
					</c:if>	
				</div>			
			</div>
			
			<div id="likeItemList">
				<div class="normalList">
					<c:if test="${not empty itemList}">
						<ul class="club">
							<c:forEach var="order" items="${itemList}">
								<li>
									<a href="${path}/item/itemDetail.do?class_code=${order.item_code}">
										<img class="club_img" src="${path}/download.do?imgName=${order.imgName}&item_code=${order.item_code}" />
									</a>
									<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${order.hobby_code}.png" /></span>
									<p class="club_name">${order.item_name}</p>
									<p class="hobby_name">${order.hobby_name}</p>
									<p class="class_price"><fmt:formatNumber value="${order.price}" pattern="#,###원" /></p>
									
									<c:forEach var="like" items="${likeList}">
										<c:if test="${like.item_code eq order.item_code}">
											<c:set var="in" value="true" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${in}">
											<span class="like_icon select">관심</span>
											<c:set var="in" value="false" />
										</c:when>
										<c:otherwise>
											<span class="like_icon">관심</span>
										</c:otherwise>
									</c:choose>
																		
									<input type="hidden" name="item_code" id="item_code" value="${order.item_code}" />
								</li>	
							</c:forEach>					
						</ul>
					</c:if>
					<c:if test="${empty itemList}">
						<div class="noList">관심 취미용품이 없습니다.</div>
					</c:if>	
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