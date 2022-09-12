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
	<meta charset="UTF-8">
</head>
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
								<td><fmt:formatNumber value="${orderList.totalPrice }" pattern="##,###,###" /></td>
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
				
				<table class="table table-hover">
					<tr><td colspan="5" align="center"><h3>주문자 정보 확인</h3></td></tr>
					<tr>
						<th width="10">이름</th>
						<td width="90%">${memberDTO.mem_name }</td>
					</tr>
					<tr>
						<th width="10">메일주소</th>
						<td width="90%">${memberDTO.mem_id }</td>
					</tr>
					<tr>
						<th width="10">연락처</th>
						<td width="90%">${memberDTO.phone }</td>
					</tr>
					<tr>
						<th width="10">주소</th>
						<td width="90%"></td>
					</tr>
				</table>
				
				<div align="right" style="margin-top: 10px; margin-bottom: 20px">
					<button type="submit" class="btn btn-warning">결제하기 </button>
				</div>
			</div>
		</div>
	</section>
</body>
</html>