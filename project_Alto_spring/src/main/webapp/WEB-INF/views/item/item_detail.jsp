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
<c:set var="reviewList"  value="${itemMap.reviewList }"  />
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
	
	form {
		margin:0;
		display:inline;
		height:20px;
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
		
		$(".cart_submit").on("click", function(){
			let goodsCount = $(".select_quantity").val();
			$(".cart_form").find("input[name='quantity']").val(goodsCount);
			$(".cart_form").submit();
		});
		
		$(".order_submit").on("click", function(){
			let goodsCount = $(".select_quantity").val();
			$(".order_form").find("input[name='orders[0].quantity']").val(goodsCount);
			$(".order_form").submit();
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
				     	  <select style="width: 60px;" class="select_quantity">
					      <option value="1">1개</option>
								<option value="2">2개</option>
								<option value="3">3개</option>
								<option value="4">4개</option>
								<option value="5">5개</option>
				     </select>
						 </td>
					</tr>
				</tbody>
			</table>
			<div align="right" style="margin-top: 10px">
				<form action="${contextPath }/order/orderPage.do" method="get" class="order_form">
					<input type="hidden" name="orders[0].goods_type" value="item">
					<input type="hidden" name="orders[0].goods_code" value="${itemDTO.item_code }">
					<input type="hidden" name="orders[0].quantity" value="">
					<button type="submit" class="btn btn-warning order_submit">구매하기 </button>
				</form>
				<form action="${contextPath }/mypage/addCart.do" method="post" class="cart_form">
					<input type="hidden" name="quantity" value="">
					<input type="hidden" name="goods_type" value="item">
					<input type="hidden" name="goods_code" value="${itemDTO.item_code }">
					<button type="submit" class="btn secondary cart_submit">장바구니</button>
				</form>
			</div>
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
					    <form class="mb-3" name="myform" id="myform" method="post" action="${contextPath}/item/reviewAdd.do">
							<fieldset>
								<span class="text-bold">별점을 선택해주세요</span>
								<input type="radio" name="CMT_STAR" value="5" id="rate1"><label
									for="rate1">★</label>
								<input type="radio" name="CMT_STAR" value="4" id="rate2"><label
									for="rate2">★</label>
								<input type="radio" name="CMT_STAR" value="3" id="rate3"><label
									for="rate3">★</label>
								<input type="radio" name="CMT_STAR" value="2" id="rate4"><label
									for="rate4">★</label>
								<input type="radio" name="CMT_STAR" value="1" id="rate5"><label
									for="rate5">★</label>
							</fieldset>
							<c:if test="${not empty mem_name_s }">
								<div>
									<textarea class="col-auto form-control" type="text" id="CMT_CONTENT" name="CMT_CONTENT" placeholder="좋은 수강평을 남겨주시면 큰 힘이 됩니다!"></textarea>						
								</div>
								<input type="hidden" name="cmt_item" value="${itemDTO.item_code}">
								<div align="right">
								<button type="submit" class="btn btn-warning">리뷰 등록</button>
								</div>
							</c:if>
							<c:if test="${empty mem_name_s }">
								<div>
									<textarea class="col-auto form-control" type="text" id="CMT_CONTENT" name="CMT_CONTENT" readonly="readonly">로그인 후 리뷰 작성이 가능합니다.</textarea>						
								</div>
							</c:if>
						</form>
					</div>
					
					<table id="review_table">
						<tr>
							<td width="10%">작성자</td>
							<td width="50%">내용</td>
							<td width="20%">별점</td>
							<td width="10%">작성일</td>
							<td width="10%">비고</td>
 						</tr>
 						<c:choose>
 							<c:when test="${not empty reviewList }">
		 						<c:forEach var="cmt" items="${reviewList }">
			 						<tr>
			 							<td width="10%">${cmt.cmt_writer }</td>
										<td width="50%">${cmt.cmt_content }</td>
										<td width="20%">
											<c:if test="${cmt.cmt_star == 5 }">
												★★★★★
											</c:if>
											<c:if test="${cmt.cmt_star == 4 }">
												★★★★☆
											</c:if>
											<c:if test="${cmt.cmt_star == 3 }">
												★★★☆☆
											</c:if>
											<c:if test="${cmt.cmt_star == 2 }">
												★★☆☆☆
											</c:if>
											<c:if test="${cmt.cmt_star == 1 }">
												★☆☆☆☆
											</c:if>
											<c:if test="${cmt.cmt_star == 0 }">
												☆☆☆☆☆
											</c:if>
										</td>
										<td width="10%">${cmt.cmt_regdate }</td>
										<td width="10%">
											<c:if test="${cmt.cmt_writer == mem_name_s}">
												<a href="${contextPath}/item/itemReviewRemove.do?item_code=${itemDTO.item_code}&cmt_num=${cmt.cmt_num}">삭제</a>
											</c:if>
										</td>
									</tr>
		 						</c:forEach>
 							</c:when>
 							<c:when test="${empty reviewList }">
	 							<tr>
	 								<td colspan="4">
	 									등록된 리뷰가 없습니다.
	 								</td>
	 							</tr>
 							</c:when>
 						</c:choose>
					</table>
				</div>
			</div>
		</section>		
	</body>
</html>