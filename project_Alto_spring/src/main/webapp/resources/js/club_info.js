/**
 * club info Edit js
 */
 
 function memberChk(url) {
	let loginYN = $("#loginChk").val()			
	let memberYN = $("#memberYN").val()
	
	if (loginYN != "") {
		if (memberYN == "Y") {
			location.href = url;
		}else {
			confirmPopup($("#confirm_popup"), "모임 이용을 원하시면 모임에 가입해 주세요!")
		}
	}else {
		confirmPopup($("#login_popup"), "모임이용은 로그인이 필요합니다!")
	}
	
}
 
 function fn_articleForm(login) {
	if (login != '' && login != 'false') {
		confirmPopup($("#popupJoin"))
	}else {
		confirmPopup($("#login_popup"), "로그인 후 가입이 가능합니다.")
	}
}

function validateForm() {
	if($("#title").val() == ""){
        alert("제목을 입력하세요.");
        $("#title").focus();
        return false;
      }
	if($("#contents").val() == ""){
        alert("가입인사를 작성해주세요.");
        $("#contents").focus();
        return false;
      }
}

function fn_cluOut(manager) {
	if (confirm("모임에서 탈퇴해도 내가 등록한 글은 삭제되지 않습니다. 모임에서 지금 나가시겠습니까?")) {
		location.href='${path}/club/clubOut.do?club_code=${club_code}';
	}
}

function readURL(input, index) {
	if (input.files && input.files[index]) {
		let reader = new FileReader()
		reader.onload = function(e) {
			$("#club_img").attr("src",e.target.result)
			$("#step4 div.club_img").css("display","none")
			$("#club_img").css("display","block")
		}
		reader.readAsDataURL(input.files[index])
	}
}		

$(function() {	
	$(".clubPopup").hide()
	
	$("#schedule_member li").click(function() {
		let mem_id = $(this).children('#mem_id').val()
		
		$.ajax({
			url: "http://localhost:8080/alto/member/selectMemberInfo.do",
			type: "post",
			data: {mem_id: mem_id},
			dataType: "json",
			success: function(data, textStatus) {
				if(data.memberInfoList.length > 0) {
					$("#memberInfo").text("")
					$.each(data.memberInfoList, function(index, item) {
						if(index == 0) {
							$("#memberInfo").append("<button type='button' class='closeBtn'>닫기</button>")
							if(item.img == "" || item.img == null) {
								$("#memberInfo").append("<img class='memImg' src='http://localhost:8080/alto/resources/img/profile_default.png' />")
							}else {
								$("#memberInfo").append("<img class='memImg' src='http://localhost:8080/alto/memberImgDown.do?imageFileName="+item.img+"' />")
							}
							
							$("#memberInfo").append("<span class='memName'>"+item.mem_name+"</span>")
						}
						
						if(item.mem_open == "N") {			
							if(index == 0) {
								$("#memberInfo").append("<span class='noOpen'>비공개</span>")
							}							
							
						}else {							
							if(index == 0) {
								$("#memberInfo").append("<div class='memHobbys'>")
								$("#memberInfo").append("<span class='memGen Icon"+item.gender+"'></span>")
								let birth = item.birth
								birth = birth.substring(0,11)
								$("#memberInfo").append("<span class='memBirth'>"+birth+"</span>")
							}
							$("#memberInfo .memHobbys").append("<img src='http://localhost:8080/alto/resources/img/hobby_img/"+
									item.hobby_code+".png' />")
							if(index == 0) {
								$("#memberInfo").append("</div>")
							}
						}
						
						
					})
					confirmPopup($("#memberInfo"))
					
				}
			},
			error: function(data) {
			}
			
		})
	})
	
	//클럽 정보 수정 팝업
	$("#editBtn").click(function() {
		confirmPopup($("#step4"))
	})
	
	$("#step4 .mainArea").css("cursor","pointer")
	$("#step4 .clubHobby").css("cursor","pointer")
	$("#step4 .noImg").css("display","none")
	
	//주요지역 수정
	$("#step4 .mainArea").click(function() {
		confirmPopup($("#step3"))
	})
	
	$("#step3 #areaList li").click(function() {
		let areaName = $(this).text()
		let areaCode = $(this).find("input").val()
		$("#step3").hide()
		$("#step4 .mainArea").attr("value",areaName.trim())
		$("#step4 .area_code").attr("value",areaCode)
	})			
	
	//취미 수정
	$("#step4 .clubHobby").click(function() {
		confirmPopup($("#step5"))
		
		let tot = $("#hobbySubSection .sub_hobby").length
		let cateS = $("#step4 .clubHobby").val().trim()
		
		for(let i=0;i <= tot;i++) {
			if($("#hobbySubSection .sub_hobby").eq(i).text().trim() == cateS) {						
				$("#hobbySubSection .sub_hobby").eq(i).addClass("select")
			}
		}
		
	})
	
	$("#hobbySubSection").on('click', 'div.sub_hobby', function() {	
		$(this).toggleClass("select")
		$(this).siblings().removeClass("select")	
		$(this).siblings().children("input").removeAttr("name")
	})
				
	$("#hobbySubSection .sub_hobby.select").children("input").attr("name","sub_code")
	
	$("#hobbySubSection").on('click', '.sub_hobby', function() {
		if($(this).hasClass("select")) {
			$(this).children("input").attr("name","sub_code")
		}else {
			$(this).children("input").removeAttr("name")
		}
	})
	
	//주제 변경하기
	$("#step5 #mainHobbyEdit").click(function() {
		confirmPopup($("#step1"))
		$("#step1").css("display","block");
	})
	
	$("#step1 ul li").click(function() {
		let hobbyImg = $(this).children('img').attr('src')
		let hobbyCode = $(this).find("input").val()
		let hobbyName = $(this).children('p').text()
		
		$("#step5 .main_hobby img").attr('src',hobbyImg)
		$("#step5 .main_hobby input").attr("value",hobbyCode)
		$("#step5 .main_hobby").children('span.hobbyName').text(hobbyName)
		$("#step1").hide()
		
		let _hobbyC = hobbyCode
		if (_hobbyC != "" || _hobbyC != null) {
			$.ajax({
				url: "http://localhost:8080/alto/hobby/selectSubHobby.do",
				type:"post",
				dataType:"json",
				data: {hobbyC: _hobbyC},
				success: function(data, textStatus) {
					if(data.hobbySubList.length > 0) {
						$("#hobbySubSection").text("")
						$.each(data.hobbySubList, function(index, item) {
							if(item.SUB_NAME != '없음') {
								$("#hobbySubSection").append("<div class='sub_hobby'>\n"+
										"<input type='hidden' value='"+item.SUB_CODE+"'>\n<p>"+
										item.SUB_NAME+"</p>\n</div>")
							}									
						})
						
					}else {
						$("#hobbySubSection").text("")
					}
				},
				error: function(data, textStatus) {
					alert("오류가 발생하였습니다. 다시 시도해주세요.")
				}
			})
		}
	})			
	
	//상세 취미 정보 변경
	$("#hobbyEditBtn").click(function() {
		let hobbyImg = $("#step5 .main_hobby").children('img').attr('src') 
		let editCateM = $("#step5 .main_hobby").children('input').val()
		let editCateS = $("#hobbySubSection .sub_hobby.select").children("input").val()
		let editCateSname = $("#hobbySubSection .sub_hobby.select").text().trim()
		
		$("#step4 .icon_hobby img").attr('src',hobbyImg)
		$("#step4 .cate_m").attr("value",editCateM)
		$("#step4 .clubHobby").attr("value",editCateSname)
		$("#step4 .cate_s").attr("value",editCateS)
		$("#step5").hide()
	})
	
	//닫기 버튼 - 기존 정보로 되돌리기
	$("#step4 .closeBtn").click(function() {
		let area = $("#step4 ._area_name").val()
		let cate = $("#step4 ._cate_s").val()
		let intro = $("#step4 ._intro").val()
		let member = $("#step4 ._member").val()
		
		$("#step4 .mainArea").attr("value",area)
		$("#step4 .clubHobby").attr("value",cate)
		$("#step4 .clubIntro").val(intro)
		$("#step4 .clubMem").val(member)
		
		//club_img
		$("#club_imgfile").val("")
		$("#step4 div.club_img").css("display","block")
		$("#club_img").css("display","none")
	})
})