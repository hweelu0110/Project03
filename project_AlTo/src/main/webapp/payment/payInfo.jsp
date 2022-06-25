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
		<!-- 카드 결제 인 경우  -->
		<div id="payment_div">			
			<div class="paySection payInfo">	
				<h2>카드결제</h2>				
				<div class="price_info">				
					<p class="point_txt2">총 결제 금액 <span>399,800원</span></p>
				</div>
				
				<form action="" name="deliveryFrm" method="post">
					<!-- 카드 정보가 있을 때 -->
					<p>카드 선택</p>
					<select name="creditCardId" class="selecSty">
						<option value="NewCard">새로운 카드 추가하기</option>
						<option value="cardNum">현대카드 (1233)</option>
					</select><br/>
					<p>카드 번호</p>
					<input type="text" name="cardNumber" class="notiTxt" value="0000-0000-0000-0000" /><br/>
					<span class="noti2">최소 14자 이상 입력해 주세요.</span><br/>
					<div class="card_info">
						<p>유효기간</p>
						<input type="text" name="userPhone" class="size2 notiTxt" value="01012345678" />
						<span class="noti2">입력해 주세요.</span>
					</div>
					<div>
						<p>생년월일</p>
						<input type="text" name="zipcode" class="size2 notiTxt" value="우편번호" />
						<span class="noti2">생년월일 6자리를 입력해 주세요.</span><br/>
					</div>
				</form>
			</div>			
			
			<button type="submit" class="pointBtn size0">결제하기</button>
		</div>
	
		<!-- 무통장입금 인 경우  -->
		<div id="payment_div">			
			<div class="paySection payInfo">	
				<h2>무통장입금</h2>				
				<div class="price_info">				
					<p class="point_txt2">총 결제 금액 <span>399,800원</span></p>
				</div>
				
				<h3>결제 정보</h3>
				<form action="" name="deliveryFrm" method="post">
					<p>입금 은행</p>
					<select name="bankCode" class="selecSty">
						<option disabled>입금할 은행을 선택해주세요</option>
						<option value="004">국민은행</option>
						<option value="003">기업은행</option>
						<option value="011">농협은행</option>
						<option value="088">신한은행</option>
						<option value="005">하나은행</option>
						<option value="023">SC제일은행</option>
						<option value="031">대구은행</option>
						<option value="032">부산은행</option>
						<option value="020">우리은행</option>
						<option value="089">케이뱅크</option>
					</select><br/>
					
					<p id="cashBill" class="checkStyle">현금영수증 발행</p>
					<div id="cashBill_area">
						<p id="option01" class="checkStyle checked">소득공제용</p>
						<p id="option02" class="checkStyle">지출증빙용</p>
						<p class="option01">휴대폰 번호</p>
						<p class="option02">사업자 등록번호</p>
						<input type="text" name="cashBillNum" class="notiTxt" value="숫자만 입력해주세요" />
						<span class="noti2">현금영수증 발행 번호를 입력해주세요</span><br/>
					</div>					
				</form>
			</div>			
			
			<button type="submit" class="pointBtn size0">신청하기</button>
		</div>
		
		<!-- 평생교육바우처 결제 안내 팝업 -->
		<div class="popup_div">
			<button type="button" class="closeBtn">닫기</button>
			<p>정부 교육지원 사업으로 정규 클래스 수강권을 포함하지 않는 상품은 구매가 불가능해요. 
			자세한 사항은 <span class="select">평생교육바우처 결제 정책</span>과 아래의 구매 불가 상품들을 꼭 확인해주세요.</p>
			<p class="noti1">지원 대상이 아닌 구매건은 사전 고지 없이 취소될 수 있고,<br/>
			취소 과정에서 운임 및 책임 비용이 발생할 수 있습니다.</p>
			<button type="button" class="pointBtn">확인하고 결제 진행하기</button>
		</div>
	</section>
	
	<%@include file="../footer.jsp" %>
</body>
</html>