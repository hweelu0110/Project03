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

<c:set var="classAddList" value="${addList.classList}" />
<c:set var="itemAddList" value="${addList.itemList}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<link rel="stylesheet" href="${path}/resources/css/common/list.css" />	
	<link rel="stylesheet" href="${path}/resources/css/mypage.css" />	
	<script type="text/javascript">
		$(function() {
			$("#myMenu ul:eq(0)").find("li:eq(2)").addClass("select")
			
			$("#tab_menu li").click(function() {
				$(this).addClass("select")
				$(this).siblings().removeClass("select")
			})
			
			$("#tab_menu li:eq(0)").click(function() {
				$("#classList").css("display","block")
				$("#itemList").css("display","none")
			})
			
			$("#tab_menu li:eq(1)").click(function() {
				$("#classList").css("display","none")
				$("#itemList").css("display","block")
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
				<li><a href="${path}/mypage/myAddItem.do">내 등록상품</a></li>
			</ul>
			
			<h3>구매활동</h3>
			<ul>
				<li><a href="${path}/mypage/cartClass.do">장바구니</a></li>
				<li><a href="${path}/order/contractList.do">구매 내역</a></li>
			</ul>
			
			<h3>게시물</h3>
			<ul>
				<li><a href="">후기 관리</a></li>
			</ul>
		</div>		
		
		<div id="myPageCont">
			<ul id="tab_menu">
				<li>클래스</li>
				<li class="select">취미용품</li>
			</ul>
			
			<div id="classList">
				<div class="normalList">
					<c:if test="${not empty classAddList}">
						<ul class="club">
							<c:forEach var="addClass" items="${classAddList}">
								<li>
									<a href="${path}/class/classDetail.do?class_code=${addClass.class_code}">
										<img class="club_img" src="${path}/download.do?imgName=${addClass.imgName}&class_code=${addClass.class_code}" />
									</a>
									<span class="area">${addClass.area_name}</span>
									<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${addClass.hobby_code}.png" /></span>
									<p class="club_name">${addClass.className}</p>
									<p class="hobby_name">${addClass.hobby_name}</p>
									<div align="center">
									<a href="${path}/class/editClass.do?class_code=${addClass.class_code}"><input type="button" class="warning" style="background-color: gold;" value="정보 수정"></a>
									</div>
								</li>	
							</c:forEach>					
						</ul>
					</c:if>
					<c:if test="${empty classAddList}">
						<div class="noList">개설한 클래스가 없습니다.</div>
					</c:if>	
				</div>			
			</div>
			
			<div id="itemList">
				<div class="normalList">
					<c:if test="${not empty itemAddList}">
						<ul class="club">
							<c:forEach var="addItem" items="${itemAddList}">
								<li>
									<a href="${path}/class/classDetail.do?class_code=${addItem.item_code}">
										<img class="club_img" src="${path}/download.do?imgName=${addItem.imgName}&item_code=${addItem.item_code}" />
									</a>
									<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${addItem.hobby_code}.png" /></span>
									<p class="club_name">${addItem.item_name}</p>
									<p class="hobby_name">${addItem.hobby_name}</p>
									<div align="center">
									<a href="${path}/item/editItem.do?item_code=${addItem.item_code}"><input type="button" class="warning" style="background-color: gold;" value="정보 수정"></a>
									</div>
								</li>	
							</c:forEach>					
						</ul>
					</c:if>
					<c:if test="${empty itemAddList}">
						<div class="noList">개설한 클래스가 없습니다.</div>
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