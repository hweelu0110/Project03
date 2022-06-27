/**
 * 공통 javascript
 */
 
/* 브라우저 가운데 팝업 띄우기 */
function confirmPopup() {
	let top = ($(window).scrollTop() + ($(window).height() - $(".popup_div").height()) / 2)
	let left = ($(window).scrollLeft() + ($(window).width() - $(".popup_div").width()) / 2)
	$(".popup_div").css('top',top)
	$(".popup_div").css('left',left)
	$(".popup_div").show()			
}

 
$(function () {
	$(".closeBtn").click(function() {
		$(this).parent("div").hide()
	})
})