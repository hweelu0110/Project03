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
	<link href="${contextPath}/resources/css/class/class_main_style.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<title>ALTO - 클래스 개설</title>
	<script>
		function categoryChange(e) {
				
				/* console.log("테스트");
				alert("테스트"); */
				 
				var _main_code = $('#cate_m').val();
				
				/* alert(_main_code); */

				$.ajax({
					type: 'post',
					url: '${contextPath}/select/hobbysub.do',
					data: {main_code : _main_code},
					success: function(result){
					
					let str = JSON.stringify(result);
					/* alert('테스트');
					alert(str); */
					
					var cate_s = "";
					for (var i = 0; i < result.length; i++) {
						cate_s += '<option value="' + result[i].SUB_CODE + '">' + result[i].SUB_NAME + '</option>';
					}
						
					$('#cate_s').html(cate_s);
						
					}
				})
		};
	
	
		function validateForm(form) {
			if(form.className.value == ""){
				alert("클래스 이름을 입력하세요.")
				form.className.focus();
				return false;
			}
			
			if(form.stuNum.value == ""){
				alert("최대 인원을 입력하세요.")
				form.stuNum.focus();
				return false;
			} else if(form.stuNum.value > 101){
				alert("최대 인원은 100명입니다.")
				form.stuNum.focus();
				return false;
			}
			
			if(form.class_price.value == ""){
				alert("금액을 입력하세요.")
				form.class_price.focus();
				return false;
			}
			
			if(form.location.value == ""){
				alert("지역을 선택하세요.")
				form.location.focus();
				return false;
			}
			
			if(form.startdate.value == ""){
				alert("시작일을 선택하세요.")
				form.startdate.focus();
				return false;
			}
			
			if(form.enddate.value == ""){
				alert("종료일을 선택하세요.")
				form.enddate.focus();
				return false;
			}
			
			if(form.class_info.value==""){
				alert("강의 소개를 입력하세요.")
				form.class_info.focus();
				return false;
			}
			
			if(form.class_curri.value==""){
				alert("커리큘럼을 입력하세요.")
				form.class_curri.focus();
				return false;
			}
			
			if(form.tc_info.value==""){
				alert("강사 소개를 입력하세요.")
				form.tc_info.focus();
				return false;
			}
			
			if(form.isfile1.value == "" || form.isfile2.value == "" || form.isfile3.value == "" || form.isfile4.value == "" ){
				alert("첨부파일 선택은 총 4개가 선택되어야 합니다.")
				form.isfile1.focus();
				return false;
			}
		}
	</script>
</head>
<body>
	<div class="container my-3" id="classbody">
	<form action="${contextPath }/class/addNewClass.do" name="class_fileForm" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
		<table class="table table-striped" style="border:none; margin-top: 150px">
			<thead>
				<tr class="table-dark">
					<th colspan="6"><h4><b>클래스 추가하기</b></h4></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="10%"><b>클래스명</b></td>
					<td colspan="2" width="40%">
						<input type="text" name="className" placeholder="클래스명을 입력하세요" />
					</td>
					<td width="10%"><b>참여인원</b></td>
					<td colspan="2" width="40%">
						<input type="text" name="member_max" placeholder="최대 인원은 100명입니다." />
					</td>
				</tr>
				<tr>
					<td width="10%"><b>개설자</b></td>
					<td colspan="2" width="40%">
						<input type="text" name="manager" value="${mem_id }" readonly="readonly" />
					</td>
					<td width="10%"><b>참여금액</b></td>
					<td colspan="2" width="40%">
						<input type="text" name="price" placeholder="금액을 입력하세요" /> </td>
					</td>
				</tr>
				<tr>
					<td width="10%"><b>지역</b></td>
					<td colspan="2" width="40%">
						<select name="area_code">
						    <option value="">지역을 선택하세요</option>
						    <c:forEach items="${areaList }" var="area">
						    	<option value="${area.area_code }" />${area.name }</option>
						    </c:forEach>
						</select>
					</td>
					<td width="10%"><b>취미</b></td>
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
							<!-- <option>소분류를 선택해주세요</option> -->
						</select>
					</td>
				</tr>
				<tr>
					<td width="10%"><b>시작일</b></td>
					<td colspan="2" width="40%"><input type="date" name="startdate"> </td>
					<td width="10%"><b>종료일</b></td>
					<td colspan="2" width="40%"><input type="date" name="enddate"> </td>
				</tr>
				<tr>
					<td colspan="6"><b>강의 소개</b></td>
				</tr>
				<tr>
					<td colspan="6">
					<textarea name="intro" placeholder="상세 클래스 설명을 작성해주세요"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="6"><b>커리큘럼 소개</b></td>
				</tr>
				<tr>
					<td colspan="6">
					<textarea name="curriculum" placeholder="클래스 커리큘럼을 작성해주세요"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="6"><b>강사 소개</b></td>
				</tr>
				<tr>
					<td colspan="6">
					<textarea name="teacherInfo" placeholder="강사 소개를 작성해주세요"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="6">강의소개 사진을 등록하세요 (필수입력 4개)</td>
				<tr>
				<tr>
					<td colspan="6">
					<input type="file" name="isfile1" accept="image/jpeg, image/png, image/jpg">
					<input type="file" name="isfile2" accept="image/jpeg, image/png, image/jpg">
					<input type="file" name="isfile3" accept="image/jpeg, image/png, image/jpg">
					<input type="file" name="isfile4" accept="image/jpeg, image/png, image/jpg">
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