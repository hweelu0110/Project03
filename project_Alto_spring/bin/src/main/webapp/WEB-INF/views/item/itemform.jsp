<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="../resources/css/class_main_style.css" rel="stylesheet" />
	<link href="../resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<title>ALTO - 취미용품 등록</title>
	<script>
		function categoryChange(e) {
			
			var _main_code = $('#cate_m').val();
			
			$.ajax({
				type: 'post',
				url: '${contextPath}/select/hobbysub.do',
				data: {main_code : _main_code},
				success: function(result){
				
				let str = JSON.stringify(result);
				
				var cate_s = "";
				for (var i = 0; i < result.length; i++) {
					cate_s += '<option value="' + result[i].SUB_CODE + '">' + result[i].SUB_NAME + '</option>';
				}
					
				$('#cate_s').html(cate_s);
					
				}
			})
		};
		
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
	<div class="container my-3" id="classbody">
	<form action="${contextPath }/item/addNewItem.do" name="item_fileForm" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
		<table class="table table-striped" style="border:none; margin-top: 150px">
			<thead>
				<tr class="table-dark">
					<th colspan="6"><h4><b>취미용품 등록하기</b></h4></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="20%"><b>상품명</b></td>
					<td colspan="2" width="40%">
						<input type="text" name="item_name" placeholder="상품명을 입력하세요">
					</td>
				</tr>
				<tr>
					<td width="20%"><b>취미</b></td>
					<td width="20%">
						<select name="cate_m" id="cate_m" onchange="categoryChange(this)">
							<option value="1">대분류를 선택해주세요</option>
							<c:forEach items="${hobbyList }" var="hobby">
						    	<option value="${hobby.hobby_code }" />${hobby.name }</option>
						    </c:forEach>
						</select>
					</td>
					<td width="20%">
						<select name="cate_s" id="cate_s">
						</select>
					</td>
				</tr>
				<tr>
					<td width="20%"><b>참여금액</b></td>
					<td colspan="2" width="40%">
						<input type="text" name="price" placeholder="금액을 입력하세요"> </td>
					</td>
				</tr>
				<tr>
					<td width="20%"><b>재고수</b></td>
					<td colspan="2" width="40%">
					<input type="text" name="quantity" placeholder="판매 가능 수량을 입력하세요">
					</td>
				</tr>
				<tr>
					<td><b>취미용품 소개</b></td>
					<td colspan="3">
					<textarea name="intro" placeholder="상품 설명을 작성해주세요"></textarea>
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
					<button type="submit" class="btn btn-warning"> 등록 </button>
					</td>
				</tr>
			</tbody>
		</table>	
	</form>
	</div>
</body>
</html>