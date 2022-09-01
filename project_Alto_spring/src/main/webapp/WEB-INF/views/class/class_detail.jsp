<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 	isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%-- 
<c:set var="classa"  value="$classMap.classDTO}"  />
<c:set var="imageList"  value="$classMap.imageList }"  />
 --%>
<%
     //치환 변수 선언
      //pageContext.setAttribute("crcn", "\r\n"); //개행문자
      pageContext.setAttribute("crcn" , "\n"); //Ajax로 변경 시 개행 문자 
      pageContext.setAttribute("br", "<br/>"); //br 태그
%>  
<html>
<head>
	<link rel="stylesheet" href="${contextPath }/resources/css/class/class_detail.css" /> 
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
	<hgroup>
		<h1>클래스 대분류</h1>
		<h2>클래스 소분류</h2>
		<h3>클래스명</h3>
		<h4>클래스 개최자 아이디 | 개최자 이름</h4>
	</hgroup>
	<div id="goods_image">
		<figure>
			<img alt="HTML5 &amp; CSS3"
				src="#">
		</figure>
	</div>
	<div id="detail_table">
		<table>
			<tbody>
				<tr>
					<td class="fixed">정가</td>
					<td class="active"><span >
					   <fmt:formatNumber  value="10000" type="number" var="goods_price" />
				         10,000원
					</span></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed">판매가</td>
					<td class="active"><span >
					   <fmt:formatNumber  value="10000" type="number" var="discounted_price" />
				         10,000원</span></td>
				</tr>
				<tr>
					<td class="fixed">포인트적립</td>
					<td class="active">0원</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed">포인트 추가적립</td>
					<td class="fixed">만원이상 구매시 1,000P, 5만원이상 구매시 2,000P추가적립 편의점 배송 이용시 300P 추가적립</td>
				</tr>
				<tr>
					<td class="fixed">시작일</td>
					<td class="fixed">
					   <c:set var="pub_date" value="시작일" />
					   <c:set var="arr" value="시작일" />
					   <c:out value="시작일" />
					</td>
				</tr>
				<tr>
					<td class="fixed">페이지 수</td>
					<td class="fixed">123쪽</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed">ISBN</td>
					<td class="fixed">1231413</td>
				</tr>
				<tr>
					<td class="fixed">배송료</td>
					<td class="fixed"><strong>무료</strong></td>
				</tr>
				<tr>
					<td class="fixed">배송안내</td>
					<td class="fixed"><strong>[당일배송]</strong> 당일배송 서비스 시작!<br> <strong>[휴일배송]</strong>
						휴일에도 배송받는 Bookshop</TD>
				</tr>
				<tr>
					<td class="fixed">도착예정일</td>
					<td class="fixed">지금 주문 시 내일 도착 예정</td>
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
		<ul>
			<li><a class="buy" href="javascript:fn_order_each_goods('$goods.goods_id }','$goods.goods_title }','$goods.goods_sales_price}','$goods.goods_fileName}');">구매하기 </a></li>
			<li><a class="cart" href="javascript:add_cart('$goods.goods_id }')">장바구니</a></li>
			
			<li><a class="wish" href="#">위시리스트</a></li>
		</ul>
	</div>
	<div class="clear"></div>
	<!-- 내용 들어 가는 곳 -->
	<div id="container">
		<ul class="tabs">
			<li><a href="#tab1">책소개</a></li>
			<li><a href="#tab2">저자소개</a></li>
			<li><a href="#tab3">책목차</a></li>
			<li><a href="#tab4">출판사서평</a></li>
			<li><a href="#tab5">추천사</a></li>
			<li><a href="#tab6">리뷰</a></li>
		</ul>
		<div class="tab_container">
			<div class="tab_content" id="tab1">
				<h4>책소개</h4>
				<p>책소개</p>
				<c:forEach var="image" items="${imageList }">
					<img 
						src="#">
				</c:forEach>
			</div>
			<div class="tab_content" id="tab2">
				<h4>저자소개</h4>
				<p>
				<div class="writer">저자 : 글쓴이</div>
				 <p>글쓴이</p> 
				
			</div>
			<div class="tab_content" id="tab3">
				<h4>책목차</h4>
				<p>책목차</p> 
			</div>
			<div class="tab_content" id="tab4">
				<h4>출판사서평</h4>
				 <p>출판사서평</p> 
			</div>
			<div class="tab_content" id="tab5">
				<h4>추천사</h4>
				<p>추천사</p>
			</div>
			<div class="tab_content" id="tab6">
				<h4>리뷰</h4>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div id="layer" style="visibility: hidden">
		<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
		<div id="popup">
			<!-- 팝업창 닫기 버튼 -->
			<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');"> <img
				src="$contextPath}/resources/image/close.png" id="close" />
			</a> <br /> <font size="12" id="contents">장바구니에 담았습니다.</font><br>
<form   action='$contextPath}/cart/myCartList.do'  >				
		<input  type="submit" value="장바구니 보기">
</form>			
</body>
</html>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn }"/>