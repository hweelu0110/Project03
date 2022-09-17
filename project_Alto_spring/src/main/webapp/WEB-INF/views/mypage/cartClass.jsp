<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<c:set var="contextPath" value="${pageContext.request.contextPath}" />  
<c:set var="cartClassList"  value="${cartMainMap.cartClassList}"  />
<c:set var="cartItemList"  value="${cartMainMap.cartItemList}"  />
<c:set var="classSum" value="0" />
<c:set var="itemSum" value="0" />
<c:set var="hobbyList" value="${mylikeMap.hobbyList}" />
<c:set var="areaList" value="${mylikeMap.areaList}" />
<c:set var="likeList" value="${mylikeMap.memlikeList}" />
<c:set var="clubList" value="${mylikeMap.clubList}" />
<c:set var="classList" value="${mylikeMap.classList}" />
<c:set var="itemList" value="${mylikeMap.itemList}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<link rel="stylesheet" href="${contextPath }/resources/css/common/list.css" />	
	<link rel="stylesheet" href="${contextPath }/resources/css/mypage.css" />	
	<script type="text/javascript">
			
		$(document).ready(function(){
				
				setTotalInfo();
				
				$(".individual_cart_checkbox").on("change", function(){
					setTotalInfo($(".cart_info_td"));
				});
				
				$(".class_all_check_input").on("click", function(){
					if($(".class_all_check_input").prop("checked")){
						$(".individual_class_cart_checkbox").prop("checked", true);
					} else{
						$(".individual_class_cart_checkbox").prop("checked", false);
					}
					setTotalInfo($(".cart_info_td"));	
				});
				
				$(".item_all_check_input").on("click", function(){
					if($(".item_all_check_input").prop("checked")){
						$(".individual_item_cart_checkbox").prop("checked", true);
					} else{
						$(".individual_item_cart_checkbox").prop("checked", false);
					}
					setTotalInfo($(".cart_info_td"));	
				});
				
				$(".order_btn").on("click", function(){
					let form_contents ='';
					let orderNumber = 0;
					
					$(".cart_info_td").each(function(index, element){
						
						if($(element).find(".individual_cart_checkbox").is(":checked") === true){
							let goods_type = $(element).find(".individual_goodsType_input").val();
							let goods_code = $(element).find(".individual_goodsCode_input").val();
							let quantity = $(element).find(".individual_goodsCount_input").val();
							
							let goods_type_input = "<input name='orders[" + orderNumber + "].goods_type' type='hidden' value='" + goods_type + "'>";
							form_contents += goods_type_input;
							
							let goods_code_input = "<input name='orders[" + orderNumber + "].goods_code' type='hidden' value='" + goods_code + "'>";
							form_contents += goods_code_input;
							
							let quantity_input = "<input name='orders[" + orderNumber + "].quantity' type='hidden' value='" + quantity + "'>";
							form_contents += quantity_input;
							
							orderNumber += 1;
						}
						
					});
					
					$(".order_form").html(form_contents);
					$(".order_form").submit();
				});
				
			});
			
			function setTotalInfo(){
				let totalPrice = 0;
				let totalCount = 0;
				let totalKind = 0;
		
				$(".cart_info_td").each(function(index, element){
					if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
						totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
						totalCount += parseInt($(element).find(".individual_goodsCount_input").val());
						totalKind += 1;			
					}
				});
				
				// 총 가격
				$(".totalPrice_span").text(totalPrice.toLocaleString());
				// 총 갯수
				$(".totalCount_span").text(totalCount);
				// 총 종류
				$(".totalKind_span").text(totalKind);	
			}
			
		$(function() {
			$("#myMenu ul:eq(1)").find("li:eq(0)").addClass("select")			
			
			$("#tab_menu li").click(function() {
				$(this).addClass("select")
				$(this).siblings().removeClass("select")
			})
			
			$("#tab_menu li:eq(0)").click(function() {
				$("#likeClubList").css("display","block")
				$("#likeClassList").css("display","none")
				$("#likeItemList").css("display","none")
			})
			
			$("#tab_menu li:eq(1)").click(function() {
				$("#likeClubList").css("display","none")
				$("#likeClassList").css("display","block")
				$("#likeItemList").css("display","none")
			})
			
			$("#tab_menu li:eq(2)").click(function() {
				$("#likeClubList").css("display","none")
				$("#likeClassList").css("display","none")
				$("#likeItemList").css("display","block")
			})
		})
	</script>
	<style type="text/css">
		
		form {
		margin:0;
		display:inline;
		height:20px;
		}
		
		.table-cart {
			border-top: none;
			border-left: none;
			border-right: none;
			margin-bottom: 40px;
		}
		
		.listTitle {
			background-color: #ededed;
		}
		
		.table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
		  background-color: #fefaf0;
		}
		
	</style>
</head>
<body>
	<!-- CONTENTS -->
	<section>
		<div id="myInfo">
			<div class="profile">				
				<input type="hidden" name="mem_id" id="mem_id" value="${login.mem_id}" />
				<c:if test="${login.img == null}">
					<img src="${contextPath }/resources/img/profile_default.png" />
				</c:if>
				<c:if test="${login.img != null}">
					<img src="${contextPath }/memberImgDown.do?imageFileName=${login.img}" />				
				</c:if>				
				<a class="editBtn01" onclick="fn_imgEditPopup()">편집</a>
				<h1>${login.mem_name}</h1>
				<p>${login.mem_id}</p>
				<a class="editBtn02" href="${contextPath }/mypage/infoEditFrm.do">회원정보수정</a>
			</div>
			
			<div class="hobby">
				<h2>내 취미</h2>
				<c:if test="${not empty hobbyList}">
					<a class="editBtn02" href="${contextPath }/mypage/memHobby.do">편집</a>
					<ul>
						<c:forEach var="hobby" items="${hobbyList}">
							<li>
								<img src="${contextPath }/resources/img/hobby_img/${hobby.hobby_code}.png" />
							</li>						
						</c:forEach>						
					</ul>
				</c:if>
				<c:if test="${empty hobbyList}">
					<ul>
						<li class="noCnt">
							<a href="${contextPath }/mypage/memHobby.do">취미 설정하기</a>
						</li>
					</ul>
				</c:if>				
			</div>
			
			<div class="area">
				<h2>내 지역</h2>
				<c:if test="${not empty areaList}">
					<a class="editBtn02" href="${contextPath }/mypage/memArea.do">편집</a>
					<ul>
						<c:forEach var="area" items="${areaList}">
							<li class="areaIcon">${area.name}</li>
						</c:forEach>						
					</ul>
				</c:if>
				<c:if test="${empty areaList}">
					<ul>
						<li class="noCnt">
							<a href="${contextPath }/mypage/memArea.do">지역 설정하기</a>
						</li>
					</ul>
				</c:if>
			</div>
		</div>
		
		<div id="myMenu">
			<h3>관심사</h3>
			<ul>
				<li><a href="${contextPath }/mypage/myActivList.do">내 취미활동</a></li>
				<li><a href="${contextPath }/mypage/mylikeList.do">관심목록</a></li>
				<li><a href="${contextPath }/mypage/myAddItem.do">내 등록상품</a></li>
			</ul>
			
			<h3>구매활동</h3>
			<ul>
				<li><a href="${contextPath }/mypage/cartClass.do">장바구니</a></li>
				<li><a href="${contextPath }/order/contractList.do">구매 내역</a></li>
			</ul>
			
			<h3>게시물</h3>
			<ul>
				<li><a href="">후기 관리</a></li>
			</ul>
		</div>		
		
		<div id="myPageCont">
			<div style="margin: 20px">
				<h3>클래스 장바구니</h3>
				<table class="table table-hover table-cart">
					<tr class="listTitle">
						<th width="5">
							<div class="class_all_check_input_div">
								<input type="checkbox" class="form-check-input class_all_check_input" checked="checked">
							</div>		
						</th>
						<th width="40%">상품</th>
						<th width="15%">가격</th>
						<th width="15%">수량</th>
						<th width="15%">소계</th>
						<th width="10%">비고</th>
					</tr>
					<c:if test="${empty cartClassList}">
						<tr>
							<td colspan="6" align="center">장바구니에 담긴 클래스가 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${not empty cartClassList}">
						<c:forEach items="${cartClassList }" var="classDTO">
							<tr>	
								<td class="cart_info_td">
									<input type="checkbox" class="form-check-input individual_cart_checkbox individual_class_cart_checkbox" checked="checked">
									<input type="hidden" class="individual_totalPrice_input" value="${classDTO.price * classDTO.quantity }">
									<input type="hidden" class="individual_goodsCount_input" value="${classDTO.quantity }">
									<input type="hidden" class="individual_goodsType_input" value="class">
									<input type="hidden" class="individual_goodsCode_input" value="${classDTO.goods_code }">
								</td>
								<td><a href="${contextPath}/class/classDetail.do?class_code=${classDTO.goods_code}">${classDTO.className }</a></td>
								<td><fmt:formatNumber value="${classDTO.price }" pattern="##,###,###" /></td>
								<td>
									<form action="${contextPath}/mypage/quanEditCart.do">
									<input type="text" value="${classDTO.quantity }" name="quantity" style="width: 40px">
									<input type="hidden" value="${classDTO.cart_num }" name="cart_num">
									<input type="submit" value="변경">
									</form>
								</td>
								<td><fmt:formatNumber value="${classDTO.price * classDTO.quantity }" pattern="##,###,###" /></td>
								<c:set var="classSum" value="${classSum + (classDTO.price * classDTO.quantity) }" />
								<td><a href="${contextPath}/mypage/deleteCart.do?goods_code=${classDTO.goods_code}&mem_id=${classDTO.mem_id}&goods_type=class">삭제</a></td>
							</tr>
						</c:forEach>
					</c:if>	
					
					<tr style="border-bottom: hidden;">
						<th></th>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><fmt:formatNumber value="${classSum }" pattern="##,###,###" /> 원</th>
						<th></th>
					</tr>
				</table>
				
				<h3>취미용품 장바구니</h3>
				<table class="table table-hover table-cart">
					<tr class="listTitle">
						<th width="5%">
							<div class="item_all_check_input_div">
								<input type="checkbox" class="form-check-input item_all_check_input" checked="checked">
							</div>
						</th>
						<th width="40%">상품</th>
						<th width="15%">가격</th>
						<th width="15%">수량</th>
						<th width="15%">소계</th>
						<th width="10%">비고</th>
					</tr>
		
					<c:if test="${empty cartItemList}">
						<tr>
							<td colspan="6" align="center">장바구니에 담긴 상품이 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${not empty cartItemList}">
						<c:forEach items="${cartItemList }" var="itemDTO">
							<tr>
								<td class="cart_info_td">
									<input type="checkbox" class="form-check-input individual_cart_checkbox individual_item_cart_checkbox" checked="checked">
									<input type="hidden" class="individual_totalPrice_input" value="${itemDTO.price * itemDTO.quantity }">
									<input type="hidden" class="individual_goodsCount_input" value="${itemDTO.quantity }">
									<input type="hidden" class="individual_goodsType_input" value="item">
									<input type="hidden" class="individual_goodsCode_input" value="${itemDTO.goods_code }">
								</td>
								<td><a href="${contextPath}/item/itemDetail.do?item_code=${itemDTO.goods_code}">${itemDTO.item_name }</a></td>
								<td><fmt:formatNumber value="${itemDTO.price }" pattern="##,###,###" /></td>
								<td>
									<form action="${contextPath}/mypage/quanEditCart.do">
									<input type="text" value="${itemDTO.quantity }" name="quantity" style="width: 40px">
									<input type="hidden" value="${itemDTO.cart_num }" name="cart_num">
									<input type="submit" value="변경">
									</form>
								</td>
								<td><fmt:formatNumber value="${itemDTO.price * itemDTO.quantity }" pattern="##,###,###" /></td>
								<c:set var="itemSum" value="${itemSum + (itemDTO.price * itemDTO.quantity) }" />
								<td><a href="${contextPath}/mypage/deleteCart.do?goods_code=${itemDTO.goods_code}&mem_id=${itemDTO.mem_id}&goods_type=item">삭제</a></td>
							</tr>
						</c:forEach>
					</c:if>
					<tr style="border-bottom: hidden;">
						<th></th>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><fmt:formatNumber value="${itemSum }" pattern="##,###,###" /> 원</th>
						<th></th>
					</tr>
					</table>
					
					<h3>최종 집계</h3>
					<table class="table table-hover" style="border-left: none; border-right: none;">
					<tr>
						<th></th>
						<th></th>
						<th></th>
						<th>전체 총액</th>
						<th><span><fmt:formatNumber value="${classSum+itemSum}" pattern="##,###,###" /> 원</span></th>
						<th></th>
					</tr>
					<tr>
						<th width="1%"></th>
						<th width="1%"></th>
						<th width="20%"></th>
						<th width="20%">선택 총액</th>
						<th width="55%"><span class="totalKind_span"></span> 종  /  <span class="totalCount_span"></span> 개  /  <span class="totalPrice_span"></span>원</th>
						<th width="2%"></th>
					</tr>
				</table>
				<div align="right" style="margin-top: 10px; margin-bottom: 20px">
					<form action="${contextPath }/order/orderPage.do" method="get" class="order_form">
						<button type="submit" class="btn btn-warning order_btn">구매하기 </button>
					</form>
					<form action="${contextPath }/mypage/deleteAll.do" method="get">
						<button class="btn secondary cart_submit">장바구니 비우기</button>
					</form>
					
				</div>
			</div>
		</div>
		
		
		<div id="imgEdit_div" class="popup_div profile">
			<h4>프로필 사진 변경</h4>
			<button class="closeBtn">닫기</button>
			<form action="${contextPath }/mypage/updateImg.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="mem_id" id="mem_id" value="${login.mem_id}" />
				<c:if test="${login.img == null}">
					<img id="mem_img" src="${contextPath }/resources/img/profile_default.png" />
				</c:if>
				<c:if test="${login.img != null}">
					<img id="mem_img" src="${contextPath }/memImgDown.do?imageFileName=${login.img}" />				
				</c:if>
				<input type="file" name="file" id="mem_imgfile" onchange="readURL(this, 0)" />
				<button type="submit" class="pointBtn">적용</button>
				<button type="button" class="basicBtn" onclick="fn_delURL()">삭제</button>
			</form>
		</div>		
	</section>
</body>
</html>
