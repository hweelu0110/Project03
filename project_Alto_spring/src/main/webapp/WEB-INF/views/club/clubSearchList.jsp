<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="allHobbyList" value="${clubSearchMap.allHobbyList}" />
<c:set var="allAreaList" value="${clubSearchMap.allAreaList}" />
<c:set var="hobClubList" value="${clubSearchMap.hobClubList}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">		
	<link rel="stylesheet" href="${path}/resources/css/club/club.css" /> 
	<link rel="stylesheet" href="${path}/resources/css/common/list.css" /> 
	<script src="${path}/resources/js/search_tabmenu.js"></script>
	<script src="${path}/resources/js/club_open.js"></script>
	<script type="text/javascript">	
		$(function() {			
			/* 모임 메인에서 카테고리 선택 진입 시 */
			let text = $("#tab_menu li:nth-child(1) span").text().trim()
			$("#tab_menu li:nth-child(1) span").text(text)
						
			let _hobbyC = '${hobbyC}'
			if (_hobbyC != "" || _hobbyC != null) {
				$.ajax({
					url: "http://localhost:8080/alto/hobby/selectSubHobby.do",
					type:"post",
					dataType:"json",
					data: {hobbyC: _hobbyC},
					success: function(data, textStatus) {
						if(data.hobbySubList.length > 0) {
							$.each(data.hobbySubList, function(index, item) {										
								$("#s_cate ul").append("<li class="+
										item.MAIN_CODE+
										">"+item.SUB_NAME+"</li>")
							})
						}
					},
					error: function(data, textStatus) {
						alert("오류가 발생하였습니다. 다시 시도해주세요.")
					}
				})
			}			
			
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
					<li id="m_cate_all" class="all">전체</li>
					<c:forEach var="hobby" items="${allHobbyList}">						
						<c:if test="${hobby.hobby_code eq hobbyC}">
							<c:set var="in" value="true" />
						</c:if>
						<c:choose>
							<c:when test="${in}">
								<li class="select">
									<img src="${path}/resources/img/hobby_img/${hobby.hobby_code}.png" />
									<p class="hobby_name">${hobby.name}</p>
								</li>
								<c:set var="in" value="false" />
							</c:when>
							<c:otherwise>
								<li>
									<img src="${path}/resources/img/hobby_img/${hobby.hobby_code}.png" />
									<p class="hobby_name">${hobby.name}</p>
								</li>
							</c:otherwise>
						</c:choose>												
					</c:forEach>					
				</ul>
			</div>
			<div id="s_cate">
				<ul>
					<li class="all select">전체</li>					
				</ul>
			</div>
			<div id="area_list">
				<ul>
					<li class="all">전체</li>
					<c:forEach var="area" items="${allAreaList}">						
						<c:choose>
							<c:when test="${area.name == '온라인'}">
								<li class="online">${area.name}</li>
							</c:when>	
							<c:otherwise>
								<li>${area.name}</li>
							</c:otherwise>	
						</c:choose>											
					</c:forEach>
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
			<div class="normalList">
				<c:if test="${empty hobClubList}">
					<h3 class="noList">검색 조건과 일치하는 모임이 없습니다.</h3>				
				</c:if>
				<ul class="club">
					<c:forEach var="club" items="${hobClubList}">
						<li>
							<a href="${path}/club/clubInformation.do?club_code=${club.club_code}">
								<img class="club_img" src="${path}/resources/img/club_test.png" />
							</a>
							<span class="area">${club.area_name}</span>
							<span class="hobby_icon"><img src="${path}/resources/img/hobby_img/${club.cate_m}.png" /></span>
							<p class="club_name">${club.title}</p>
							<span class="memNum">${club.member_num}명</span>
							<p class="club_schedule">
								<span class="s_icon"></span><span>6/11(토)</span>
								<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
							</p>
							<span class="like_icon">관심</span>
						</li>
					</c:forEach>
					
				</ul>
			</div>
			
		</div>
		<c:if test="${not empty login}">
			<div class="info_div">
				<p>원하는 모임을 찾지 못하셨나요?</p>
				<span class="p_color">그럼 직접 만들어보세요!</span>
			</div>
			<div id="open_btn"></div>	
		</c:if>			
	</section>
		
	<!-- 모임 개설 팝업 -->
	<div id="step1" class="clubPopup">
		<h3>주제 선택</h3>
		<button type="button" class="closeBtn">닫기</button>
		<form name="clubHobbyFrm">
			<div id="cateChoice">
				<ul>
					<c:forEach var="hobby" items="${allHobbyList}">
						<li>
							<img src="${path}/resources/img/hobby_img/${hobby.hobby_code}.png" />
							<p class="hobby_name">${hobby.name}</p>
							<input type="hidden" value="${hobby.hobby_code}" />
						</li>				
					</c:forEach>
				</ul>
			</div>
		</form>		
	</div>
	
	<div id="step2" class="clubPopup">
		<button type="button" class="prevBtn">이전</button>
		<button type="button" class="closeBtn">닫기</button>
		<h3>모임 개설</h3>
		<form action="${path}/club/clubRegister.do" name="clubOpenFrm" method="post" onsubmit="return validateForm(this)">
			<span class="icon_area"></span>
			<input type="text" class="size1" name="mainArea" id="mainArea" placeholder="주요활동 지역 찾기" autocomplete='off' /><br/>
			<input type="hidden" name="area_code" id="area_code" />
			<span class="icon_hobby"></span>
			<input type="hidden" name="cate_m" id="cate_m" />
			<input type="text" class="size1" name="title" value="" placeholder="모임 이름" autocomplete='off' /><br/>
			<textarea name="intro" id="intro" placeholder="모임 소개 또는 목표" autocomplete='off'></textarea><br/>
			<span class="icon_mem"></span><p>모임 최대 인원</p>
			<input type="text" class="size2" name="member_max" value="200" autocomplete='off' /><br/>
			<input type="submit" class="pointBtn size0" value="모임 만들기" />
		</form>
	</div>
	
	<!-- 지역 검색 팝업 -->
	<div id="step3" class="clubPopup">
		<button type="button" class="prevBtn">이전</button>
		<button type="button" class="closeBtn">닫기</button>
		<h3>주요활동 지역 선택</h3>
		<div id="areaList">
			<form name="clubAreaFrm">
				<ul>
					<c:forEach var="area" items="${allAreaList}">
						<c:choose>
							<c:when test="${area.name eq '온라인'}">
								<li class="online">
									${area.name}
									<input type="hidden" value="${area.area_code}" />
								</li>
							</c:when>
							<c:otherwise>
								<li>
									${area.name}
									<input type="hidden" value="${area.area_code}" />
								</li>
							</c:otherwise>					
						</c:choose>					
					</c:forEach>
				</ul>
			</form>	
		</div>
	</div>
	
	<!-- 모임 편집 팝업 -->
	<div id="step4" class="clubPopup">
		<button type="button" class="closeBtn">닫기</button>
		<h3>모임 수정</h3>
		<p class="club_since">모임 개설일 since 2022/06/10</p>
		<form action="" name="clubEditFrm" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
			<span class="icon_area"></span><label>주요지역</label>
			<input type="text" class="size3" name="mainArea" value="성동구" /><br/>
			<span class="icon_hobby"></span><label>상세 취미</label>
			<input type="text" class="size3" name="clubHobby" value="공예" /><br/>
			<input type="button" class="size0 non_img" name="clubPhoto" value="모임 사진 등록하기" /><br/>
			<textarea name="clubCont">클럽 소개글</textarea><br/>
			<span class="icon_mem"></span><p>모임 최대 인원</p>
			<input type="text" class="size2" name="maxMam" value="200" /><br/>
			<input type="submit" class="pointBtn size0" value="수정하기" />
		</form>
	</div>
</body>
</html>