<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="itemIf" value="${itemMap.itemDTO }" />
<c:set var="imageFileList" value="${itemMap.imageFileList }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="../resources/css/class_main_style.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<%@ include file="../layout/headinfo.jsp" %>
	<link rel="stylesheet" href="../resources/css/club.css">
	<title>ALTO - 취미용품 수정</title>
	<script>
		
		function validateForm(form) {
			if(form.itemName.value == ""){
				alert("상품명을 입력하세요.")
				form.itemName.focus();
				return false;
			}
			
			if(form.item_price.value == ""){
				alert("금액을 입력하세요.")
				form.item_price.focus();
				return false;
			}
			
			if(form.item_stock.value == ""){
				alert("판매 수량을 선택하세요.")
				form.item_stock.focus();
				return false;
			}
			
			if(form.item_info.value==""){
				alert("상품 소개를 입력하세요.")
				form.item_info.focus();
				return false;
			}
			
			if(form.isfile5.value == "" || form.isfile6.value == "" || form.isfile7.value == "" || form.isfile8.value == "" ){
				alert("첨부파일 선택은 총 4개가 선택되어야 합니다.")
				form.isfile1.focus();
				return false;
			}
		}
		
	</script>
</head>
<body>
	<%@ include file="../layout/header.jsp" %>
	
	<div class="container my-3">
	<form action="#" name="item_fileForm" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
		<table class="table table-striped" style="border:none; margin-top: 150px">
			<thead>
				<tr class="table-dark">
					<th colspan="6"><h4><b>취미용품 수정하기</b></h4></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="20%"><b>상품명 *</b></td>
					<td colspan="2" width="40%">
						<input type="hidden" name="class_code" value="${itemIf.item_code}"  />
						<input type="text" name="itemName" value="${itemIf.item_name }" disabled/>
					</td>
				</tr>
				<tr>
					<td width="20%"><b>취미 *</b></td>
					<td width="30%">
						<input type="text" value="${classIf.hobby_name}" disabled="disabled">
					</td>
					<td width="30%">
						<input type="text" value="${classIf.hobby_sub_name}" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td width="20%"><b>참여금액</b></td>
					<td colspan="2" width="40%">
						<input type="text" name="item_price" value="52,000원">
					</td>
				</tr>
				<tr>
					<td width="20%"><b>재고수</b></td>
					<td colspan="2" width="40%">
					<input type="text" name="item_stock" value="120개">
					</td>
				</tr>
				<tr>
					<td><b>취미용품 소개</b></td>
					<td colspan="3">
					<textarea name="item_info">홈트레이닝 셀프 필라테스 체형개선 밸런스 유지</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">상품소개 사진을 등록하세요 (필수입력 4개)</td>
				</tr>
				<tr>
					<td colspan="6">
					<input type="file" name="isfile5" accept="image/jpeg, image/png, image/jpg">
					<input type="file" name="isfile6" accept="image/jpeg, image/png, image/jpg">
					<input type="file" name="isfile7" accept="image/jpeg, image/png, image/jpg">
					<input type="file" name="isfile8" accept="image/jpeg, image/png, image/jpg">
					</td>
				</tr>
				<tr>
					<td colspan="6" align="right">
					<button type="reset" class="btn secondary"> 취소 </button>
					<button type="submit" class="btn btn-warning"> 수정 </button>
					</td>
				</tr>
			</tbody>
		</table>	
	</form>
	</div>
	<%@ include file="../layout/footer.jsp" %>
</body>
</html>