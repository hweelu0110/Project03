<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="club_code" value="${param.club_code}" />
<c:set var="cate" value="${param.cate}" />
<c:set var="tit" value="${param.tit}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${path}/resources/css/club/board.css" />
	<script src="${path}/resources/ckeditor/ckeditor.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">	
		function validateForm(form) {
			if($("#title").val() == ""){
				alert("일정명을 입력하세요.")
	        	$("#title").focus()
	        	return false
	        }
			
			if($("#sdate").val() == ""){
		        alert("날짜를 입력하세요.")
		        return false
		    }
			
			if($("#stime").val() == ""){
		        alert("시간을 입력하세요.")
		        return false
		    }
			
			if($("#splace").val() == ""){
		        alert("장소 정보를 입력하세요.")
		        $("#splace").focus()
		        return false
		    }
			
			if($("#snum").val() == ""){
		        alert("일정 참여 인원수를 입력하세요.")
		        $("#snum").focus()
		        return false
		    }

		}
		
		function backToList(obj) {
			obj.action = "${path}/club_schedule/listSchedule.do?club_code=${club_code}&cate=${cate}&tit=${tit}"
			obj.submit()
		}		
	</script>
</head>

<body>
	<section>
		<div id="clubMenu">
			<ul>
				<li><a href="${path}/club/clubInfo.do?club_code=${club_code}">정보</a></li>
				<li><a href="${path}/club_schedule/listSchedule.do?club_code=${club_code}&cate=${cate}&tit=${tit}">일정</a></li>
				<li><a href="${path}/club_board/listArticles.do?club_code=${club_code}&cate=${cate}&tit=${tit}">게시판</a></li>
				<li><a href="${path}/club_album/albumList.do?club_code=${club_code}&cate=${cate}&tit=${tit}">사진첩</a></li>
			</ul>
		</div>
		<div id="clubTit">
			<img src="${path}/resources/img/hobby_img/${cate}.png" />
			<h2>${tit}</h2>
		</div>
		
		<div id="clubCont">
			<h3>일정 등록</h3>
			
			<form name="scheduleFrm" method="post" action="${path}/club_schedule/addNewSchedule.do?cate=${cate}&tit=${tit}" onsubmit="return validateForm(this)">
				<input type="hidden" name="club_code" value="${param.club_code}" />
				<input type="hidden" name="mem_id" value="${login.mem_id}" />
				
				<table id="boardFrm" style="border-bottom: none;">			
					<tr>
						<th>일정명</th>
						<td colspan="3">
							<input type="text" name="title" id="title" style="width: 70%" placeholder="일정 이름 또는 설명을 입력하세요." />							
						</td>
					</tr>
					
					<tr>
						<th>날짜</th>
						<td>
							<input type="date" name="sdate" id="sdate" />
						</td>
						<th>시간</th>
						<td>
							<input type="time" name="stime" id="stime" />
						</td>
					</tr>
					
					<tr>
						<th>장소</th>
						<td colspan="3">
							<input type="text" name="splace" id="splace" style="width: 70%" placeholder="장소를 입력하세요" />
						</td>
					</tr>
					
					<tr>
						<th>회비</th>
						<td>
							<input type="text" name="sprice" id="sprice" placeholder="식사비 15000원" />
						</td>
						<th>정원</th>
						<td>
							<input type="text" name="snum" id="snum" value="20" />
						</td>
					</tr>
					
					<tr>
						<td colspan="4" align="center">
							<button type="reset" class="basicBtn" onclick="backToList(this.form)">취소</button>
							<button type="submit" class="pointBtn" onclick="return validateForm(this.form)">등록하기</button>
						</td>
					</tr>						
				</table>	
							
			</form>
		
		</div>	
	</section>
</body>
</html>