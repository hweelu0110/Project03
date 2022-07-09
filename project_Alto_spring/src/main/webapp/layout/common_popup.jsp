<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<!-- 로그인 알림 팝업 -->
	<div id="login_popup" class="popup_div">
		<p></p>
		<button type="button" class="pointBtn">로그인</button>
		<button type="button" class="basicBtn closeBtn">닫기</button>
	</div>
	
	<!-- 확인 팝업 -->
	<div id="confirm_popup" class="popup_div">
		<p></p>
		<button type="button" class="pointBtn closeBtn">확인</button>
	</div>
	
	<!-- 수정 실패 알림 팝업 -->
	<div id="edit_cancle_popup" class="popup_div">
		<p>변경사항이 적용되지<br/>않습니다.</p>
		<button type="button" class="pointBtn">닫기</button>
		<button type="button" class="basicBtn closeBtn">취소</button>
	</div>
	<!-- 주제변경 알림 팝업 -->
	<div id="club_topic_popup1" class="popup_div">
		<p><span class="select">7일 동안</span><br/>재변경이 제한 됩니다.<br/>주제를 변경하시겠습니까?</p>
		<button type="button" class="pointBtn">네</button>
		<button type="button" class="basicBtn closeBtn">아니오</button>
	</div>
	<!-- 주제변경 7일 제한 알림 팝업 -->
	<div id="club_topic_popup2" class="popup_div">
		<p>주제는 <span class="select">7일 이내<br/>재변경이 불가능</span>합니다.</p>
		<button type="button" class="pointBtn closeBtn">확인</button>
	</div>