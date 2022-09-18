<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 	isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="classDTO"  value="${classMap.classDTO}"  />
<c:set var="imageList"  value="${classMap.imageFileList }"  />
<c:set var="reviewList"  value="${classMap.reviewList }"  />
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
	 
	function Rating(){};
	Rating.prototype.rate = 0;
	Rating.prototype.setRate = function(newrate){
	    this.rate = newrate;
	    let items = document.querySelectorAll('.rate_radio');
	    items.forEach(function(item, idx){
	        if(idx < newrate){
	            item.checked = true;
	        }else{
	            item.checked = false;
	        }
	    });
	}
	let rating = new Rating();
	
	
	function confirmDel() {
        if (window.confirm("정말 삭제하시겠습니까?")) {
          document.body.style.background = "#1abc9c";
        } else {
          console.log("취소. 변화 없음");
        }
      }
	
	</script>
</head>
<body>
	<section>
		<hgroup>
			<h1>${classDTO.hobby_name}</h1>
			<h2>${classDTO.hobby_name} > ${classDTO.hobby_sub_name}</h2>
			<h3>${classDTO.className}</h3>
			<h4>고유번호 # ${classDTO.class_code}</h4>
		</hgroup>
		<div id="goods_image">
			<figure>
				<%-- <img src="${contextPath}/download.do?imgName=${classDTO.imgName}&class_code=${classDTO.class_code}"> --%>
				<div class="slide slide_wrap">
					<c:forEach var="img" items="${imageList}">
			     	 <div class="slide_item"><img src="${contextPath}/download.do?imgName=${img.imageFileName}&class_code=${img.class_code}"></div>
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
						<td class="fixed">지역</td>
						<td class="active"><span >
					         ${classDTO.area_name}
					       </span></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed">수강료</td>
						<td class="active"><span >
						   <fmt:formatNumber  value="${classDTO.price}" pattern="#,###" /> 원
					       </span></td>
					</tr>
					<tr>
						<td class="fixed">개설자</td>
						<td class="active">${classDTO.manager}</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed">등록일</td>
						<td class="fixed">${classDTO.regidate}</td>
					</tr>
					<tr>
						<td class="fixed">시작일</td>
						<td class="fixed">
						   ${classDTO.startdate}
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed">종료일</td>
						<td class="fixed">
						   ${classDTO.enddate}
						</td>
					</tr>
					<tr>
						<td class="fixed">클래스 원</td>
						<td class="fixed"><strong>${classDTO.member_max} 인</strong></td>
					</tr>
					<tr>
						<td class="fixed">수강 인원</td>
						<td class="fixed"><strong>${classDTO.member_num} 인</strong></td>
					</tr>
					<tr>
						<td class="fixed">신청 인원</td>
						<td class="fixed">
				      <select style="width: 60px;" class="select_quantity">
					      <option value="1">1인</option>
								<option value="2">2인</option>
								<option value="3">3인</option>
								<option value="4">4인</option>
								<option value="5">5인</option>
				     </select>
						 </td>
					</tr>
				</tbody>
			</table>
			<div align="right" style="margin-top: 10px">
				<c:choose>
					<c:when test="${(classDTO.member_max - classDTO.member_num) > 0}">
						<form action="${contextPath }/order/orderPage.do" method="get" class="order_form">
							<input type="hidden" name="orders[0].goods_type" value="class">
							<input type="hidden" name="orders[0].goods_code" value="${classDTO.class_code }">
							<input type="hidden" name="orders[0].quantity" value="">
							<button type="submit" class="btn btn-warning order_submit">구매하기 </button>
						</form>
					</c:when>
					<c:when test="${(classDTO.member_max - classDTO.member_num) <= 0}">
						<button class="btn btn-warning order_submit">품절</button>
					</c:when>
				</c:choose>
				<form action="${contextPath }/mypage/addCart.do" method="post" class="cart_form">
					<input type="hidden" name="quantity" value="">
					<input type="hidden" name="goods_type" value="class">
					<input type="hidden" name="goods_code" value="${classDTO.class_code }">
					<button type="submit" class="btn secondary cart_submit">장바구니</button>
				</form>
			</div>
		</div>
		<div class="clear" ></div>
		<!-- 내용 들어 가는 곳 -->
		<div id="container">
			<ul class="tabs">
				<li><a href="#tab1">강의 소개</a></li>
				<li><a href="#tab2">강사 소개</a></li>
				<li><a href="#tab3">커리큘럼</a></li>
				<li><a href="#tab4">자주 묻는 질문</a></li>
				<li><a href="#tab6">리뷰</a></li>
			</ul>
			<div class="tab_container">
				<div class="tab_content" id="tab1">
					<h4>${classDTO.intro}</h4>
					<p>${classDTO.intro}</p>
				</div>
				<div class="tab_content" id="tab2">
					<h4>강사 소개</h4>
					<p>${classDTO.teacherInfo}</p> 
				</div>
				<div class="tab_content" id="tab3">
					<h4>커리큘럼</h4>
					<p>${classDTO.curriculum}</p> 
				</div>
				<div class="tab_content" id="tab4">
					<h4>자주 묻는 질문</h4>
					 <div class="writer">환불 정책</div>
					 <p>아직 수강이 시작되지 않은 클래스는 7일 전까지 전액 환불 가능합니다. 개강까지 7일 미만의 경우 개설자와의 협의를 통해 취소 진행이 가능합니다. </p>
					 <p>이미 수강이 시작 된 경우 환불이 불가능하오니 이 점 유의 바랍니다.</p>
					 <div class="writer">수강 문의</div>
					 <p>온라인 클래스의 경우 결제 후 개설자와 협의 된 클래스 시간에 PC를 통해 수강이 가능합니다.</p>
					 <p>오프라인 클래스의 경우 결제 후 개설자의 안내에 따라 오프라인 모임을 진행하게 됩니다.</p>
					 <div class="writer">수강 신청</div>
					 <p>회원가입을 진행해 필요 정보를 등록한 회원에 한해 수강이 가능합니다.</p>
					 <p>회원가입은 상단 [회원가입]을 선택하여 진행해주시면 됩니다.</p>
				</div>
				<div class="tab_content" id="tab5">
					<h4>추천사</h4>
					<p>추천사</p>
				</div>
				<div class="tab_content" id="tab6">
					<h4>리뷰</h4>
					<div class="wrap">
					    <form class="mb-3" name="myform" id="myform" method="post" action="${contextPath}/class/reviewAdd.do">
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
								<input type="hidden" name="cmt_class" value="${classDTO.class_code}">
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
					
					<table id="review_table"  style="margin-top: 20px">
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
			 							<td width="10%">${cmt.cmt_writer_name }</td>
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
											<c:if test="${cmt.cmt_writer_name == mem_name_s}">
												<a href="${contextPath}/class/classReviewRemove.do?class_code=${classDTO.class_code}&cmt_num=${cmt.cmt_num}"><input type="button" value="삭제"></a>
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
		</div>
	</section>		
</body>
</html>