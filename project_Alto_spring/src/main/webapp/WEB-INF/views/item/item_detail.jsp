<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 	isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="itemDTO"  value="${itemMap.itemDTO}"  />
<c:set var="imageList"  value="${itemMap.imageFileList }"  />
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat today = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<html>
<head>
	<link href="${contextPath}/resources/css/class/class_main_style.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath }/resources/css/class/slide.css" />
	<link rel="stylesheet" href="${contextPath }/resources/css/class/class_detail.css" /> 
	<link rel="stylesheet" href="${contextPath }/resources/css/class/review.css" /> 
	<style>
	#layer {
		z-index: 2;
		position: absolute;
		top: 0px;
		left: 0px;
		width: 100%;
	}
	
	#popup {
		z-index: 3;
		position: fixed;
		text-align: center;
		left: 50%;
		top: 45%;
		width: 300px;
		height: 200px;
		background-color: #ccffff;
		border: 3px solid #87cb42;
	}
	
	#close {
		z-index: 4;
		float: right;
	}
	</style>
	<script type="text/javascript">
		
	$(document).ready(function() {

		//When page loads...
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content

		//On Click Event
		$("ul.tabs li").click(function() {

			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});

	});
	</script>
</head>
<body>
	<section>
		<hgroup>
			<h1>${itemDTO.hobby_name}</h1>
			<h2>${itemDTO.hobby_name} > ${itemDTO.hobby_sub_name}</h2>
			<h3>${itemDTO.item_name}</h3>
			<h4>고유번호 # ${itemDTO.item_code}</h4>
		</hgroup>
		<div id="goods_image">
			<figure>
				<div class="slide slide_wrap">
					<c:forEach var="img" items="${imageList}">
			     	 <div class="slide_item"><img src="${contextPath}/download.do?imgName=${img.imageFileName}&item_code=${img.item_code}"></div>
			      	</c:forEach>
			      <div class="slide_prev_button slide_button">◀</div>
			      <div class="slide_next_button slide_button">▶</div>
			      <ul class="slide_pagination"></ul>
			    </div>
			    <script src="${contextPath }/resources/js/slide.js"></script>
			</figure>
		</div>
		<div id="detail_table">
			<table>
				<tbody>
					<tr>
						<td class="fixed">정가</td>
						<td class="active"><span >
					       <fmt:formatNumber  value="${itemDTO.price}" pattern="#,###" /> 원
					       </span></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed">판매가</td>
						<td class="active"><span >
						   <fmt:formatNumber  value="${itemDTO.price}" pattern="#,###" /> 원
					       </span></td>
					</tr>
					<tr>
						<td class="fixed">재고 수량</td>
						<td class="active">${itemDTO.quantity} 개</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed">판매 수량</td>
						<td class="fixed">${itemDTO.item_count} 개</td>
					</tr>
					<tr>
						<td class="fixed">배송료</td>
						<td class="fixed"><strong>무료</strong></td>
					</tr>
					<tr>
						<td class="fixed">배송안내</td>
						<td class="fixed"><strong>[주간배송]</strong> 주문일 기준 1~2일이 소요됩니다.<br> <strong>[휴일배송]</strong>
							금요일 6시 이후 주문은 월요일 출고됩니다.</TD>
					</tr>
					<tr>
						<td class="fixed">도착 예정일</td>
						<td class="fixed"><%= today.format(nowTime) %></td>
					</tr>
					<tr>
						<td class="fixed">수량</td>
						<td class="fixed">
				     	  <select style="width: 60px;" id="order_goods_qty">
					      <option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
				     </select>
						 </td>
					</tr>
				</tbody>
			</table>
			<div align="right" style="margin-top: 10px">
			<button type="submit" class="btn btn-warning">구매하기 </button>
			<button type="reset" class="btn secondary">장바구니</button>
		</div>
		<div class="clear"></div>
		<!-- 내용 들어 가는 곳 -->
		<div id="container">
			<ul class="tabs">
				<li><a href="#tab1">제품 소개</a></li>
				<li><a href="#tab2">자주 묻는 질문</a></li>
				<li><a href="#tab3">리뷰</a></li>
			</ul>
			<div class="tab_container">
				<div class="tab_content" id="tab1">
					<h4>${itemDTO.intro}</h4>
					<p>${itemDTO.intro}</p>
				</div>
				<div class="tab_content" id="tab2">
					<h4>자주 묻는 질문</h4>
					 <div class="writer">환불 정책</div>
					 <p>제품에 이상이 있거나 내용과 상이한 제품이 배송된 경우 전액 반품이 이루어지며,</p>
					 <p>아직 배송이 이루어지지 않은 경우 전액 환불 가능합니다.</p>
					 <p>다만 이외 고객 변심 반품은 무상반품이 불가하며, 제품 발송이 시작되면 왕복 택배비가 부담 됩니다.</p>
					 <p>이미 제품을 개봉 및 사용한 흔적이 확인되는 경우 환불이 불가능하오니 이 점 유의 바랍니다.</p>
					 <div class="writer">교환 문의</div>
					 <p>제품 이상으로 인한 교환은 전액 무상으로 이루어집니다</p>
					 <p>고객 착오로 인해 발생되는 교환은 택배비가 부담되며 사용한 제품은 교환이 불가능 합니다.</p>
					 <p>사이즈 착오 등의 사유는 고객 부담의 교환 사유이오니 이 점 유의 바랍니다.</p>
					 <div class="writer">관련 클래스 수강 신청</div>
					 <p>상단 '클래스' 메뉴의 카테고리 선택을 통하시면 많은 클래스를 확인할 수 있습니다</p>
					 <p>회원가입을 진행해 필요 정보를 등록한 회원에 한해 수강이 가능하오니 많은 이용 부탁드립니다.</p>
				</div>
				<div class="tab_content" id="tab3">
					<h4>리뷰</h4>
					<div class="wrap">
					    <form name="reviewform" class="reviewform" method="post" action="/save">
					        <input type="hidden" name="rate" id="rate" value="0"/>
					        <p class="title_star">별점과 리뷰를 남겨주세요.</p>
					 
					        <div class="review_rating">
					            <div class="warning_msg">별점을 선택해 주세요.</div>
					            <div class="rating">
					                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
					                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
					                <label for="rating1"></label>
					                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
					                <label for="rating2"></label>
					                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
					                <label for="rating3"></label>
					                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
					                <label for="rating4"></label>
					                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
					                <label for="rating5"></label>
					            </div>
					        </div>
					        <div class="review_contents">
					            <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
					            <textarea rows="10" class="review_textarea"></textarea>
					        </div>   
					        <div class="cmd">
					            <input type="button" name="save" id="save" value="등록">
					        </div>
					    </form>
					</div>
				</div>
			</div>
		</div>
	</section>		
</body>
</html>