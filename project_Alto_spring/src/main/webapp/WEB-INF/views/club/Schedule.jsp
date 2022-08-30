<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>일정등록</title>
	<link rel="stylesheet" href="${path}/resources/css/club/schedule.css" />
	<script type="text/javascript">
		function validateForm() {
			if($("#title2").val() == ""){
		        alert("제목을 입력하세요.");
		        $("#title2").focus();
		        return false;
		      }
			if($("#date").val() == ""){
		        alert("날짜를 입력하세요.");
		        $("#date").focus();
		        return false;
		      }
			if($("#time").val() == ""){
		        alert("시간을 입력하세요.");
		        $("#time").focus();
		        return false;
		      }
			if($("#location").val() == ""){
		        alert("장소를 입력하세요.");
		        $("#location").focus();
		        return false;
		      }
		}
	</script>
</head>
<body>

	<section>
	<h2>일정 등록</h2>
	<form method="post"  onsubmit="return validateForm()">
		<table>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" class="title" style="width: 150px" id="name" />
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="title2" class="title" style="width: 70%" placeholder="제목을 입력해주세요." />
				</td>
			</tr>
			<tr>
				<td>날짜/시간</td>
				<td>
					날짜 : <input type="date" id="date" class="title" />
					시간 : <input type="time" id="time" class="title"/>
				</td>
			</tr>
			<tr>
				<td>장소</td>
				<td>
					<div id="location">
						<span id="location2">장소를 입력해주세요.</span>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="reset" class="btn01" onclick="location.href='${paht}/club/clubInformation.do'">취소</button>
					<button type="submit" class="btn02">등록하기</button>
				</td>
			</tr>	
			
		</table>
		
	</form>
	</section>
	
</body>
</html>