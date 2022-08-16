/**
 * club open js
 */
 
 function validateForm(obj) {
	if(obj.mainArea.value == "") {
		confirmPopup($("#confirm_popup"), "주요 활동 지역을 선택하세요.")
		obj.mainArea.focus()
		return false
	}else if(obj.title.value == "") {
		confirmPopup($("#confirm_popup"), "모임 이름을 입력하세요.")
		obj.title.focus()
		return false
	}else if(obj.intro.value == "") {
		confirmPopup($("#confirm_popup"), "모임 소개를 입력하세요.")
		obj.intro.focus()
		return false
	}else {
		obj.submit()
		return true
	}
}

$(function() {	
	$(".clubPopup").hide()
	
	/* 클럽개설 버튼 팝업 */
	$("#open_btn").mouseover(function() {
		$("div.info_div").show()
	})
	$("#open_btn").mouseout(function() {
		$("div.info_div").hide()
	})	
	
	/* 클럽개설 1단계 popup */
	$("#open_btn").click(function() {
		confirmPopup($("#step1"))
	})
	
	/* 클럽개설 2단계 popup */
	$("#step1 ul li").click(function() {
		let hobbyImg = $(this).children('img').attr('src')
		let hobbyCode = $(this).find("input").val()
		$("#step2 .icon_hobby").css({
			"background-image":"url("+hobbyImg+")"
		})
		$("#step2 #cate_m").attr("value",hobbyCode)
		$("#step1").hide()
		confirmPopup($("#step2"))
	})
	
	/* 지역 검색 팝업 */
	$("#step2 form #mainArea").click(function() {
		confirmPopup($("#step3"))
	})
	
	$("#step3 #areaList li").click(function() {
		let areaName = $(this).text()
		let areaCode = $(this).find("input").val()
		$("#step3").hide()
		$("#step2 form #mainArea").attr("value",areaName.trim())
		$("#step2 form #area_code").attr("value",areaCode)
	})
	
})