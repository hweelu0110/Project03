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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<%@include file="../../../layout/headinfo.jsp" %>
	<link rel="stylesheet" href="../resources/css/member.css" />		
	<script type="text/javascript">
		$(function() {
			$("#hobby_list ul li").click(function() {
				if($(this).hasClass("select")) {
					$(this).children(".select").css("display","none")					
					$(this).removeClass("select")					
				} else {
					if ($(this).siblings(".select").length < 5) {
						$(this).toggleClass("select")
						$(this).children(".select").css("display","block")
					}else {
						confirmPopup($("#confirm_popup"),"관심 취미는 최대 5개 까지 선택 가능합니다.")
					}
				}				
			})
			
		})
	</script>	
</head>
<body>
	<%@include file="../../../layout/header.jsp" %>
	
	<section>
		<div id="member_div" class="member_info">
			<h2>내 취미 설정</h2>
			<form method="post" action="${path}/member/.do">
				<div class="memSection memInfo">					
					<div id="hobby_list">
						<ul>
							<c:forEach var="hobby" items="${hobbyList }">
								<li>
									<img class="select" src="../resources/img/hobby_img/h_select.png" />
									<img src="../resources/img/hobby_img/${hobby.hobby_code }.png" />
									<p class="hobby_name">${hobby.name }</p>
								</li>								
							</c:forEach>							
						</ul>
					</div>								
				</div>
				<button type="submit" class="pointBtn size0">다음</button>		
			</form>
		</div>
	</section>
	
	<%@include file="../../../layout/common_popup.jsp" %>
	<%@include file="../../../layout/footer.jsp" %>
</body>
</html>