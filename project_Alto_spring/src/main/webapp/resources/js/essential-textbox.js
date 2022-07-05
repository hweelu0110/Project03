/**
 * 필수입력 textbox
 */
 
 $(function() {
	/* 필수 입력 알림 css */
	let essen = $("#payment_div .essential").length
	for (let i=0 ; i <= essen ; i++) {
		
		if ($("#payment_div .essential:eq("+i+")").val() == "") {
			$("#payment_div .essential:eq("+i+")").addClass("notiTxt")
			$("#payment_div .essential:eq("+i+")").next("span.noti2").css("display","block")
		}else {
			$("#payment_div .essential:eq("+i+")").removeClass("notiTxt")
			$("#payment_div .essential:eq("+i+")").next("span.noti2").css("display","none")
		}
		
	}			
	
	$("#payment_div .essential").on("change keyup paste", function() {
		if ($(this).val() == "") {
			$(this).addClass("notiTxt")
			$(this).next("span.noti2").css("display","block")
		}else {
			$(this).removeClass("notiTxt")
			$(this).next("span.noti2").css("display","none")
		}
	})
	
	$("span.noti2").css("display","none")
		
	$("#member_div .essential").on("change keyup paste", function() {
		if ($(this).val() == "") {
			$(this).addClass("notiTxt")
			$(this).next("span.noti2").css("display","block")
		}else {
			$(this).removeClass("notiTxt")
			$(this).next("span.noti2").css("display","none")
		}
	})
			
})