<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${contextPath}/resources/club/schedule.css" />

	<script type="text/javascript">
		function validateForm() {
			if($("#title2").val() == ""){
		        alert("제목을 입력하세요.");
		        $("#title2").focus();
		        return false;
		      }
			if($("#joincontent").val() == ""){
		        alert("가입인사를 작성해주세요.");
		        $("#joincontent").focus();
		        return false;
		      }
		}
	</script>

</head>
<body>
	<section>
	<h2>모임 가입</h2>
	<form method="post"  onsubmit="return validateForm()">
		<table>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" class="title2" style="width: 150px" id="name" />
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="title2" class="title2" style="width: 70%" placeholder="제목을 입력해주세요." />
					<select id="searchField">
							<option value="all">전체보기</option>
							<option value="content">자유글</option>
							<option value="review">정모후기</option>
							<option value="signup" selected>가입인사</option>
							<option value="notice">공지사항</option>
					</select>
				</td>
			</tr>
			<tr>
					<td>가입인사</td>
					<td>
						<input type="text" id="joincontent" class="title2" style="width: 70%" placeholder="가입인사를 작성해주세요.">
					</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="reset" class="btn01" onclick="location.href='clubInformation.jsp'">취소</button>
					<button type="submit" class="btn02">등록하기</button>
				</td>
			</tr>	
			
		</table>
		
	</form>
	</section>

</body>
</html>