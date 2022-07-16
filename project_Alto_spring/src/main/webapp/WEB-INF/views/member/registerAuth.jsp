<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>AlTo - 메일 인증 알림</title>	
	<style type="text/css">
		section { overflow: hidden; }
		#regiCont {
			width: 500px;
		    margin: 70px auto;
		    padding: 30px;
		    overflow: hidden;
		    background: #f4f4f4;		    
		    font-family: 'Noto Sans KR', sans-serif;
		}
		#regiCont div {
			margin: 10px;
		    padding: 30px;
		    font-size: 12px;
		    background: #fff;
		    border-radius: 3px;
		}
		#regiCont div .memName {
			font-size: 15px;
		    font-weight: 700;
		    font-family: 'Noto Sans KR', sans-serif;
		}
		#regiCont div .memEmail {
			margin: 10px;
		    padding: 5px 10px;
		    text-align: center;
		    color: #494c57;
		    font-size: 20px;
		    font-weight: 700;
		    background: #F3BE34;
		    font-family: 'Noto Sans KR', sans-serif;
		}
	</style>
</head>
<body>
	<section>
		<div id="regiCont">
			<h1>이메일 인증</h1>
			<div>
				<p>반갑습니다 <span class="memName">${memberName}님!</span></p>
				<p> AlTo에 가입해주셔서 감사합니다.</p>
				<p class="memEmail">${memberEmail}</p>
				<p>위 메일주소로 회원 가입 인증 메일을 보냈습니다.</p>
				<p>메일 확인 후 <b>인증버튼</b>을 눌러주세요!</p>
			</div>	
		</div>
			
	</section>	
</body>
</html>