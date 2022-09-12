<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="orderList" value="${orderInfo.orderList}" />
<c:set var="memberDTO" value="${orderInfo.memberDTO}" />
<!DOCTYPE html>
<html>
<head>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<meta charset="UTF-8">
	<script>
	
		$(document).on("click", ".order_btn", function(){

			let form_contents = ''; 
			
			$(".goods_table_price_td").each(function(index, element){
				let goods_type = $(element).find(".individual_goodsType_input").val();
				let goods_code = $(element).find(".individual_goodsCode_input").val();
				let quantity = $(element).find(".individual_quantity_input").val();
					
				let goods_type_input = "<input name='orders[" + index + "].goods_type' type='hidden' value='" + goods_type + "'>";
				form_contents += goods_type_input;
				
				let goods_code_input = "<input name='orders[" + index + "].goods_code' type='hidden' value='" + goods_code + "'>";
				form_contents += goods_code_input;
				
				let quantity_input = "<input name='orders[" + index + "].quantity' type='hidden' value='" + quantity + "'>";
				form_contents += quantity_input;
				
			});	
				
			$(".order_form").append(form_contents);	
			$(".order_form").submit();	
		});
		
		function kakaopost() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		           document.querySelector("#zipcode").value = data.zonecode;
		           document.querySelector("#address").value =  data.address
		        }
		    }).open();
		}
	
		
	</script>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<body>
	<section>
		<div class="jumbotron">
		</div>
		<div class="container">
			<div style="padding-top:50px;">
				<table class="table table-hover">
					<tr><td colspan="5" align="center"><h3>주문 내역</h3></td></tr>
					<tr>
						<th width="10">분류</th>
						<th width="50%">상품</th>
						<th width="10%">가격</th>
						<th width="10%">수량</th>
						<th width="10%">소계</th>
					</tr>
					<c:if test="${empty orderList}">
						<tr>
							<td colspan="5" align="center">주문 예정인 제품이 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${not empty orderList}">
						<c:forEach items="${orderList }" var="orderList">
							<tr>	
								<td>
									<c:if test="${orderList.goods_type == 'class'}">클래스</c:if> 
									<c:if test="${orderList.goods_type == 'item'}">취미용품</c:if> 
								</td>
								<td>${orderList.goods_name }</td>
								<td><fmt:formatNumber value="${orderList.price }" pattern="##,###,###" /></td>
								<td>${orderList.quantity }</td>
								<td class="goods_table_price_td">
									<fmt:formatNumber value="${orderList.totalPrice }" pattern="##,###,###" />
									<input type="hidden" class="individual_Price_input" value="${orderList.price}">
									<input type="hidden" class="individual_quantity_input" value="${orderList.quantity}">
									<input type="hidden" class="individual_totalPrice_input" value="${orderList.totalPrice}">
									<input type="hidden" class="individual_goodsCode_input" value="${orderList.goods_code}">
									<input type="hidden" class="individual_goodsType_input" value="${orderList.goods_type}">
								</td>
								<c:set var="TotalSum" value="${TotalSum + (orderList.totalPrice) }" />
								
									
							</tr>
						</c:forEach>
					</c:if>	
					
					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><fmt:formatNumber value="${TotalSum }" pattern="##,###,###" /> 원</th>
						<th></th>
					</tr>
				</table>
				
				<form action="${contextPath }/order/orderPagePost.do" method="get" class="order_form">
					<table class="table table-hover order_table">
						<tr><td colspan="5" align="center"><h3>주문자 정보 확인</h3></td></tr>
						<tr>
							<th width="10">이름</th>
							<td width="90%">${memberDTO.mem_name }</td>
						</tr>
						<tr>
							<th width="10">메일주소</th>
							<td width="90%"><input type="text" name="memberId" value="${memberDTO.mem_id }" readonly="readonly" style="width: 50%"></td>
						</tr>
						<tr>
							<th width="10">우편번호</th>
							<td width="90%">
							<input type="text" name="zipcode" id="zipcode" size="7" style="width: 20%" readonly> 
	                		<input type="button" value="우편번호찾기" onclick="kakaopost()"></td>
						</tr>
						<tr>
				            <th>주소</th>
				            <td><input type="text" name="address" id="address" size="70"></td>
				        </tr>
				        <tr>
				            <th>나머지 주소</th>
				            <td><input type="text" name="dis_address" size="70"></td>
				        </tr>
					</table>
					</form>
					
					<div align="right" style="margin-top: 10px; margin-bottom: 20px">
							<button class="btn btn-warning order_btn">결제하기</button>
					</div>
			</div>
		</div>
	</section>
</body>
</html>