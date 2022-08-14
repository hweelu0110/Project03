<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- HEADER -->
	<header>
		<div>
			<h1 id="logo"><a href="../main.do">AlTo Alone Together</a></h1>
			<nav>
				<ul id="main_menu">
					<li><a href="../club/clubMain.jsp">모임</a></li>
					<li><a href="${contextPath }/class/classMain.do">클래스</a></li>
					<li><a href="${contextPath }/item/itemMain.do">취미용품</a></li>
				</ul>
			</nav>
			<form action="allSearch.jsp" id="allSearch" name="allSearchForm" method="post">
				<input type="text" id="allSearch_keyword" name="keyword" value="취미용품을 검색해보세요!" />
				<input type="submit" id="search_btn" value="검색" />
			</form> 
			<ul id="sub_menu">
				<li class="no_mem"><a href="../member/loginFrm.jsp">로그인</a></li>
				<li class="mem"><a href="">로그아웃</a></li>
				<li class="no_mem"><a href="../member/joinFrm.jsp">회원가입</a></li>
				<li class="mem"><a href="../mypage/myMain.jsp">마이페이지</a></li>
				<li>FAQ</li>
			</ul>
		</div>		
	</header>