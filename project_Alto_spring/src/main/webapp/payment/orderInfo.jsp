<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<%@include file="../headinfo.jsp" %>
	<link rel="stylesheet" href="../css/payment.css" />	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../js/essential-textbox.js"></script>
	<script type="text/javascript">
		/* 우편번호 검색 api */
		function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }              
	
	         	// 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById('sample6_postcode').classList.remove('notiTxt');
                document.getElementById('sample6_postcode').nextElementSibling.style.display = "none";
                document.getElementById("sample6_address").value = addr;
                document.getElementById('sample6_address').classList.remove('notiTxt');
                document.getElementById('sample6_address').nextElementSibling.style.display = "none";
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
		$(function() {			
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
			</div>
			
			<div id="del_info" class="paySection">
				<h3>배송 정보</h3>
				
				<form action="" name="deliveryFrm" method="post">
					<p>받으시는 분</p>
					<input type="text" name="userName" class="essential" value="김지선" />
					<span class="noti2">필수 입력입니다.</span>
					<span class="noti1">배송 시 수령인 확인을 위해 실명을 입력해 주세요.</span>
					<p>휴대폰 번호</p>
					<input type="text" name="userPhone" class="essential" value="01012345678" />
					<span class="noti2">필수 입력입니다.</span>
					<p>배송 주소</p>
					<input type="text" name="zipcode" id="sample6_postcode" class="essential size1" placeholder="우편번호" />
					<span class="noti2">필수 입력입니다.</span>
					<button type="button" name="find_zipcode" class="pointBtn" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
					<input type="text" name="add" id="sample6_address" class="essential" placeholder="주소" />
					<span class="noti2">필수 입력입니다.</span>
					<input type="text" name="detail" id="sample6_detailAddress" class="essential" placeholder="상세주소" />
					<span class="noti2">필수 입력입니다.</span>					
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