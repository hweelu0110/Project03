<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<c:set var="contextPath" value="${pageContext.request.contextPath}" />  
<c:set var="cartClassList"  value="${cartMainMap.cartClassList}"  />
<c:set var="cartItemList"  value="${cartMainMap.cartItemList}"  />
<c:set var="classSum" value="0" />
<c:set var="itemSum" value="0" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/bootstrap.min.css" />
</head>
<body>
	<section>
		<div class="jumbotron">
		</div>
		<div class="container">
			<div style="padding-top:50px;">
				<table class="table table-hover">
					<tr><td colspan="5"><h3>클래스 장바구니</h3></td></tr>
					<tr>
						<th width="60%">상품</th>
						<th width="10%">가격</th>
						<th width="10%">수량</th>
						<th width="10%">소계</th>
						<th width="10%">비고</th>
					</tr>
					<c:if test="${empty cartClassList}">
						<tr>
							<td colspan="5">장바구니에 담긴 클래스가 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${not empty cartClassList}">
						<c:forEach items="${cartClassList }" var="classDTO">
							<tr>
								<td><a href="${contextPath}/class/classDetail.do?class_code=${classDTO.goods_code}">${classDTO.className }</a></td>
								<td><fmt:formatNumber value="${classDTO.price }" pattern="##,###,###" /></td>
								<td>${classDTO.quantity }</td>
								<td><fmt:formatNumber value="${classDTO.price * classDTO.quantity }" pattern="##,###,###" /></td>
								<c:set var="classSum" value="${classSum + (classDTO.price * classDTO.quantity) }" />
								<td><a href="${contextPath}/mypage/deleteCart.do?goods_code=${classDTO.goods_code}&mem_id=${classDTO.mem_id}&goods_type=class">삭제</td>
							</tr>
						</c:forEach>
					</c:if>	
					
					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><fmt:formatNumber value="${classSum }" pattern="##,###,###" /> 원</th>
						<th></th>
					</tr>
				</table>
				
				<table class="table table-hover">
					<tr><td colspan="5"><h3>취미용품 장바구니</h3></td></tr>
					<tr>
						<th width="60%">상품</th>
						<th width="10%">가격</th>
						<th width="10%">수량</th>
						<th width="10%">소계</th>
						<th width="10%">비고</th>
					</tr>
		
					<c:if test="${empty cartItemList}">
						<tr>
							<td colspan="5">장바구니에 담긴 클래스가 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${not empty cartItemList}">
						<c:forEach items="${cartItemList }" var="itemDTO">
							<tr>
								<td><a href="${contextPath}/item/itemDetail.do?item_code=${itemDTO.goods_code}">${itemDTO.item_name }</a></td>
								<td><fmt:formatNumber value="${itemDTO.price }" pattern="##,###,###" /></td>
								<td>${itemDTO.quantity }</td>
								<td><fmt:formatNumber value="${itemDTO.price * itemDTO.quantity }" pattern="##,###,###" /></td>
								<c:set var="itemSum" value="${itemSum + (itemDTO.price * itemDTO.quantity) }" />
								<td><a href="${contextPath}/mypage/deleteCart.do?goods_code=${itemDTO.goods_code}&mem_id=${itemDTO.mem_id}&goods_type=item">삭제</a></td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><fmt:formatNumber value="${itemSum }" pattern="##,###,###" /> 원</th>
						<th></th>
					</tr>
				</table>
				<a href="products.jsp" class="btn btn-secondary">&raquo; 쇼핑 계속하기</a>
			</div>
		</div>
	</section>
</body>
</html>