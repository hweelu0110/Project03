<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="hobbyList" value="${mypageMap.hobbyList}" />
<c:set var="areaList" value="${mypageMap.areaList}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${path}/resources/css/mypage.css" />
	<script type="text/javascript">
		function fn_imgEditPopup() {
			confirmPopup($("#imgEdit_div"))
		}
		
		function readURL(input, index) {
			if (input.files && input.files[index]) {
				let reader = new FileReader()
				reader.onload = function(e) {
					$("#mem_img").attr("src",e.target.result)
				}
				reader.readAsDataURL(input.files[index])
			}
		}
		
		function fn_delURL() {
			$("#mem_img").attr("src","${path}/resources/img/profile_default.png")
			$("#mem_imgfile").val("")			
		}	
		
		$(function() {
			
			if($("#mem_imgfile").val() == "") {
				$("#mem_imgBtn").attr("disabled")
				$("#mem_imgBtn").removeClass("pointBtn")
				$("#mem_imgBtn").addClass("basicBtn")
			}else {
				$("#mem_imgBtn").removeAttr("disabled")
				$("#mem_imgBtn").addClass("pointBtn")
				$("#mem_imgBtn").removeClass("basicBtn")
			}			
			
			$("#imgEdit_div .closeBtn").click(function() {
				$("#mem_img").attr("src","${path}/resources/img/profile_default.png")
				$("#mem_imgfile").val("")
			})
		})
		
	</script>
</head>
<body>
	<section>
		<div id="myInfo">
			<div class="profile">				
				<input type="hidden" name="mem_id" id="mem_id" value="${login.mem_id}" />
				<c:choose>
					<c:when test="${login.img eq null || login.img eq '' }">
						<img src="${path}/resources/img/profile_default.png" />
					</c:when>
					<c:otherwise>
						<img src="${path}/mypage/memImgDown.do?imageFileName=${login.img}" />	
					</c:otherwise>
				</c:choose>			
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
				<li><a href="${path}/mypage/cartClass.do">장바구니</a></li>
				<li><a href="${path}/order/contractList.do">구매 내역</a></li>
			</ul>
			
			<h3>게시물</h3>
			<ul>
				<li><a href="">후기 관리</a></li>
				<li><a href="">문의 내역</a></li>
			</ul>
		</div>
		
		<div id="myPageCont">
			<div class="myClub">
				<h3>활동중인 모임</h3>
				<p class="noCnt">아직 모임 활동을 하지 않았습니다. 모임을 찾으러 가자! <br/><a href="${path}/club/clubSearchList.do">모임검색하기</a></p>				
			</div>
			
			<div class="myClass">
				<h3>수강중인 클래스</h3>
				<p class="noCnt">아직 클래스 정보가 없습니다. 클래스를 찾아볼까요? <br/><a href="${path}/club/classSearchList.do">클래스검색하기</a></p>
			</div>
			
			<div class="myLike">
				<h3>관심 목록</h3>
			</div>
		</div>		
	</section>
	
	<div id="imgEdit_div" class="popup_div profile">
		<h4>프로필 사진 변경</h4>
		<button class="closeBtn">닫기</button>
		<form action="${path}/mypage/updateImg.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="mem_id" id="mem_id" value="${login.mem_id}" />
			<c:if test="${login.img == null}">
				<img id="mem_img" src="${path}/resources/img/profile_default.png" />
			</c:if>
			<c:if test="${login.img != null}">
				<img id="mem_img" src="${path}/mypage/memImgDown.do?imageFileName=${login.img}" />				
			</c:if>
			<input type="file" name="file" id="mem_imgfile" onchange="readURL(this, 0)" />
			<button type="submit" class="pointBtn">적용</button>
			<button type="button" class="basicBtn" onclick="fn_delURL()">삭제</button>
		</form>
	</div>
</body>
</html>