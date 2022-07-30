<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../resources/css/list.css" />
<link href="../resources/css/class_main_style.css?after" rel="stylesheet" />
<title>ALTO - 클래스 메인</title>
<script type="text/javascript">
		
	</script>
</head>
<body>
	<section>
		<div class="hero_header">
			<table id="class_cate_Se">
				<tr>　　</tr>
				<tr align="center">
					<td><a href="${contextPath }/class/listClass.do?hobbyC=hm000001"><img alt="창작" src="../resources/img/hobby_img/hm000001.png"><br>창작</a>
					</td>
					<td><a href="${contextPath }/class/listClass.do?hobbyC=hm000002"><img alt="액티비티" src="../resources/img/hobby_img/hm000002.png"><br>액티비티</a>
					</td>
					<td><a href="${contextPath }/class/listClass.do?hobbyC=hm000003"><img alt="아웃도어" src="../resources/img/hobby_img/hm000003.png"><br>아웃도어</a>
					</td>
					<td><a href="${contextPath }/class/listClass.do?hobbyC=hm000004"><img alt="요리" src="../resources/img/hobby_img/hm000004.png"><br>요리</a>
					</td>
					<td><a href="${contextPath }/class/listClass.do?hobbyC=hm000005"><img alt="게임" src="../resources/img/hobby_img/hm000005.png"><br>게임</a>
					</td>
					<td><a href="${contextPath }/class/listClass.do?hobbyC=hm000006"><img alt="음악" src="../resources/img/hobby_img/hm000006.png"><br>음악</a>
					</td>
					<td><a href="${contextPath }/class/listClass.do?hobbyC=hm000007"><img alt="문화" src="../resources/img/hobby_img/hm000007.png"><br>문화</a>
					</td>
					<td><a href="${contextPath }/class/listClass.do?hobbyC=hm000008"><img alt="여행" src="../resources/img/hobby_img/hm000008.png"><br>여행</a>
					</td>
				</tr>
				<tr align="center">
					<td><a href="${contextPath }/class/listClass.do?hobbyC=hm000009"><img alt="봉사" src="../resources/img/hobby_img/hm000009.png"><br>봉사</a>
					</td>
					<td><a href="${contextPath }/class/listClass.do?hobbyC=hm000010"><img alt="사진/영상" src="../resources/img/hobby_img/hm000010.png"><br>사진/영상</a>
					</td>
					<td><a href="${contextPath }/class/listClass.do?hobbyC=hm000011"><img alt="직무/커리어" src="../resources/img/hobby_img/hm000011.png"><br>직무/커리어</a>
					</td>
					<td><a href="${contextPath }/class/listClass.do?hobbyC=hm000012"><img alt="차오토바이" src="../resources/img/hobby_img/hm000012.png"><br>차/오토바이</a>
					</td>
					<td><a href="${contextPath }/class/listClass.do?hobbyC=hm000013"><img alt="반려동물" src="../resources/img/hobby_img/hm000013.png"><br>반려동물</a>
					</td>
					<td><img alt="수집" src="../resources/img/hobby_img/hm000014.png"><br>수집</a>
					</td>
					<td><img alt="자유주제" src="../resources/img/hobby_img/hm000015.png"><br>자유주제</a>
					</td>
				</tr>
				<tr>
				</tr>
			</table>
		</div>

		<div id="sec_03">
				<h2>BEST</h2>
				<div class="swiper mySwiper4">
			      <div class="swiper-wrapper product">
				      <c:forEach var="classListBest" items="${classListBest }">
				      	<div class="swiper-slide">
							<img class="class_img" src="../resources/img/class_test.jpg" />
							<span class="like_icon">관심</span>
							<span class="area">${classListBest.area_name }</span>	
							<div>
								<p class="class_name">${classListBest.className }</p>
								<p class="hobby_name">${classListBest.hobby_name }</p>
								<p class="class_price">${classListBest.price }원</p>				
							</div>
						</div>
				      </c:forEach>
			      </div>
			      <div class="swiper-button-next"></div>
			      <div class="swiper-button-prev"></div>
			    </div>
			</div>
			
			<div id="sec_04">
				<h2>NEW</h2>
				<div class="swiper mySwiper4">
			      <div class="swiper-wrapper product">
				      <c:forEach var="classListNew" items="${classListNew }">
				      	<div class="swiper-slide">
							<img class="class_img" src="../resources/img/class_test.jpg" />
							<span class="like_icon">관심</span>
							<span class="area">${classListNew.area_name }</span>	
							<div>
								<p class="class_name">${classListNew.className }</p>
								<p class="hobby_name">${classListNew.hobby_name }</p>
								<p class="class_price">${classListNew.price }원</p>				
							</div>
						</div>
				      </c:forEach>
			      </div>
			      <div class="swiper-button-next"></div>
			      <div class="swiper-button-prev"></div>
			    </div>
			    <!-- Initialize Swiper -->
			    <script>
			      var swiper = new Swiper(".mySwiper4", {
			        slidesPerView: 5,
			        spaceBetween: 10,
			        slidesPerGroup: 5,
			        loop: false,
			        loopFillGroupWithBlank: true,
			        navigation: {
			          nextEl: ".swiper-button-next",
			          prevEl: ".swiper-button-prev",
			        },
			      });
			    </script>
			</div>	

	</section>
</body>
</html>