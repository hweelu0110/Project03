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
	<link rel="stylesheet" href="${path}/resources/css/mypage.css" />
</head>
<body>
	<section>
		<div id="myInfo">
			<div class="profile">
				<img src="${path}/resources/img/profile_default.png" />
				<a class="editBtn01" href="">편집</a>
				<h1>김이름</h1>
				<p>hweelu0110@gmail.com</p>
				<a class="editBtn02" href="">회원정보수정</a>
			</div>
			
			<div class="hobby">
				<h2>내 취미</h2>
				<a class="editBtn02" href="">편집</a>
				<ul>
					<li class="noCnt">
						<a href="${path}/mypage/memHobby.do">취미 설정하기</a>
					</li>
				</ul>
			</div>
			
			<div class="area">
				<h2>내 지역</h2>
				<a class="editBtn02" href="">편집</a>
				<ul>
					<li class="areaIcon">성동구</li>
					<li class="areaIcon">성동구</li>
					<li class="areaIcon">성동구</li>
				</ul>
			</div>
		</div>
		
		<div id="myMenu">
			<h3>관심사</h3>
			<ul>
				<li><a href="">내 취미활동</a></li>
				<li><a href="">관심목록</a></li>
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
			<div class="myClub">
				<h3>활동중인 모임</h3>
				<p>아직 모임 활동을 하지 않았습니다. 모임을 찾으러 가자! <a href="">모임검색하기</a></p>				
			</div>
			
			<div class="myClass">
				<h3>수강중인 클래스</h3>
				<p>아직 클래스 정보가 없습니다. 클래스를 찾아볼까요? <a href="">클래스검색하기</a></p>
			</div>
			
			<div class="myLike">
				<h3>관심 목록</h3>
			</div>
		</div>
	</section>
</body>
</html>