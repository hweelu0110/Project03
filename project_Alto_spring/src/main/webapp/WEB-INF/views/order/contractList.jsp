<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style type="text/css">
		.paging {
			font-size:large; 
			text-decoration: overline; 
			text-shadow: yellow;
		}
		
		.order_table {
			background-color: none;
			border-top: none;
			border-left: none; 
			border-right: none;
		}
		
		.listTitle {
			background-color: #ededed;
		}
		
	</style>
</head>
<body>
	<section>
		<div class="jumbotron">
		</div>
		<div class="container">
			<div style="padding-top:50px;">
				<h3>주문 내역</h3>
				<table class="table order_table">
						<c:if test="${empty orderList}">
							<td colspan="7" align="center">주문 제품이 없습니다</td>
						</c:if>
						<c:if test="${not empty orderList}">
							<c:forEach items="${orderList }" var="orderList">
								<tr class="listTitle">
									<th colspan="2" width="10%">주문번호</th>
									<td width="50%">${orderList.orderId }</td>
									<th width="10%">주문일자</th>
									<td width="10%">${orderList.orderDate }</td>
									<th width="10%">주문상태</th>
									<td width="10%">${orderList.orderState }</td>
								</tr>
								<tr>
									<td></td>
									<th></th>
									<th style="text-align: center;">상품명</th>
									<th colspan="2" style="text-align: center;">수량</th>
									<th colspan="2" style="text-align: center;">가격</th>
								</tr>
								<c:if test="${empty orderList.orders}">
									<tr>
										<td colspan="7" align="center">주문 제품이 없습니다</td>
									</tr>
								</c:if>
								<c:if test="${not empty orderList.orders}">
									<c:forEach items="${orderList.orders }" var="goodsList" varStatus="status">
										<tr>	
											<td></td>
											<td align="center">${status.count }</td>
											<td align="center">${goodsList.goods_name }</td>
											<td colspan="2" align="center">${goodsList.quantity }</td>
											<td colspan="2" align="center"><fmt:formatNumber value="${goodsList.price }" pattern="##,###,###" /></td>
										</tr>
									</c:forEach>
									<tr style="border: none;"><td style="border: none; height: 30px;" colspan="7"></td></tr>
								</c:if>
							</c:forEach>	
							
							    <tr align="center" class="paging">
							    	<td colspan="7">
								        <c:if test="${pageMarker.prev}">
								            <a href="${contextPath }/order/contractList.do?page=${pageMaker.startPage - 1}">이전</a>
								        </c:if>
								        <c:forEach begin="${pageMarker.startPage}" end="${pageMarker.endPage}" var="idx">
								               <a href="${contextPath }/order/contractList.do?page=${idx}">${idx}</a>
								        </c:forEach>
								        <c:if test="${pageMarker.next && pageMarker.endPage > 0}">
								            <a href="${contextPath }/order/contractList.do?page=${pageMaker.endPage + 1}">다음</a>
								        </c:if>
							        </td>
							    </tr>
							    
						</c:if>
					</table>
			</div>
		</div>
	</section>
</body>
</html>