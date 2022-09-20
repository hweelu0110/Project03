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
	$(".clubPopup").on('click', '.closeBtn', function() {
		$(this).parent("div").hide()
	})
	
	$(".popup_div").on('click', '.closeBtn', function() {
		$(this).parent("div").hide()
	})
	
	
	$(".closeBtn_style").click(function() {
		$(this).parent("div").hide()
	})
		
	
	/* 좋아요 처리 */			
	$(".like_icon").click(function() {
		let login = $("#loginChk").val()
		let selectItem = $(this)
		let codeNum, codeType
		
		$(".closeBtn").click(function() {
			$(this).parent("div").hide()
		})
		
		if (login != ''){
			if ($(this).siblings('#club_code').val() != null) {
				codeNum = $(this).siblings('#club_code').val()
				codeType = 'club_code'
			}else if ($(this).siblings('#class_code').val() != null) {
				codeNum = $(this).siblings('#class_code').val()
				codeType = 'class_code'
			}else if ($(this).siblings('#item_code').val() != null) {
				
				codeNum = $(this).siblings('#item_code').val()
				codeType = 'item_code'
			}
			
			
			if ($(this).hasClass("select")){
				$(this).removeClass("select")
				
				$.ajax({
					url: "http://localhost:8080/alto/mypage/likeDel.do",
					type: "Get",
					data: {codeNum: codeNum, codeType: codeType},
					dataType: "text",
					success: function(data) {
						confirmPopup($("#like_popup"), "관심 해제 완료!")
					},
					error: function(data) {
						alert("오류가 발생했습니다. 다시 시도해 주세요.")
					}
					
				})	
				
			} else {
				$(this).addClass("select")
				
				$.ajax({
					url: "http://localhost:8080/alto/mypage/likeAdd.do",
					type: "Get",
					data: {codeNum: codeNum, codeType: codeType},
					dataType: "text",
					success: function(data) {
						confirmPopup($("#like_popup"), "관심 목록 추가 완료!")
					},
					error: function(data) {
						alert("오류가 발생했습니다. 다시 시도해 주세요.")
					}
					
				})
			}					
		}else {
			confirmPopup($("#login_popup"), "관심추가는 로그인이 필요합니다.")
		}					
	})
	
})