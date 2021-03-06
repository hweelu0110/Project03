<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">		
	<link rel="stylesheet" href="${path}/resources/css/member.css" />	
	<script src="${path}/resources/js/essential-textbox.js"></script>	
	<script type="text/javascript">
		
		$(function() {
			
			$("#area_list ul li").click(function() {
				if ($(this).siblings(".select").length < 3) {
					$(this).toggleClass("select")
					let checked = $(this).find("input:checkbox").is(":checked")
					$(this).find("input:checkbox").prop('checked',!checked)
				}else {
					confirmPopup($("#confirm_popup"),"활동지역은 최대 3개 까지 선택 가능합니다.")
					$(this).find("input:checkbox").prop('checked',false)
				}
			})
			
			$("#area_list ul li label").click(function() {
				if ($(this).parent().siblings(".select").length < 3) {
					$(this).parent().toggleClass("select")
					let checked = $(this).find("input:checkbox").is(":checked")
					$(this).find("input:checkbox").prop('checked',!checked)
				}else {
					confirmPopup($("#confirm_popup"),"활동지역은 최대 3개 까지 선택 가능합니다.")
					$(this).find("input:checkbox").prop('checked',false)
				}
			})
			
			$(".form-check-input").click(function() {
				if ($(this).parent().siblings(".select").length < 3) {
					let checked = $(this).is(":checked")
					$(this).prop('checked',!checked)
				}else {
					$(this).prop('checked',false)
				}
			})
		})
	</script>	
</head>
<body>
	
	<section>
		<div id="member_div" class="member_info">
			<h2>내 지역 설정</h2>
			<form method="post" action="${path}/member/.do">
				<div class="memSection memInfo form-check">					
					<div id="area_list">
						<ul>
							<c:forEach var="area" items="${areaList }">
								<li>
									<input class="form-check-input" type="checkbox" value="${area.area_code }" id="${area.area_code }">
									<label class="form-check-label" for="${area.area_code }">
									   	${area.name }
									</label>
								</li>
							</c:forEach>							
						</ul>
					</div>								
				</div>
				<button type="submit" class="pointBtn size0">선택 완료</button>		
			</form>
		</div>
	</section>
	
	<%@include file="../layout/common_popup.jsp" %>
</body>
</html>