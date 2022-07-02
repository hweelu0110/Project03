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
	<title>ALTO - 클래스 개설</title>
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
	</script>
</head>
<body>
	<%@ include file="../header.jsp" %>
	
	<div class="container my-3">
	<form id="class_form1" name="class_form1" enctype="multipart/form-data" method="post">
		<table class="table table-striped" style="border:none; margin-top: 150px">
			<thead>
				<tr class="table-dark">
					<th colspan="6"><h4><b>클래스 수정하기</b></h4></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="10%"><b>클래스명</b></td>
					<td colspan="2" width="40%">
						<input type="text" name="className" id="className" value="입문 쿠키 베이킹 클래스">
					</td>
					<td width="10%"><b>참여인원</b></td>
					<td colspan="2" width="40%">
						<input type="text" name="stuNum" id="stuNum" value="30명">
					</td>
				</tr>
				<tr>
					<td width="10%"><b>개설자</b></td>
					<td colspan="2" width="40%">
						<input type="text" name="class_userName" id="class_userName" value="admin" disabled>
					</td>
					<td width="10%"><b>참여금액</b></td>
					<td colspan="2" width="40%">
						<input type="text" name="class_price" id="class_price" value="50,000원"> </td>
					</td>
				</tr>
				<tr>
					<td width="10%"><b>지역</b></td>
					<td colspan="2" width="40%">
						<select name="location">
						    <option value="">지역을 선택하세요</option>
						    <optgroup label="온라인">
						    	<option value="온라인">온라인</option>
						    </optgroup>
						    <optgroup label="오프라인">
							    <option value="종로구">서울시 종로구</option>
							    <option value="중구">서울시 중구</option>
							    <option value="종로구">서울시 용산구</option>
							    <option value="중구">서울시 성동구</option>
							    <option value="종로구">서울시 종로구</option>
							    <option value="중구">서울시 중구</option>
							    <option value="광진구" selected="selected">서울시 광진구</option>
							    <option value="동대문구">서울시 동대문구</option>
							    <option value="중랑구">서울시 중랑구</option>
							    <option value="성북구">서울시 성북구</option>
							    <option value="강북구">서울시 강북구</option>
							    <option value="도봉구">서울시 도봉구</option>
							    <option value="노원구">서울시 노원구</option>
							    <option value="은평구">서울시 은평구</option>
							    <option value="서대문구">서울시 서대문구</option>
							    <option value="마포구">서울시 마포구</option>
							    <option value="양천구">서울시 양천구</option>
							    <option value="강서구">서울시 강서구</option>
							    <option value="구로구">서울시 구로구</option>
							    <option value="금천구">서울시 금천구</option>
							    <option value="영등포구">서울시 영등포구</option>
							    <option value="동작구">서울시 동작구</option>
							    <option value="관악구">서울시 관악구</option>
							    <option value="서초구">서울시 서초구</option>
							    <option value="강남구">서울시 강남구</option>
							    <option value="송파구">서울시 송파구</option>
							    <option value="강동구">서울시 강동구</option>
						    </optgroup>
						</select>
					</td>
					<td width="10%"><b>취미</b></td>
					<td width="20%">
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
					<td width="20%">
						<select id="good">
							<option>소분류를 선택해주세요</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="10%"><b>시작일</b></td>
					<td colspan="2" width="40%"><input type="date" value="2022-03-16"> </td>
					<td width="10%"><b>종료일</b></td>
					<td colspan="2" width="40%"><input type="date" value="2022-08-24"> </td>
				</tr>
				<tr>
					<td colspan="6"><b>강의 소개</b></td>
				</tr>
				<tr>
					<td colspan="6">
					<textarea>
아이들과 함께 즐길 수 있는 홈베이킹 클래스입니다.
난이도는 초급이며 도구의 사용 등을 보조해줄 어른이 동반되어야 합니다.
준비물은..
					</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="6"><b>커리큘럼 소개</b></td>
				</tr>
				<tr>
					<td colspan="6">
					<textarea>
01주 탄탄한 기본, 맛있는 쿠키 반죽 만들기
02주 아이스 작업판 만들기, 아몬드가루 로스팅하기
03주 핸드믹서로 만들어보는 기본 반죽법
04주 반죽기로 만들어보는 대용량 반죽법
05주 판 반죽 밀어보기
					</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="6"><b>강사 소개</b></td>
				</tr>
				<tr>
					<td colspan="6">
					<textarea>
정선애강사
숙명여대 식품영양학 전공
제과기능사, 한식,양식,일식,중식,조리사, 영양사, 떡숙수 등 자격보유
					</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="6">강의소개 사진을 등록하세요 (필수입력 4개)</td>
				<tr>
				<tr>
					<td colspan="6">
					<input type="file">
					<input type="file">
					<input type="file">
					<input type="file">
					</td>
				</tr>
				<tr>
					<td colspan="6" align="right">
					<button type="reset" class="btn secondary"> 취소 </button>
					<button type="button" class="btn btn-warning"> 수정 </button>
					</td>
				</tr>
			</tbody>
		</table>	
	</form>
	</div>
	<%@ include file="../footer.jsp" %>
</body>
</html>