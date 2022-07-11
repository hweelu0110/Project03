<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<%@include file="../layout/headinfo.jsp" %>
	<link rel="stylesheet" href="../resources/css/list.css" /> 	
	<link rel="stylesheet" href="../resources/css/club.css" /> 
	<script src="../resources/js/search_tabmenu.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".clubPopup").hide()
			
			/* 클럽개설 버튼 팝업 */
			$("#open_btn").mouseover(function() {
				$("div.info_div").show()
			})
			$("#open_btn").mouseout(function() {
				$("div.info_div").hide()
			})	
			
			/* 클럽개설 1단계 popup */
			$("#open_btn").click(function() {
				confirmPopup($("#step1"))
				//confirmPopup($("#login_popup"), "모임 개설은 로그인이 필요합니다.")
			})
			
			/* 클럽개설 2단계 popup */
			$("#step1 ul li").click(function() {
				let hobbyImg = $(this).children('img').attr('src')
				$("#step2 .icon_hobby").css({
					"background-image":"url("+hobbyImg+")"
				})
				$("#step1").hide()
				confirmPopup($("#step2"))
			})
			
			/* 지역 검색 팝업 */
			$("#step2 form input:nth-child(1)").click(function() {
				$("#step3").show()
			})
		})
	</script>
</head>
<body>
	<%@include file="../layout/header.jsp" %>
	
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
						<img src="../resources/img/hobby_img/h_001.png" />
						<p class="hobby_name">창작</p>
					</li>
			        <li>
						<img src="../resources/img/hobby_img/h_002.png" />
						<p class="hobby_name">액티비티</p>
			        </li>
			        <li>
						<img src="../resources/img/hobby_img/h_003.png" />
						<p class="hobby_name">아웃도어</p>
					</li>
			        <li>
						<img src="../resources/img/hobby_img/h_004.png" />
						<p class="hobby_name">사진/영상</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/h_005.png" />
						<p class="hobby_name">음악</p>	
					</li>
					<li>
						<img src="../resources/img/hobby_img/h_006.png" />
						<p class="hobby_name">게임</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/h_007.png" />
						<p class="hobby_name">여행</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/h_008.png" />
						<p class="hobby_name">요리</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/h_009.png" />
						<p class="hobby_name">문화</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/h_010.png" />
						<p class="hobby_name">봉사</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/h_011.png" />
						<p class="hobby_name">직무/커리어</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/h_012.png" />
						<p class="hobby_name">수집</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/h_013.png" />
						<p class="hobby_name">반려동물</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/h_014.png" />
						<p class="hobby_name">차/오토바이</p>
					</li>
					<li>
						<img src="../resources/img/hobby_img/h_015.png" />
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
						<img class="club_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon"></span><span>6/11(토)</span>
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="club_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon"></span><span>6/11(토)</span>
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="club_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon"></span><span>6/11(토)</span>
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="club_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon"></span><span>6/11(토)</span>
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="club_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon"></span><span>6/11(토)</span>
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="club_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon"></span><span>6/11(토)</span>
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="club_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon"></span><span>6/11(토)</span>
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="club_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/h_001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon"></span><span>6/11(토)</span>
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
				</ul>
			</div>
			
		</div>
		
		<div class="info_div">
			<p>원하는 모임을 찾지 못하셨나요?</p>
			<span class="p_color">그럼 직접 만들어보세요!</span>
		</div>
		<div id="open_btn"></div>		
	</section>
		
	<!-- 모임 개설 팝업 -->
	<div id="step1" class="clubPopup">
		<h3>주제 선택</h3>
		<button type="button" class="closeBtn">닫기</button>
		<div id="cateChoice">
			<ul>
				<li>
					<img src="../resources/img/hobby_img/h_001.png" />
					<p class="hobby_name">창작</p>
				</li>
		        <li>
					<img src="../resources/img/hobby_img/h_002.png" />
					<p class="hobby_name">액티비티</p>
		        </li>
		        <li>
					<img src="../resources/img/hobby_img/h_003.png" />
					<p class="hobby_name">아웃도어</p>
				</li>
		        <li>
					<img src="../resources/img/hobby_img/h_004.png" />
					<p class="hobby_name">사진/영상</p>
				</li>
				<li>
					<img src="../resources/img/hobby_img/h_005.png" />
					<p class="hobby_name">음악</p>	
				</li>
				<li>
					<img src="../resources/img/hobby_img/h_006.png" />
					<p class="hobby_name">게임</p>
				</li>
				<li>
					<img src="../resources/img/hobby_img/h_007.png" />
					<p class="hobby_name">여행</p>
				</li>
				<li>
					<img src="../resources/img/hobby_img/h_008.png" />
					<p class="hobby_name">요리</p>
				</li>
				<li>
					<img src="../resources/img/hobby_img/h_009.png" />
					<p class="hobby_name">문화</p>
				</li>
				<li>
					<img src="../resources/img/hobby_img/h_010.png" />
					<p class="hobby_name">봉사</p>
				</li>
				<li>
					<img src="../resources/img/hobby_img/h_011.png" />
					<p class="hobby_name">직무/커리어</p>
				</li>
				<li>
					<img src="../resources/img/hobby_img/h_012.png" />
					<p class="hobby_name">수집</p>
				</li>
				<li>
					<img src="../resources/img/hobby_img/h_013.png" />
					<p class="hobby_name">반려동물</p>
				</li>
				<li>
					<img src="../resources/img/hobby_img/h_014.png" />
					<p class="hobby_name">차/오토바이</p>
				</li>
				<li>
					<img src="../resources/img/hobby_img/h_015.png" />
					<p class="hobby_name">자유주제</p>
				</li>
			</ul>
		</div>
	</div>
	
	<div id="step2" class="clubPopup">
		<button type="button" class="prevBtn">이전</button>
		<button type="button" class="closeBtn">닫기</button>
		<h3>모임 개설</h3>
		<form action="" name="clubOpenFrm" method="post" onsubmit="return validateForm(this)">
			<span class="icon_area"></span>
			<input type="text" class="size1" name="mainArea" value="" placeholder="주요활동 지역 찾기" /><br/>
			<span class="icon_hobby"></span>
			<input type="text" class="size1" name="clubName" value="" placeholder="모임 이름" /><br/>
			<textarea name="clubCont" placeholder="모임 소개 또는 목표"></textarea><br/>
			<span class="icon_mem"></span><p>모임 최대 인원</p>
			<input type="text" class="size2" name="maxMam" value="200" /><br/>
			<input type="submit" class="pointBtn size0" value="모임 만들기" />
		</form>
	</div>
	
	<!-- 지역 검색 팝업 -->
	<div id="step3" class="clubPopup">
		<button type="button" class="prevBtn">이전</button>
		<button type="button" class="closeBtn">닫기</button>
		<form action="" name="clubOpenFrm" method="post" onsubmit="return validateForm(this)">
			<input type="text" class="size1" name="mainArea" value="주요활동 지역 찾기" /><br/>				
		</form>
		<div id="resultList">
			
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
	<%@include file="../layout/common_popup.jsp" %>
	<%@include file="../layout/footer.jsp" %>
</body>
</html>