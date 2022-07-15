<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<link rel="stylesheet" href="../resources/css/list.css" /> 	
	<link rel="stylesheet" href="../resources/css/club.css" /> 
	<link href="../resources/css/class_main_sl.css?after_new" rel="stylesheet" />
	<script src="../resources/js/search_tabmenu.js"></script>
	<script type="text/javascript">
		$(function() {
			/* 클럽개설 버튼 팝업 */
			$("#open_btn").mouseover(function() {
				$("div.info_div").show()
			})
			$("#open_btn").mouseout(function() {
				$("div.info_div").hide()
			})
			$("#open_btn").click(function() {
				location.href = '${contextPath}/class/classform.do'
			})
		})
	</script>
</head>
<body>
	
	<!-- CONTENTS -->
	<section>
		<ul id="tab_menu">
			<li><span>전체 취미</span></li>
			<li><span>전체 지역</span></li>
		</ul>
		
		<div id="tab_area">
			<div id="m_cate">
				<ul>
					<li id="m_cate_all" class="all select">전체</li>
					<li>
						<img src="../resources/img/hobby_img/hm000001.png" />
						<p class="hobby_name">창작</p>
					</li>
			        <li>
						<img src="../resources/img/hobby_img/hm000002.png" />
						<p class="hobby_name">액티비티</p>
			        </li>
			        <li>
						<img src="../resources/img/hobby_img/hm000003.png" />
						<p class="hobby_name">아웃도어</p>
					</li>
			        <li>
						<img src="../resources/img/hobby_img/hm000004.png" />
						<p class="hobby_name">사진/영상</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/hm000005.png" />
						<p class="hobby_name">음악</p>	
					</li>
					<li>
						<img src="../resources/img/hobby_img/hm000006.png" />
						<p class="hobby_name">게임</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/hm000007.png" />
						<p class="hobby_name">여행</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/hm000008.png" />
						<p class="hobby_name">요리</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/hm000009.png" />
						<p class="hobby_name">문화</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/hm000010.png" />
						<p class="hobby_name">봉사</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/hm000011.png" />
						<p class="hobby_name">직무/커리어</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/hm000012.png" />
						<p class="hobby_name">수집</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/hm000013.png" />
						<p class="hobby_name">반려동물</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/hm000014.png" />
						<p class="hobby_name">차/오토바이</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/hm000015.png" />
						<p class="hobby_name">자유주제</p>
					</li>
				</ul>
			</div>
			<div id="s_cate">
				<ul>
					<li class="all select">전체</li>
				</ul>
			</div>
			<div id="area_list">
				<ul>
					<li class="online">온라인</li>
					<li class="all select">전체</li>
					<li>강남구</li>
					<li>강동구</li>
					<li>강북구</li>
					<li>강서구</li>
					<li>관악구</li>
					<li>광진구</li>
					<li>구로구</li>
					<li>금천구</li>
					<li>노원구</li>
					<li>도봉구</li>
					<li>동대문구</li>
					<li>동작구</li>
					<li>마포구</li>
					<li>서대문구</li>
					<li>서초구</li>
					<li>성동구</li>
					<li>성북구</li>
					<li>송파구</li>
					<li>양천구</li>
					<li>영등포구</li>
					<li>용산구</li>
					<li>은평구</li>
					<li>종로구</li>
					<li>중구</li>
					<li>중랑구</li>
				</ul>
			</div>
			<button type="button" id="opSearch_btn">선택 조건으로 검색</button>
		</div>
		
		<div id="selectBoxArea">
			<div class="selectBox">Best순</div>
			<div class="selectBox select_list">
				<ul>
					<li>회원수 많은</li>
					<li>회원수 적은</li>
					<li>최근 일정</li>
					<li>신규</li>
					<li>오래된</li>
				</ul>
			</div>
		</div>
		
		
		<div id="search_result">
			<h2>검색 결과</h2>
			<div class="searchList">
				<ul class="club">
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
				</ul>
			</div>
			
		</div>
		
		<div class="info_div">
			<p>원하는 클래스를 찾지 못하셨나요?</p>
			<span class="p_color">그럼 직접 만들어보세요!</span>
		</div>
		<div id="open_btn"></div>		
	</section>
		
	<%@include file="../layout/common_popup.jsp" %>
</body>
</html>