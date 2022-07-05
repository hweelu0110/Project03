<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<%@include file="../headinfo.jsp" %>
	<link rel="stylesheet" href="../resources/css/member.css" />	
	<script src="../resources/js/essential-textbox.js"></script>	
	<script type="text/javascript">
		$(function() {
			$("#termsBtn").css("cursor","default")
			
			$(".checkStyle").click(function() {
				$(this).toggleClass("checked")
				
				if ($(".checkStyle:eq(0)").hasClass("checked") && $(".checkStyle:eq(1)").hasClass("checked")) {
					$("#termsBtn").removeClass("basicBtn")
					$("#termsBtn").addClass("pointBtn")
					$("#termsBtn").removeAttr("disabled")
					$("#termsBtn").css("cursor","pointer")
				} else {
					$("#termsBtn").removeClass("pointBtn")
					$("#termsBtn").addClass("basicBtn")
					$("#termsBtn").attr("disabled","disabled")
					$("#termsBtn").css("cursor","default")
				}
			})						
		})
	</script>	
</head>
<body>
	<%@include file="../header.jsp" %>
	
	<section>
		<div id="member_div">
			<h2>이용약관동의</h2>
						
			<div class="memSection">
				<p class="checkStyle">서비스 이용약관 동의<span class="noti2">(필수)</span></p>
				<textarea disabled="disabled">
제 1 조 (목적)

이 약관은 (주)프렌즈큐브(이하 '회사')가 제공하는 소모임 서비스(이하 '서비스')를 이용하는 서비스 사용자(이하 '회원')와 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 운영수칙, 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (정의)

이 약관에서 사용하는 용어의 정의는 다음과 같습니다.

①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 회원이 이용할 수 있는 소모임 서비스 및 회사가 추가 개발하거나 다른 회사와 제휴계약 등을 통해 제공되는 일체의 서비스를 의미합니다.

②"회원"이라 함은 회사의 서비스에 접속하여 이 약관에 따라 회사와 이용계약을 체결하고 회사가 제공하는 서비스를 이용하는 고객을 의미합니다.

③"아이디"라 함은 회원의 식별과 서비스 이용을 위하여 회원이 정하고 회사가 승인하는 문자 또는 문자와 숫자의 조합을 의미합니다.

④"모임"이라 함은 회사의 서비스를 통해 회원이 직접 만든 그룹으로 한 명 이상의 회원들과 모여 자유롭게 관심사를 공유하고 친목을 도모할 수 있도록 회사가 제공하는 서비스를 의미합니다.

⑤"모임장"이라 함은 회사가 제공하는 서비스를 통해 모임을 개설한 회원 및 모임의 대표 권한을 양도받은 회원을 의미합니다.

⑥"운영진"이라 함은 모임장 및 운영진에 의해 임명된 모임 운영 및 관리의 책임이 있는 회원을 의미합니다.

⑦"멤버"라고 하면 모임에 가입되어 있는, 모임의 구성원으로 소속된 회원을 의미합니다.

⑧"게시물"이라 함은 회원이 서비스를 이용함에 있어 서비스에 게시한 모든 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상, 채팅메시지 및 각종 파일과 링크 등을 의미합니다.

⑨"유료 서비스"라 함은 회사가 유료로 제공하는 각종 정보콘텐츠, 프리미엄 서비스, 아이템 기타 유료콘텐츠 및 제반 서비스등를 의미합니다.


				</textarea>
				
				<p class="checkStyle">개인정보 취급방침 동의<span class="noti2">(필수)</span></p>
				<textarea disabled="disabled">
(주)AlTo(이하 "회사")는 개인정보보호 규정을 준수하며, 관련 법령에 의거한 개인정보취급방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다.

본 개인 정보 보호 정책은 귀하의 정보에 관한 수집, 사용 및 정보 공개에 대한 회사의 정책과 절차를 설명합니다.

귀하는 본 서비스를 사용함으로서 정보의 수집, 전송, 조작, 저장, 공개 및 본 개인 정보 보호 정책에 명시된 귀하의 정보를 제공하는 것에 대해 동의하게 됩니다. 귀하의 거주 국가나 정보의 출처에 관계 없이, 귀하의 정보는 서비스가 운영되는 다른 모든 국가에서 사용될 수 있습니다.

1. 수집하는 개인정보의 항목 및 수집방법

가. 수집하는 개인정보의 항목

첫째, 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 개인정보를 수집하고 있습니다.

이용자의 전화번호, 이용자의 전화기 주소록내에 저장된 제3자의 전화번호, 기기고유번호 (디바이스 아이디 또는 IMEI)

둘째, 서비스 이용과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.

소모임 서비스 이용자 이름, 사진, 생년월일, 지역, 성별, 아이디, 관심사, 소개문구, 가입한 모임, 홈페이주소, 페이스북주소, 트위터주소, 이메일주소, 트래픽 데이터, 쿠키, 방문 일시, 운영체제 정보, 서비스 이용 기록, 불량 이용 기록
					
				</textarea>
			</div>
						
			<button id="termsBtn" type="submit" class="basicBtn size0" disabled onclick="location.href='memberInfo.jsp'">다음</button>
		</div>
	</section>
	
	<%@include file="../footer.jsp" %>
</body>
</html>