<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
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
					<tr><td><h3>클래스 장바구니</h3></td></tr>
					<tr>
						<th>상품</th>
						<th>가격</th>
						<th>수량</th>
						<th>소계</th>
						<th>비고</th>
					</tr>
					<c:if test="${empty cartClassList}">
								장바구니에 담긴 클래스가 없습니다
					</c:if>
					<c:if test="${not empty cartClassList}">
						<c:forEach items="${cartClassList }" var="classDTO">
							<tr>
								<td>${classDTO.className }</td>
								<td>${classDTO.price }</td>
								<td>${classDTO.quantity }</td>
								<td>${classDTO.price * classDTO.quantity }</td>
								<c:set var="classSum" value="${classSum + (classDTO.price * classDTO.quantity) }" />
								<td>삭제</td>
							</tr>
						</c:forEach>
					</c:if>	
					
					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th>${classSum }</th>
						<th></th>
					</tr>
				</table>
				
				<table class="table table-hover">
					<tr><td><h3>취미용품 장바구니</h3></td></tr>
					<tr>
						<th>상품</th>
						<th>가격</th>
						<th>수량</th>
						<th>소계</th>
						<th>비고</th>
					</tr>
		
					<c:if test="${empty cartItemList}">
								장바구니에 담긴 클래스가 없습니다
					</c:if>
					<c:if test="${not empty cartItemList}">
						<c:forEach items="${cartItemList }" var="itemDTO">
							<tr>
								<td>${itemDTO.item_name }</td>
								<td>${itemDTO.price }</td>
								<td>${itemDTO.quantity }</td>
								<td>${itemDTO.price * itemDTO.quantity }</td>
								<c:set var="itemSum" value="${itemSum + (itemDTO.price * itemDTO.quantity) }" />
								<td>삭제</td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th>${itemSum }</th>
						<th></th>
					</tr>
				</table>
				<a href="products.jsp" class="btn btn-secondary">&raquo; 쇼핑 계속하기</a>
			</div>
		</div>
	</section>
</body>
</html>