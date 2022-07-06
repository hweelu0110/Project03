<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<%@include file="../headinfo.jsp" %>
	<link rel="stylesheet" href="../resources/css/payment.css" />	
</head>
<body>
	<%@include file="../header.jsp" %>
	
	<section>
		<!-- 1. 결제완료  -->
		<div id="payment_div">
			<h2>결제완료</h2>					
				
			<div class="paySection item_info">
				<!-- 2. 무통장 결제 완료시 노출  -->
				<h3>아래의 계좌로 입금해주세요</h3>
				<div id="payComInfo">
					<table>
						<tr>
							<th>은행명</th>
							<td>선택은행</td>
						</tr>
						<tr>
							<th>계좌번호</th>
							<td>5451258425152 (예금주:알토)</td>
						</tr>
						<tr>
							<th>금액</th>
							<td class="select">399,800원</td>
						</tr>
						<tr>
							<th>입금 마감일</th>
							<td>2022년6월19일23시59분(내일자정까지)</td>
						</tr>
					</table>
				</div>
				
				<!-- 3. 시작예정 클래스 구매완료  -->
				<h3>6월 23일 클래스에서 만나요!</h3>
				<div id="payComInfo">
					<table>
						<tr>
							<th>수강기간</th>
							<td>2022년6월23일부터 2022년7월23일까지</td>
						</tr>
					</table>
				</div>
				
				<h4>주문 내역</h4>
				<img src="../resources/img/class_test.jpg" />
				<div>
					<p class="item_name">선택 상품 제목</p>
					<span class="item_op">옵션1: 선택옵션</span>
					<span class="item_num">수량 1개</span>
					<p><a href="">상세보기로 이동</a></p>
				</div>
			</div>		
			
		</div>
		
		
		
		
	</section>
	
	<%@include file="../footer.jsp" %>
</body>
</html>