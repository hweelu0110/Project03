<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 	isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="classDTO"  value="${classMap.classDTO}"  />
<c:set var="imageList"  value="${classMap.imageList }"  />
<%
     //치환 변수 선언
      //pageContext.setAttribute("crcn", "\r\n"); //개행문자
      pageContext.setAttribute("crcn" , "\n"); //Ajax로 변경 시 개행 문자 
      pageContext.setAttribute("br", "<br/>"); //br 태그
%>  
<html>
<head>
	<link href="${contextPath}/resources/css/class/class_main_style.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath }/resources/css/class/class_detail.css" /> 
	<style>
	#layer {
		z-index: 2;
		position: absolute;
		top: 0px;
		left: 0px;
		width: 100%;
	}
	
	#popup {
		z-index: 3;
		position: fixed;
		text-align: center;
		left: 50%;
		top: 45%;
		width: 300px;
		height: 200px;
		background-color: #ccffff;
		border: 3px solid #87cb42;
	}
	
	#close {
		z-index: 4;
		float: right;
	}
	</style>
	<script type="text/javascript">
		
	$(document).ready(function() {

		//When page loads...
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content

		//On Click Event
		$("ul.tabs li").click(function() {

			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});

	});
	</script>
</head>
<body>
	<section>
		<hgroup>
			<h1>${classDTO.hobby_name}</h1>
			<h2>${classDTO.hobby_name} > ${classDTO.hobby_sub_name}</h2>
			<h3>${classDTO.className}</h3>
			<h4>고유번호 # ${classDTO.class_code}</h4>
		</hgroup>
		<div id="goods_image">
			<figure>
				<img src="${contextPath}/download.do?imgName=${classDTO.imgName}&class_code=${classDTO.class_code}">
			</figure>
		</div>
		<div id="detail_table">
			<table>
				<tbody>
					<tr>
						<td class="fixed">지역</td>
						<td class="active"><span >
					         ${classDTO.area_name}
					       </span></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed">수강료</td>
						<td class="active"><span >
						   <fmt:formatNumber  value="${classDTO.price}" type="number" var="class_price" />
					         ${classDTO.price}
					       </span></td>
					</tr>
					<tr>
						<td class="fixed">개설자</td>
						<td class="active">${classDTO.manager}</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed">등록일</td>
						<td class="fixed">${classDTO.regidate}</td>
					</tr>
					<tr>
						<td class="fixed">시작일</td>
						<td class="fixed">
						   ${classDTO.startdate}
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed">종료일</td>
						<td class="fixed">
						   ${classDTO.enddate}
						</td>
					</tr>
					<tr>
						<td class="fixed">클래스 원</td>
						<td class="fixed"><strong>${classDTO.member_max} 인</strong></td>
					</tr>
					<tr>
						<td class="fixed">수강 인원</td>
						<td class="fixed"><strong>${classDTO.member_num} 인</strong></td>
					</tr>
					<tr>
						<td class="fixed">신청 인원</td>
						<td class="fixed">
				      <select style="width: 60px;" id="order_goods_qty">
					      <option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
				     </select>
						 </td>
					</tr>
				</tbody>
			</table>
			<div align="right" style="margin-top: 10px">
			<button type="submit" class="btn btn-warning">구매하기 </button>
			<button type="reset" class="btn secondary">장바구니</button>
			</div>
		</div>
		<div class="clear" ></div>
		<!-- 내용 들어 가는 곳 -->
		<div id="container">
			<ul class="tabs">
				<li><a href="#tab1">강의 소개</a></li>
				<li><a href="#tab2">강사 소개</a></li>
				<li><a href="#tab3">커리큘럼</a></li>
				<li><a href="#tab4">Q&A</a></li>
				<li><a href="#tab6">리뷰</a></li>
			</ul>
			<div class="tab_container">
				<div class="tab_content" id="tab1">
					<h4>${classDTO.intro}</h4>
					<p>${classDTO.intro}</p>
				</div>
				<div class="tab_content" id="tab2">
					<h4>강사 소개</h4>
					<p>${classDTO.teacherInfo}</p> 
				</div>
				<div class="tab_content" id="tab3">
					<h4>커리큘럼</h4>
					<p>${classDTO.curriculum}</p> 
				</div>
				<div class="tab_content" id="tab4">
					<h4>Q&A</h4>
					 <div class="writer">환불 정책</div>
					 <p>아직 수강이 시작되지 않은 클래스는 7일 전까지 전액 환불 가능합니다. 개강까지 7일 미만의 경우 개설자와의 협의를 통해 취소 진행이 가능합니다. </p>
					 <p>이미 수강이 시작 된 경우 환불이 불가능하오니 이 점 유의 바랍니다.</p>
					 <div class="writer">수강 문의</div>
					 <p>온라인 클래스의 경우 결제 후 개설자와 협의 된 클래스 시간에 PC를 통해 수강이 가능합니다.</p>
					 <p>오프라인 클래스의 경우 결제 후 개설자의 안내에 따라 오프라인 모임을 진행하게 됩니다.</p>
					 <div class="writer">수강 신청</div>
					 <p>회원가입을 진행해 필요 정보를 등록한 회원에 한해 수강이 가능합니다.</p>
					 <p>회원가입은 상단 [회원가입]을 선택하여 진행해주시면 됩니다.</p>
				</div>
				<div class="tab_content" id="tab5">
					<h4>추천사</h4>
					<p>추천사</p>
				</div>
				<div class="tab_content" id="tab6">
					<h4>리뷰</h4>
				</div>
			</div>
		</div>
	</section>		
</body>
</html>