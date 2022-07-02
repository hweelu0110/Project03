<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@ include file="../headinfo.jsp" %>
	<link href="../css/class_main_style.css?after" rel="stylesheet" />
	<link href="../css/class_main_sl.css?after" rel="stylesheet" />
	<title>ALTO - 클래스 메인</title>
	<script type="text/javascript">
		
	</script>
</head>
<body>
	<%@ include file="../header.jsp" %>
	
    <section>
    <div class="hero_header">
    <form>
    <input type="text" id="class_main_s" placeholder="클래스를 검색해보세요">
    <input type="image" src="../img/class/search-icon.png" alt="제출" id="search_submit">
    </form>
    <table id="class_cate_Se" >
    	<tr align="center">
    		<td>
    			<img alt="창작" src="../img/hobby_img/h_001.png"><br>창작
    		</td>
    		<td>
    			<img alt="액티비티" src="../img/hobby_img/h_002.png"><br>액티비티
    		</td>
    		<td>
    			<img alt="아웃도어" src="../img/hobby_img/h_003.png"><br>아웃도어
    		</td>
    		<td>
    			<img alt="요리" src="../img/hobby_img/h_008.png"><br>요리
    		</td>
    		<td>
    			<img alt="게임" src="../img/hobby_img/h_006.png"><br>게임
    		</td>
    		<td>
    			<img alt="음악" src="../img/hobby_img/h_005.png"><br>음악
    		</td>
    		<td>
    			<img alt="문화" src="../img/hobby_img/h_009.png"><br>문화
    		</td>
    		<td>
    			<img alt="여행" src="../img/hobby_img/h_007.png"><br>여행
    		</td>
    	</tr>
    	<tr align="center">
    		<td>
    			<img alt="봉사" src="../img/hobby_img/h_010.png"><br>봉사
    		</td>
    		<td>
    			<img alt="사진/영상" src="../img/hobby_img/h_004.png"><br>사진/영상
    		</td>
    		<td>
    			<img alt="직무/커리어" src="../img/hobby_img/h_011.png"><br>직무/커리어
    		</td>
    		<td>
    			<img alt="수집" src="../img/hobby_img/h_012.png"><br>수집
    		</td>
    		<td>
    			<img alt="반려동물" src="../img/hobby_img/h_013.png"><br>반려동물
    		</td>
    		<td>
    			<img alt="차오토바이" src="../img/hobby_img/h_014.png"><br>차/오토바이
    		</td>
    		<td>
    			<img alt="자유주제" src="../img/hobby_img/h_015.png"><br>자유주제
    		</td>
    	</tr>
    	<tr>
    	</tr>
    </table>
    </div>
    
    <div class="class_products">
	    <div class="class_products_01">
	    <h1>추천 클래스</h1>
		      <a href="#">
		        <img src="../img/class/1.jpg" class="classOb">
		        <p class="class_cate">요리</p>
		        <p class="class_title">건강한 수제 간식 만들기</p>
		        <p class="class_price">45,000원</p>
		      </a>
		      <a href="#">
		        <img src="../img/class/1.jpg">
		        <p class="class_cate">음악</p>
		        <p class="class_title">처음부터 배우는 기타 클래스</p>
		        <p class="class_price">89,000원</p>
		      </a>
		      <a href="#">
		        <img src="../img/class/1.jpg">
		        <p class="class_cate">사진</p>
		        <p class="class_title">인생 첫 DSRL 배우기</p>
		        <p class="class_price">69,000원</p>
		      </a>
		      <a href="#">
		        <img src="../img/class/1.jpg">
		        <p class="class_cate">액티비티</p>
		        <p class="class_title">하루 10분으로 변화하는 요가</p>
		        <p class="class_price">79,000원</p>
		      </a>
		      <a href="#">
		        <img src="../img/class/1.jpg">
		        <p class="class_cate">요리</p>
		        <p class="class_title">비건 도시락 만들기</p>
		        <p class="class_price">29,000원</p>
		      </a>
	      </div>
	      
	      <div class="class_products_02">
	      <h1>신규 클래스</h1>
		      <a href="#">
		        <img src="../img/class/2.jpg">
		        <p class="class_cate">요리</p>
		        <p class="class_title">건강한 수제 간식 만들기</p>
		        <p class="class_price">45,000원</p>
		      </a>
		      <a href="#">
		      	<img src="../img/class/2.jpg">
		        <p class="class_cate">음악</p>
		        <p class="class_title">처음부터 배우는 기타 클래스</p>
		        <p class="class_price">89,000원</p>
		      </a>
		      <a href="#">
		        <img src="../img/class/2.jpg">
		        <p class="class_cate">사진</p>
		        <p class="class_title">인생 첫 DSRL 배우기</p>
		        <p class="class_price">69,000원</p>
		      </a>
		      <a href="#">
		        <img src="../img/class/2.jpg">
		        <p class="class_cate">액티비티</p>
		        <p class="class_title">하루 10분으로 변화하는 요가</p>
		        <p class="class_price">79,000원</p>
		      </a>
		      <a href="#">
		        <img src="../img/class/2.jpg">
		        <p class="class_cate">요리</p>
		        <p class="class_title">비건 도시락 만들기</p>
		        <p class="class_price">29,000원</p>
		      </a>
	    </div>
    </div>
    
    </section>
	<%@ include file="../footer.jsp" %>
</body>
</html>