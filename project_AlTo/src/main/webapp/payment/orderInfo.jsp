<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<%@include file="../headinfo.jsp" %>
	<link rel="stylesheet" href="../css/payment.css" />	
	<script type="text/javascript">
		$(function() {
			/* 필수 입력 알림 css */
			$("#del_info .essential").addClass("notiTxt")
			
			$("#del_info .essential").keyup(function() {
				if ($(this).val() == "") {
					$(this).addClass("notiTxt")
					$(this).next("span.noti2").css("text-indent","0")
				}else {
					$(this).removeClass("notiTxt")
					$(this).next("span.noti2").css("text-indent","-9999px")
				}
			})			
			
			/* 결제 방식 선택 */
			$(".pay_method li").click(function() {
				$(this).addClass("choice")
				$(this).siblings().removeClass("choice")
			})
		})
	</script>
</head>
<body>
	<%@include file="../header.jsp" %>
	
	<section>
		<div id="payment_div">
			<h2>결제하기</h2>
			
			<div class="paySection">
				<h3>주문 정보</h3>
				<p id="reChoice">상세로 이동</p>
				<div class="item_info">
					<img src="../img/class_test.jpg" />
					<div>
						<p class="item_name">선택 상품 제목</p>
						<span class="item_op">옵션1: 선택옵션</span>
						<span class="item_num">수량 1개</span>
					</div>
				</div>
				<div class="item_info">
					<img src="../img/class_test.jpg" />
					<div>
						<p class="item_name">선택 상품 제목</p>
						<span class="item_op">옵션1: 선택옵션</span>
						<span class="item_num">수량 1개</span>
					</div>
				</div>					
			</div>
			
			<div id="del_info" class="paySection">
				<h3>배송 정보</h3>
				
				<form action="" name="deliveryFrm" method="post">
					<p>받으시는 분</p>
					<input type="text" name="userName" value="김지선" /><br/>
					<span class="noti1">배송 시 수령인 확인을 위해 실명을 입력해 주세요.</span><br/>
					<p>휴대폰 번호</p>
					<input type="text" name="userPhone" value="01012345678" /><br/>
					<p>배송 주소</p>
					<input type="text" name="zipcode" class="essential size1" value="" placeholder="우편번호" />
					<span class="noti2">필수 입력입니다.</span><br/>
					<button type="button" name="find_zipcode" class="pointBtn">우편번호 찾기</button>
					<input type="text" name="add" class="essential" value="" placeholder="주소" />
					<span class="noti2">필수 입력입니다.</span><br/>
					<input type="text" name="detail" class="essential" value="" placeholder="상세주소" />
					<span class="noti2">필수 입력입니다.</span><br/>					
					<p>배송 요청사항</p>
					<input type="text" name="request" value="" placeholder="예)경비실에 맡겨주세요" />
				</form>
			</div>
			
			<div class="paySection price_info">
				<h3>결제 금액</h3>
				
				<p>총 상품 금액 <span>399,800원</span></p>
				<p class="point_txt1">쿠폰 할인 금액 <span>-399,800원</span></p>
				<p class="point_txt2">최종 결제 금액 <span>399,800원</span></p>
			</div>			
			
			<div class="paySection">
				<h3>결제 방식</h3>
				
				<ul class="pay_method">
					<li class="choice">카드 결제</li>
					<li>무통장 입금</li>
					<li>카카오페이</li>
					<li>네이버페이</li>
					<li>토스</li>
					<li>평생교육바우처</li>
				</ul>
			</div>
			
			<button type="submit" class="pointBtn size0">다음</button>
		</div>
	</section>
	
	<%@include file="../footer.jsp" %>
</body>
</html>