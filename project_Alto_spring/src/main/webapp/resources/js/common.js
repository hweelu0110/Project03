/**
 * 공통 javascript
 */
 
/* 브라우저 가운데 팝업 띄우기 */
function confirmPopup(popup, txt) {
	
	popup.css({
		"position":"absolute",
        "top": (($(window).height()-popup.outerHeight())/2+$(window).scrollTop())+"px",
        "left": (($(window).width()-popup.outerWidth())/2+$(window).scrollLeft())+"px"	             
     }); 
   	popup.children("p").text("")  
	popup.children("p").prepend(txt)
	popup.show()			
}


$(function () {
	$(".popup_div").hide()
		
	/* 팝업창 닫기 버튼 */ 
	$(".closeBtn").click(function() {
		$(this).parent("div").hide()
	})
	
	$(".closeBtn_style").click(function() {
		$(this).parent("div").hide()
	})
	
	$(".like_icon").click(function() {
		confirmPopup($("#login_popup"), "관심추가는 로그인이 필요합니다.")
	})
})