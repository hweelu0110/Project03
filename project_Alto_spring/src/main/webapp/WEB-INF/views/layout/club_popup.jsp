<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<!-- 모임 가입 팝업 -->
	<div id="popupJoin" class="clubPopup">
		<button type="button" class="closeBtn">닫기</button>
		<h3>모임 가입</h3>
		<form name="clubJoinFrm" method="post" action="${path}/club/clubJoin.do?club_code=${club_code}">			
			<img src="${path}/memImgDown.do?imageFileName=${login.img}" />
			<p>${login.mem_name}님! 가입인사 글을 작성해 주세요.</p>			
			<input type="text" name="title" id="title" placeholder="제목을 입력하세요" />
			<input type="hidden" name="category" value="signup" />
			<textarea name="contents" id="contents" rows="20" cols="30" placeholder="가입인사를 작성하세요"></textarea>
			<button type="submit" id="joinBtn" class="pointBtn" onclick="return validateForm()">클럽 가입하기</button>
		</form>			
	</div>
	
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
			<input type="hidden" name="cate_s" id="cate_s" />
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
			<input type="text" class="size3 mainArea" name="mainArea" value="${clubInfo.area_name}" /><br/>
			<input type="hidden" class="area_code" name="area_code"  />
			<span class="icon_hobby">
				<img src="${path}/resources/img/hobby_img/${cate}.png" />
			</span>
			<label>상세 취미</label>			
			<input type="text" class="size3 clubHobby" name="clubHobby" value="${clubInfo.cate_s_name}" /><br/>
			<div class="club_img">
				모임 사진 등록하기
			</div>
			<img id="club_img" class="club_img" />
			<input type="file" class="size0" name="img" id="club_imgfile" onchange="readURL(this, 0)" />
			<textarea name="clubCont">${clubInfo.intro}</textarea><br/>
			<span class="icon_mem"></span><p>모임 최대 인원</p>
			<input type="text" class="size2" name="maxMam" value="${clubInfo.member_max}" /><br/>
			<input type="submit" class="pointBtn size0" value="수정하기" />
		</form>
	</div>
	
	<!-- 상세 취미 수정 팝업 -->
	<div id="step5" class="clubPopup">
		<button type="button" class="closeBtn">닫기</button>
		<h3>모임 취미 설정</h3>
		<div id="hobby_list">			
			<c:forEach var="subcode" items="${subhobbyList}" varStatus="status">	
				<c:if test="${status.index eq 0}">
					<p class="main_hobby">
						<input type="hidden" name="main_code" value="${subcode.MAIN_CODE}" />
						<img src="../resources/img/hobby_img/${subcode.MAIN_CODE}.png" />
						${subcode.MAIN_NAME}
					</p>
				</c:if>
				<c:if test="${subcode.SUB_CODE != hs010000 }"></c:if>
				<div class="sub_hobby ${subcode.MAIN_CODE}">
					<input type="hidden" value="${subcode.SUB_CODE}" />
					<p>${subcode.SUB_NAME}</p>	
				</div>	
			</c:forEach>
		</div>
	</div>
</body>
</html>