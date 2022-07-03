<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<%@include file="../headinfo.jsp" %>
	<link rel="stylesheet" href="../css/list.css" /> 	
	<link rel="stylesheet" href="../css/club.css" /> 
	<link href="../css/class_main_style.css?after" rel="stylesheet" />
	<link href="../css/class_main_sl.css?after" rel="stylesheet" />
	
	<script type="text/javascript">
		$(function() {
			$("#tab_area").css("display","none")
			$("#m_cate").css("display","none")
			$("#s_cate").css("display","none")
			$("#area_list").css("display","none")
			
			/* tab메뉴 선택 시 - 영역 노출하기 */
			$("#tab_menu li").filter(":first").click(function() {
				$("#tab_area").toggle()
				$("#m_cate").toggle()
				
				if ($("#m_cate ul").find("li").hasClass('select')) {
					$("#s_cate").show()
				}else {
					$("#s_cate").hide()
				}				
			})
			
			$("#tab_menu li").filter(":last").click(function() {
				$("#tab_area").toggle()
				$("#area_list").toggle()
			})
			
			/* 메인카테고리 선택 시 - 서브카테고리 영역 노출 */
			$("#m_cate ul li").click(function() {
				$(this).toggleClass("select")
				$("#m_cate ul li.all").removeClass("select")
				
				if ($("#m_cate ul").find("li").hasClass('select')) {
					$("#s_cate").show()
					if(!($("#tab_menu").find("li").hasClass('select'))) {
						$("#tab_menu li").addClass("select")
					}
					$("#tab_menu li").removeClass("select")
				}else {
					$("#s_cate").hide()
					$("#m_cate ul li.all").addClass("select")
					$("#tab_menu li").removeClass("select")
				}
			})
			
		})
	</script>
</head>
<body>
	<%@include file="../header.jsp" %>
	
	<!-- CONTENTS -->
	<section>
		<ul id="tab_menu">
			<li class="select">창작</li>
			<li>성동구&nbsp;용산구&nbsp;중구</li>
		</ul>
		
		<div id="tab_area">
			<div id="m_cate">
				<ul>
					<li class="all"><a href="">전체</a></li>
					<li class="select">
						<img src="../img/hobby_img/h_001.png" />
						<p class="hobby_name">창작</p>
					</li>
			        <li>
						<img src="../img/hobby_img/h_002.png" />
						<p class="hobby_name">액티비티</p>
			        </li>
			        <li>
						<img src="../img/hobby_img/h_003.png" />
						<p class="hobby_name">아웃도어</p>
					</li>
			        <li>
						<img src="../img/hobby_img/h_004.png" />
						<p class="hobby_name">사진/영상</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_005.png" />
						<p class="hobby_name">음악</p>	
					</li>
					<li>
						<img src="../img/hobby_img/h_006.png" />
						<p class="hobby_name">게임</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_007.png" />
						<p class="hobby_name">여행</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_008.png" />
						<p class="hobby_name">요리</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_009.png" />
						<p class="hobby_name">문화</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_010.png" />
						<p class="hobby_name">봉사</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_011.png" />
						<p class="hobby_name">직무/커리어</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_012.png" />
						<p class="hobby_name">수집</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_013.png" />
						<p class="hobby_name">반려동물</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_014.png" />
						<p class="hobby_name">차/오토바이</p>
					</li>
					<li>
						<img src="../img/hobby_img/h_015.png" />
						<p class="hobby_name">자유주제</p>
					</li>
				</ul>
			</div>
			<div id="s_cate">
				<ul>
					<li class="select">전체</li>
					<li>드로잉</li>
					<li>공예</li>
					<li>DIY</li>
				</ul>
			</div>
			<div id="area_list" class="">
				<ul>
					<li class="online">온라인</li>
					<li>전체</li>
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
					<li class="select">성동구</li>
					<li>성북구</li>
					<li>송파구</li>
					<li>양천구</li>
					<li>영등포구</li>
					<li class="select">용산구</li>
					<li>은평구</li>
				</ul>
			</div>
			<button type="button" id="opSearch_btn">선택 조건으로 검색</button>
		</div>
		
		<div id="selectBoxArea">
			<select id="sl_Search">
				<option selected="selected">Best순</option>
				<option>회원수 많은 순</option>
				<option>회원수 적은 순</option>
				<option>최근 일정순</option>
				<option>신규순</option>
				<option>오래된 순</option>
			</select>
		</div>

		<div id="search_result">
			<h2>검색 결과</h2>
			<div class="class_products">
			    <div class="class_products_01">
				      <a href="#">
				        <img src="../img/class/1.jpg" class="classOb">
				        <p class="class_cate">요리</p>
				        <p class="class_title">건강한 수제 간식 만들기</p>
				        <p class="class_price">45,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">음악</p>
				        <p class="class_title">처음부터 배우는 기타 클래스</p>
				        <p class="class_price">89,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">사진</p>
				        <p class="class_title">인생 첫 DSRL 배우기</p>
				        <p class="class_price">69,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">액티비티</p>
				        <p class="class_title">하루 10분으로 변화하는 요가</p>
				        <p class="class_price">79,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">요리</p>
				        <p class="class_title">비건 도시락 만들기</p>
				        <p class="class_price">29,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg" class="classOb">
				        <p class="class_cate">요리</p>
				        <p class="class_title">건강한 수제 간식 만들기</p>
				        <p class="class_price">45,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">음악</p>
				        <p class="class_title">처음부터 배우는 기타 클래스</p>
				        <p class="class_price">89,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">사진</p>
				        <p class="class_title">인생 첫 DSRL 배우기</p>
				        <p class="class_price">69,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">액티비티</p>
				        <p class="class_title">하루 10분으로 변화하는 요가</p>
				        <p class="class_price">79,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">요리</p>
				        <p class="class_title">비건 도시락 만들기</p>
				        <p class="class_price">29,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg" class="classOb">
				        <p class="class_cate">요리</p>
				        <p class="class_title">건강한 수제 간식 만들기</p>
				        <p class="class_price">45,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">음악</p>
				        <p class="class_title">처음부터 배우는 기타 클래스</p>
				        <p class="class_price">89,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">사진</p>
				        <p class="class_title">인생 첫 DSRL 배우기</p>
				        <p class="class_price">69,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">액티비티</p>
				        <p class="class_title">하루 10분으로 변화하는 요가</p>
				        <p class="class_price">79,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">요리</p>
				        <p class="class_title">비건 도시락 만들기</p>
				        <p class="class_price">29,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg" class="classOb">
				        <p class="class_cate">요리</p>
				        <p class="class_title">건강한 수제 간식 만들기</p>
				        <p class="class_price">45,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">음악</p>
				        <p class="class_title">처음부터 배우는 기타 클래스</p>
				        <p class="class_price">89,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">사진</p>
				        <p class="class_title">인생 첫 DSRL 배우기</p>
				        <p class="class_price">69,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">액티비티</p>
				        <p class="class_title">하루 10분으로 변화하는 요가</p>
				        <p class="class_price">79,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">요리</p>
				        <p class="class_title">비건 도시락 만들기</p>
				        <p class="class_price">29,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg" class="classOb">
				        <p class="class_cate">요리</p>
				        <p class="class_title">건강한 수제 간식 만들기</p>
				        <p class="class_price">45,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">음악</p>
				        <p class="class_title">처음부터 배우는 기타 클래스</p>
				        <p class="class_price">89,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">사진</p>
				        <p class="class_title">인생 첫 DSRL 배우기</p>
				        <p class="class_price">69,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">액티비티</p>
				        <p class="class_title">하루 10분으로 변화하는 요가</p>
				        <p class="class_price">79,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">요리</p>
				        <p class="class_title">비건 도시락 만들기</p>
				        <p class="class_price">29,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg" class="classOb">
				        <p class="class_cate">요리</p>
				        <p class="class_title">건강한 수제 간식 만들기</p>
				        <p class="class_price">45,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">음악</p>
				        <p class="class_title">처음부터 배우는 기타 클래스</p>
				        <p class="class_price">89,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">사진</p>
				        <p class="class_title">인생 첫 DSRL 배우기</p>
				        <p class="class_price">69,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">액티비티</p>
				        <p class="class_title">하루 10분으로 변화하는 요가</p>
				        <p class="class_price">79,000원</p>
				      </a>
				      <a href="#">
				        <img src="../img/class/1.jpg">
				        <p class="class_cate">요리</p>
				        <p class="class_title">비건 도시락 만들기</p>
				        <p class="class_price">29,000원</p>
				      </a>
			      </div>
	    	  </div>
		</div>		
	</section>
	
	<%@include file="../footer.jsp" %>
</body>
</html>