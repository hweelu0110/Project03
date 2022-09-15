<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<c:set var="contextPath" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<link rel="stylesheet" href="${contextPath }/resources/css/class/list.css" /> 	
	<link rel="stylesheet" href="${contextPath }/resources/css/class/club.css" /> 
	<link href="${contextPath}/resources/css/class/class_main_sl.css?after_new" rel="stylesheet" />
	<script src="${contextPath}/resources/js/search_tabmenu.js"></script>
	<script type="text/javascript">
		$(function() {
			/* 클럽개설 버튼 팝업 */
			$("#open_btn").mouseover(function() {
				$("div.info_div").show()
			})
			$("#open_btn").mouseout(function() {
				$("div.info_div").hide()
			})
			$("#open_btn").click(function() {
				location.href = '${contextPath}/item/itemform.do'
			})
		})
		
		
		function sendSearchList() {
			
			let h_cnt = $("#m_cate ul li.select").length
			let hobbycodeList = Array(h_cnt)
			
			for(i=0; i<h_cnt; i++) {
				let hobby_code = $("#m_cate ul li.select:eq("+i+")").children("img:eq(0)").attr("src")
					
				console.log(hobby_code)
				if(hobby_code !== undefined){
					hobby_code = hobby_code.substring(0, hobby_code.lastIndexOf("."))
					hobby_code = hobby_code.substring((hobby_code.lastIndexOf("/")+1), hobby_code.length)
					hobbycodeList[i] = hobby_code
				}
			}
			searchList.hobbyCodeList.value = hobbycodeList
		}
		
	</script>
</head>
<body>
	
	<!-- CONTENTS -->
	<section>
		<ul id="tab_menu">
			<li><span>전체 취미</span></li>
		</ul>
		
		<div id="tab_area">
		<form action="${contextPath}/item/listItem.do" name="searchList"  onclick="return sendSearchList()" >
			<input type="hidden" name="hobbyCodeList" />
			<div id="m_cate">
				<ul>
					<li id="m_cate_all" class="all">전체</li>
					<c:forEach items="${hobbyList }" var="hobby">
						<li>
							<img src="../resources/img/hobby_img/${hobby.hobby_code }.png" />
							<p class="hobby_name">${hobby.name }</p>
						</li>
					</c:forEach>
				</ul>
			</div>
			<button type="submit" id="opSearch_btn">선택 조건으로 검색</button>
		</form>
		</div>
		
		<div id="selectBoxArea">
			<div class="selectBox">Best순</div>
			<div class="selectBox select_list">
				<ul>
					<li><a href="${contextPath }/item/listItem.do??sort=new&hobbyC=${listMap.hobbyC }">최신순</a></li>
					<li><a href="${contextPath }/item/listItem.do?sort=old&hobbyC=${listMap.hobbyC }">오래된순</a></li>
					<li><a href="${contextPath }/item/listItem.do?sort=quantityL&hobbyC=${listMap.hobbyC }">재고순</a></li>
					<li><a href="${contextPath }/item/listItem.do?sort=quantityS&hobbyC=${listMap.hobbyC }">판매인기순</a></li>
				</ul>
			</div>
		</div>
		
		
		<div id="search_result">
			<h2>취미용품 검색 결과</h2>
			<div class="searchList">
				<ul class="club">
					<c:choose>
						<c:when test="${empty itemList }">
							<tr height="10">
								<td colspan="4"><p><span style="font-size: 9pt;">등록된 취미용품이 없습니다.</span></p></td>
							</tr>
						</c:when>
						
						<c:when test="${!empty itemList }">
							<c:forEach var="itemList" items="${itemList }">
								<li>
									<a href="${contextPath}/item/itemDetail.do?item_code=${itemList.item_code}">
									<img class="class_products_img" src="${contextPath}/download.do?imgName=${itemList.imgName}&item_code=${itemList.item_code}" />
									<span class="hobby_icon"><img src="../resources/img/hobby_img/${itemList.hobby_code }.png" /></span>
									<p class="club_name">${itemList.item_name }</p>
									<span class="memNum" style="font-size: 11px">${itemList.quantity }  개</span>
									<p class="club_schedule">
										<span class="s_icon2"></span><span><fmt:formatNumber value="${itemList.price}" pattern="#,###" /> 원</span>
									</p>
									<span class="like_icon">관심</span>
									</a>
								</li>
							</c:forEach>
						</c:when>
					</c:choose>
					<!-- 
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					<li>
						<img class="class_products_img" src="../resources/img/club_test.png" />
						<span class="area">성동구</span>
						<span class="hobby_icon"><img src="../resources/img/hobby_img/hm000001.png" /></span>
						<p class="club_name">미니어처의 세계미니어처의 세계미니어처의 세계</p>
						<span class="memNum">50명</span>
						<p class="club_schedule">
							<span class="s_icon2"></span><span>B1 자수공방자수공방</span>
						</p>
						<span class="like_icon">관심</span>
					</li>
					 -->
				</ul>
			</div>
			
		</div>
		
		<div class="info_div">
			<p>원하는 상품을 찾지 못하셨나요?</p>
			<span class="p_color">등록할 상품을 추가로 입력하세요!</span>
		</div>
		<div id="open_btn"></div>		
	</section>
</body>
</html>