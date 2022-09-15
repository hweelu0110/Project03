<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<section>
	<div class="jumbotron">
		<div class="container">
			<h2 class="display-3" align="center" style="padding-top: 30px; padding-bottom: 15px;">주문이 완료되었습니다.</h2>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-warning" align="left">
			주문번호 : ${orderDTO.orderId }<br>
			주문일자 : ${orderDTO.orderDate }
		</h2>
	</div>
	<div class="container">
	</div>
	<div class="container">
		<p align="center">
			<a href="${contextPath }/main.do" class="btn btn-secondary">새로운 취미 둘러보기</a>
			<a href="${contextPath }/order/contractList.do" class="btn btn-secondary">주문내역 확인하기</a>
		</p>
	</div>
	</section>
</body>
</html>