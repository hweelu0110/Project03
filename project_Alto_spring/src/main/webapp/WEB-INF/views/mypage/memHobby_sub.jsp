<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="chkSub" value="${hobbysublist.chkHobbysubList}" />
<c:set var="mySub" value="${hobbysublist.myHobbysubList}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">	
	<link rel="stylesheet" href="${path}/resources/css/member.css" />		
	<script type="text/javascript">		
		$(function() {
			$("#hobby_list div.sub_hobby").click(function() {	
				
				let cate = $(this).attr("class")
				let cnt = $(this).siblings(".sub_hobby").length
				let selectCnt = 0
				
				for(let i=0; i<=cnt;i++) {
					let ele = $("#hobby_list div.sub_hobby:eq("+i+")")
					if(ele.attr("class") == (cate+" select")) {
						++selectCnt
					}
				}
				
				if(selectCnt < 5) {
					$(this).toggleClass("select")
				}else {
					confirmPopup($("#confirm_popup"),"소분류 취미는 최대 5개 까지 선택 가능합니다.")
				}								
			})			
		})
	</script>	
</head>
<body>
	
	<section>
		<div id="member_div" class="member_info">
			<h2>내 취미 설정</h2>
			<form name="hobbyFrm" method="post" action="${path}/member/memHobby_sub.do" onsubmit="return sendHobbyList()">
				<input type="hidden" name="hobbyCodeList" />
				<div class="memSection memInfo">					
					<div id="hobby_list">
						<c:set var="mainCode" value=" " />
						<c:forEach var="subcode" items="${chkSub}" varStatus="status">
							<c:forEach var="mycode" items="${mySub}">
								<c:if test="${mycode.hobby_code eq subcode.SUB_CODE}">
									<c:set var="in" value="true" />
								</c:if>									
							</c:forEach>
							
							<c:choose>
								<c:when test="${in}">
									<c:choose>								
										<c:when test="${mainCode == subcode.MAIN_CODE}">									
											<div class="sub_hobby ${subcode.MAIN_CODE} select">
												<input type="hidden" name="sub_code${status.index}" value="${subcode.SUB_CODE}" />
												<p>${subcode.SUB_NAME}</p>	
											</div>
											<c:set var="in" value="false" />
										</c:when>
										<c:otherwise>
											<p class="main_hobby">
												<input type="hidden" name="main_code${status.index}" value="${subcode.MAIN_CODE}" />
												<img src="../resources/img/hobby_img/${subcode.MAIN_CODE}.png" />
												${subcode.MAIN_NAME}
											</p>
											<c:set var="mainCode" value="${subcode.MAIN_CODE}" />
											<div class="sub_hobby ${subcode.MAIN_CODE} select">
												<input type="hidden" name="sub_code${status.index}" value="${subcode.SUB_CODE}" />
												<p>${subcode.SUB_NAME}</p>	
											</div>
											<c:set var="in" value="false" />										
										</c:otherwise>
									</c:choose>
								</c:when>
								
								<c:otherwise>
									<c:choose>								
										<c:when test="${mainCode == subcode.MAIN_CODE}">									
											<div class="sub_hobby ${subcode.MAIN_CODE}">
												<input type="hidden" name="sub_code${status.index}" value="${subcode.SUB_CODE}" />
												<p>${subcode.SUB_NAME}</p>	
											</div>
										</c:when>
										<c:otherwise>
											<p class="main_hobby">
												<input type="hidden" name="main_code${status.index}" value="${subcode.MAIN_CODE}" />
												<img src="../resources/img/hobby_img/${subcode.MAIN_CODE}.png" />
												${subcode.MAIN_NAME}
											</p>
											<c:set var="mainCode" value="${subcode.MAIN_CODE}" />
											<div class="sub_hobby ${subcode.MAIN_CODE}">
												<input type="hidden" name="sub_code${status.index}" value="${subcode.SUB_CODE}" />
												<p>${subcode.SUB_NAME}</p>	
											</div>										
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							
						</c:forEach>
					</div>								
				</div>
				<button type="submit" class="pointBtn size0">다음</button>		
			</form>
		</div>
	</section>
	
	<%@include file="../layout/common_popup.jsp" %>
</body>
</html>