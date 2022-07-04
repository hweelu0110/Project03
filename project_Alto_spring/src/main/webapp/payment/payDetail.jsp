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
			$("#delChange").click(function() {
				$("#delEditPopup").show()
			})
		})
	</script>
</head>
<body>
	<%@include file="../header.jsp" %>
	
	<section>
		<div id="payment_div">
			<h2>2022.06.18 주문 상세 내역</h2>
			
			<div class="paySection">
				<h3>결제 성공</h3>
				<h3>취소 성공</h3>
				<div class="paySection price_info">
					<h3>결제 금액</h3>
					<p>결제 수단 <span>카드</span></p>
					<p>총 결제 금액 <span>399,800원</span></p>
					<p class="point_txt2">카드 결제 금액 <span>399,800원</span></p>
					<p class="point_txt2">총 환불 금액 <span>399,800원</span></p>
				</div>
			</div>
			
			<div class="paySection">	
				<h3>배송 정보</h3>
				<p id="delChange">배송지 변경</p>
				<div id="payComInfo">
					<table>
						<tr>
							<th>받는 분</th>
							<td>김지선</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>010-1234-5678</td>
						</tr>
						<tr>
							<th>배송 주소</th>
							<td>(01233) 서울 강남구 xxx길 xxx xx</td>
						</tr>
						<tr>
							<th>배송 요청사항</th>
							<td>경비실에 맡겨주세요</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class="paySection">	
				<h3>구매 물품</h3>				
				<div class="item_info">
					<img src="../resources/img/class_test.jpg" />
					<div>
						<p class="item_name">선택 상품 제목</p>
						<span class="item_op">옵션1: 선택옵션</span>
						<span class="item_num">수량 1개</span>
					</div>
				</div>
				<div class="item_info">
					<img src="../resources/img/class_test.jpg" />
					<div>
						<p class="item_name">선택 상품 제목</p>
						<span class="item_op">옵션1: 선택옵션</span>
						<span class="item_num">수량 1개</span>
					</div>
				</div>					
						
			
				<button type="submit" class="basicBtn size0">환불하기</button>
			</div>
		</div>
		
		<!-- 배송지 변경 popup -->
		<div id="delEditPopup" class="paySection">
			<button type="button" class="closeBtn">닫기</button>
			<h3>배송지 변경하기</h3>
			
			<form action="" name="deliveryEditFrm" method="post">
				<p>받으시는 분</p>
				<input type="text" name="userName" value="김지선" /><br/>
				<span class="noti1">배송 시 수령인 확인을 위해 실명을 입력해 주세요.</span><br/>
				<p>휴대폰 번호</p>
				<input type="text" name="userPhone" value="01012345678" /><br/>
				<p>배송 주소</p>
				<input type="text" name="zipcode" class="size3 margin" value="우편번호" />
				<button type="button" name="find_zipcode" class="pointBtn">우편번호 찾기</button><br/>
				<input type="text" name="add" class="margin" value="주소" /><br/>
				<input type="text" name="detail" class="margin" value="상세주소" /><br/>				
				<p>배송 요청사항</p>
				<input type="text" name="request" value="예)경비실에 맡겨주세요" />
				<input type="submit" name="saveBtn" class="pointBtn size0" value="저장하기" />
			</form>
		</div>
	</section>
	
	<%@include file="../footer.jsp" %>
</body>
</html>