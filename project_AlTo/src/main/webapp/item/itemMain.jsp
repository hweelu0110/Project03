<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="../headinfo.jsp"%>
<link href="../css/class_main_style.css?after" rel="stylesheet" />
<link href="../css/class_main_sl.css?after" rel="stylesheet" />
<title>ALTO - 취미용품 메인</title>
<script type="text/javascript">
		
	</script>
</head>
<body>
	<%@ include file="../header.jsp"%>

	<section>
		<div class="hero_header">
			<form>
				<input type="text" id="class_main_s" placeholder="취미용품을 검색해보세요">
				<input type="image" src="../img/class/search-icon.png" alt="제출"
					id="search_submit">
			</form>
			<table id="class_cate_Se">
				<tr align="center">
					<td><img alt="창작" src="../img/hobby_img/h_001.png"><br>창작
					</td>
					<td><img alt="액티비티" src="../img/hobby_img/h_002.png"><br>액티비티
					</td>
					<td><img alt="아웃도어" src="../img/hobby_img/h_003.png"><br>아웃도어
					</td>
					<td><img alt="요리" src="../img/hobby_img/h_008.png"><br>요리
					</td>
					<td><img alt="게임" src="../img/hobby_img/h_006.png"><br>게임
					</td>
					<td><img alt="음악" src="../img/hobby_img/h_005.png"><br>음악
					</td>
					<td><img alt="문화" src="../img/hobby_img/h_009.png"><br>문화
					</td>
					<td><img alt="여행" src="../img/hobby_img/h_007.png"><br>여행
					</td>
				</tr>
				<tr align="center">
					<td><img alt="봉사" src="../img/hobby_img/h_010.png"><br>봉사
					</td>
					<td><img alt="사진/영상" src="../img/hobby_img/h_004.png"><br>사진/영상
					</td>
					<td><img alt="직무/커리어" src="../img/hobby_img/h_011.png"><br>직무/커리어
					</td>
					<td><img alt="수집" src="../img/hobby_img/h_012.png"><br>수집
					</td>
					<td><img alt="반려동물" src="../img/hobby_img/h_013.png"><br>반려동물
					</td>
					<td><img alt="차오토바이" src="../img/hobby_img/h_014.png"><br>차/오토바이
					</td>
					<td><img alt="자유주제" src="../img/hobby_img/h_015.png"><br>자유주제
					</td>
				</tr>
				<tr>
				</tr>
			</table>
		</div>

		<div id="sec_03">
			<h2>BEST</h2>

			<div class="swiper mySwiper4 class_products">
				<div class="swiper-wrapper product">
					<div class="swiper-slide">
						<img src="../img/class/1.jpg" class="classOb">
						<div>
							<p class="class_cate">요리</p>
							<p class="class_title">제과용 밀가루</p>
							<p class="class_price">20,000원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<img src="../img/class/1.jpg" class="classOb">
						<div>
							<p class="class_cate">음악</p>
							<p class="class_title">기타 피스(50개)</p>
							<p class="class_price">20,000원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<img src="../img/class/1.jpg" class="classOb">
						<div>
							<p class="class_cate">사진</p>
							<p class="class_title">모노포드</p>
							<p class="class_price">69,000원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<img src="../img/class/1.jpg" class="classOb">
						<div>
							<p class="class_cate">액티비티</p>
							<p class="class_title">등산용 스틱</p>
							<p class="class_price">79,000원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<img src="../img/class/1.jpg" class="classOb">
						<div>
							<p class="class_cate">요리</p>
							<p class="class_title">믹서볼</p>
							<p class="class_price">29,000원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<img src="../img/class/1.jpg" class="classOb">
						<div>
							<p class="class_cate">요리</p>
							<p class="class_title">에어프라이어용 호일</p>
							<p class="class_price">45,000원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<img src="../img/class/1.jpg" class="classOb">
						<div>
							<p class="class_cate">음악</p>
							<p class="class_title">어쿠스틱 기타</p>
							<p class="class_price">89,000원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<img src="../img/class/1.jpg" class="classOb">
						<div>
							<p class="class_cate">사진</p>
							<p class="class_title">렌즈용 가방</p>
							<p class="class_price">69,000원</p>
						</div>
					</div>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
		</div>

		<div id="sec_04">
			<h2>NEW</h2>
			<div class="swiper mySwiper4 class_products">
				<div class="swiper-wrapper product">
					<div class="swiper-slide">
						<img src="../img/class/2.jpg" class="classOb">
						<div>
							<p class="class_cate">요리</p>
							<p class="class_title">데코레이션용 리본</p>
							<p class="class_price">45,000원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<img src="../img/class/2.jpg" class="classOb">
						<div>
							<p class="class_cate">음악</p>
							<p class="class_title">드럼스틱 4종</p>
							<p class="class_price">89,000원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<img src="../img/class/2.jpg" class="classOb">
						<div>
							<p class="class_cate">사진</p>
							<p class="class_title">DSLR 방수용 덮개</p>
							<p class="class_price">69,000원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<img src="../img/class/2.jpg" class="classOb">
						<div>
							<p class="class_cate">액티비티</p>
							<p class="class_title">수영모</p>
							<p class="class_price">79,000원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<img src="../img/class/2.jpg" class="classOb">
						<div>
							<p class="class_cate">요리</p>
							<p class="class_title">렌틸콩</p>
							<p class="class_price">29,000원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<img src="../img/class/2.jpg" class="classOb">
						<div>
							<p class="class_cate">요리</p>
							<p class="class_title">도시락용 포크 아동용</p>
							<p class="class_price">45,000원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<img src="../img/class/2.jpg" class="classOb">
						<div>
							<p class="class_cate">음악</p>
							<p class="class_title">메트로눔</p>
							<p class="class_price">89,000원</p>
						</div>
					</div>
					<div class="swiper-slide">
						<img src="../img/class/2.jpg" class="classOb">
						<div>
							<p class="class_cate">사진</p>
							<p class="class_title">초보용 사진 교본</p>
							<p class="class_price">69,000원</p>
						</div>
					</div>
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
	<%@ include file="../footer.jsp"%>
</body>
</html>