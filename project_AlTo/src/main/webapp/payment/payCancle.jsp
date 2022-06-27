<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<%@include file="../headinfo.jsp" %>
	<link rel="stylesheet" href="../css/payment.css" />	
</head>
<body>
	<%@include file="../header.jsp" %>
	
	<section>
		<div id="payment_div">
			<h2>주문 취소</h2>
			
			<div class="paySection">
				<h3>주문 정보</h3>
				<div id="reChoice">상세로 이동</div>
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
			
			<div class="paySection price_info">
				<h3>환불 금액</h3>
				
				<p>총 상품 금액 <span>399,800원</span></p>
				<p class="point_txt2">총 환불 금액 <span>399,800원</span></p>
			</div>	
			
			<button type="submit" class="pointBtn size0">다음</button>
		</div>
	</section>
	
	<%@include file="../footer.jsp" %>
</body>
</html>