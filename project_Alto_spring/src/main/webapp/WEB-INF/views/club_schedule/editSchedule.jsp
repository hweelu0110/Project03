<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="schedule" value="${scheduleMap.schedule }" />
<c:set var="club_code" value="${scheduleMap.schedule.club_code}"/>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="${path}/resources/css/club/schedule.css" />
	<script type="text/javascript">
		function backToList(obj) {
			obj.action = "${path}/club_schedule/listSchedule.do?club_code=${club_code}&cate=${cate}&tit=${tit}"
			obj.submit()
		}		
		
		//수정등록 버튼 클릭시 컨트롤러에게 수정 데이터를 전송 
		function fn_modify_schedule(obj) {
			obj.action = "${path}/club_schedule/modSchedule.do?club_code=${club_code}&cate=${cate}&tit=${tit}"
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
				<li><a href="${path}/club_schedule/listArticles.do?club_code=${club_code}&cate=${cate}&tit=${tit}">게시판</a></li>
				<li><a href="${path}/club_album/albumList.do?club_code=${club_code}&cate=${cate}&tit=${tit}">사진첩</a></li>
			</ul>
		</div>
		<div id="clubTit">
			<img src="${path}/resources/img/hobby_img/${cate}.png" />
			<h2>${tit}</h2>
		</div>
		
		<div id="clubCont">
			<h3>일정 수정</h3>
			
			<form action="#" name="frmschedule" method="post">
				<input type="hidden" name="schedule_code" id="schedule_code" value="${schedule.schedule_code}"/>
				<input type="hidden" name="club_code" id="club_code" value="${club_code}" />
				<table id="boardFrm">
					<thead>
						<tr>
							<th>일정명</th>
							<td colspan="3">
								<input type="text" name="title" id="title" style="width: 70%" value="${schedule.title}" placeholder="일정 이름 또는 설명을 입력하세요." />
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>날짜</th>
							<td>
								<input type="date" name="sdate" id="sdate" value="${schedule.sdate}" />
							</td>
							<th>시간</th>
							<td>
								<input type="time" name="stime" id="stime" value="${schedule.stime}" />
							</td>
						</tr>
						
						<tr>
							<th>장소</th>
							<td colspan="3">
								<input type="text" name="splace" id="splace" style="width: 70%" value="${schedule.splace}" placeholder="장소를 입력하세요" />
							</td>
						</tr>
						
						<tr>
							<th>회비</th>
							<td>
								<input type="text" name="sprice" id="sprice" value="${schedule.sprice}" placeholder="식사비 15000원" />
							</td>
							<th>정원</th>
							<td>
								<input type="text" name="snum" id="snum" value="${schedule.snum}" />
							</td>
						</tr>
					</tbody>				
							
				</table>
				
				<div id="tr_btn" class="align_right">
					<input type="button" class="pointBtn" value="수정등록" onclick="fn_modify_schedule(frmschedule)" />
					<input type="button" class="basicBtn" value="취소" onclick="backToList(frmschedule)" />
				</div>				
			</form>
		</div>		
		
	</section>
</body>
</html>