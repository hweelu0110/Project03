<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="../css/class_main_style.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<%@ include file="../headinfo.jsp" %>
	<link rel="stylesheet" href="../css/club.css">
	<title>ALTO - 취미용품 등록</title>
	<script>
		function categoryChange(e) {
			var good_a = ["드로잉", "공예", "DIY"];
			var good_b = ["자전거", "다이어트", "헬스", "요가/필라테스", "러닝", "댄스", "골프", "당구", "볼링", "낚시", "무술", "축구", "농구"];
			var good_c = ["등산", "캠핑", "낚시"];
			var good_d = ["한식", "중식", "일식", "양식", "베이킹", "와인", "커피/티", "주류"];
			var good_e = ["온라인게임", "보드게임"];
			var target = document.getElementById("good");
		
			if(e.value == "a") var d = good_a;
			else if(e.value == "b") var d = good_b;
			else if(e.value == "c") var d = good_c;
			else if(e.value == "d") var d = good_d;
			else if(e.value == "e") var d = good_e;
		
			target.options.length = 0;
		
			for (x in d) {
				var opt = document.createElement("option");
				opt.value = d[x];
				opt.innerHTML = d[x];
				target.appendChild(opt);
			}
		}
		
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
	<%@ include file="../header.jsp" %>
	
	<div class="container my-3">
	<form action="#" name="item_fileForm" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
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
						<input type="text" name="itemName" placeholder="상품명을 입력하세요">
					</td>
				</tr>
				<tr>
					<td width="20%"><b>취미</b></td>
					<td width="30%">
						<select onchange="categoryChange(this)">
							<option>대분류를 선택하세요</option>
							<option value="a">창작</option>
							<option value="b">액티비티</option>
							<option value="c">아웃도어</option>
							<option value="d">요리</option>
							<option value="e">게임</option>
							<option value="f">음악</option>
							<option value="g">문화</option>
							<option value="h">여행</option>
							<option value="i">봉사</option>
							<option value="j">사진/영상</option>
							<option value="k">직무/커리어</option>
						</select>
					</td>
					<td width="30%">
						<select id="good">
							<option>소분류를 선택해주세요</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="20%"><b>참여금액</b></td>
					<td colspan="2" width="40%">
						<input type="text" name="item_price" placeholder="금액을 입력하세요"> </td>
					</td>
				</tr>
				<tr>
					<td width="20%"><b>재고수</b></td>
					<td colspan="2" width="40%">
					<input type="text" name="item_stock" placeholder="판매 가능 수량을 입력하세요">
					</td>
				</tr>
				<tr>
					<td><b>취미용품 소개</b></td>
					<td colspan="3">
					<textarea name="item_info">상품 설명을 작성해주세요</textarea>
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
	<%@ include file="../footer.jsp" %>
</body>
</html>