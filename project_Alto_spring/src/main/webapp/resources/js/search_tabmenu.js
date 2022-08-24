/**
 * 검색 목록 tab menu & select menu
 */
 
 $(function() {
	$("#tab_area").css("display","none")
	$("#m_cate").css("display","none")
	$("#s_cate").css("display","none")
	$("#area_list").css("display","none")
	
	
	let cateEle = $("#m_cate li.select")
	let areaEle = $("#area_list li.select")
	let selCate = $("#m_cate li.select").length
	let selArea = $("#area_list li.select").length
		
	for (let i=0; i<selArea; i++) {
		if ($("#tab_menu li:nth-child(1) span").text() == "전체 취미"){
			$("#tab_menu li:nth-child(1)").html("")
			$("#tab_menu li:nth-child(1)").append("<span>"+cateEle.eq(i).text()+"</span>");
		}else {
			$("#tab_menu li:nth-child(1)").append("<span style='margin-left:5px;'>"+cateEle.find("p").eq(i).text()+"</span>")
		}
	}
		
	for (let i=0; i<selArea; i++) {
		if ($("#tab_menu li:nth-child(2) span").text() == "전체 지역"){
			$("#tab_menu li:nth-child(2)").html("")
			$("#tab_menu li:nth-child(2)").append("<span>"+areaEle.eq(i).text()+"</span>")
		}else {
			$("#tab_menu li:nth-child(2)").append("<span style='margin-left:5px;'>"+areaEle.eq(i).text()+"</span>")
		}
	}	
	
	/* tab메뉴 선택 시 - 영역 노출하기 */
	/* 취미 탭메뉴 */
	$("#tab_menu li:nth-child(1)").click(function() {
		$(this).toggleClass("select")				
		$("#opSearch_btn").css("left","")
		if ($("#area_list").css("display") == "block") {					
			$("#area_list").css("left","-1px")
			$("#m_cate").toggle()
		} else {
			$("#tab_area").toggle()
			$("#m_cate").toggle()
		}
		
		if ($("#m_cate").css("display") == "none" && $("#area_list").css("display") == "block") {
			let lefVal = $("#tab_menu li:nth-child(1)").width() + 17
			$("#area_list").css("left",lefVal+"px")
			lefVal = lefVal + 123
			$("#opSearch_btn").css("left",lefVal+"px")					
		}					
		
		if ($("#m_cate_all").siblings().hasClass('select') && $("#m_cate").css("display") == "block") {					
			$("#s_cate").show()
		}else {
			$("#s_cate").hide()
		}
	})
	
	/* 지역 탭메뉴 */
	$("#tab_menu li:nth-child(2)").click(function() {
		$(this).toggleClass("select")
		
		if ($("#m_cate").css("display") == "block") {
			$("#area_list").css("left","-1px")
			$("#area_list").toggle()					
		}else if ($("#m_cate").css("display") == "none") {
			$("#tab_area").toggle()
			let lefVal = $("#tab_menu li:nth-child(1)").width() + 17
			$("#area_list").css("left",lefVal+"px")
			lefVal = lefVal + 123
			$("#opSearch_btn").css("left",lefVal+"px")
			$("#area_list").toggle()
		}				
		
	})
	
	/* 메인카테고리 선택 시 - 서브카테고리 영역 노출 */
	$("#m_cate ul li").click(function() {
		$(this).toggleClass("select")
		
		if ($("#m_cate ul").find("li").hasClass('select')) {
			$("#m_cate ul li.all").removeClass("select")
			$("#s_cate").show()						
		}else {
			$("#s_cate").hide()
			$("#m_cate ul li.all").addClass("select")
		}
		
		/* 선택값 text tab메뉴에 추가하기 */
		if ($(this).hasClass("select")) {
			if ($("#tab_menu li:nth-child(1) span").text() === "전체 취미"){
				$("#tab_menu li:nth-child(1)").html("")
				$("#tab_menu li:nth-child(1)").append("<span>"+$(this).find("p").text()+"</span>")
			}else {
				$("#tab_menu li:nth-child(1)").append("<span style='margin-left:5px;'>"+$(this).find("p").text()+"</span>")
			}									
		}else {
			let sel = $("#tab_menu li:nth-child(1)").children().length	
			
			for(let i=0; i <= sel; i++){
				if ($("#tab_menu li:nth-child(1) span:nth-child("+i+")").text() === $(this).find("p").text()){							
					$("#tab_menu li:nth-child(1) span:nth-child("+i+")").remove()
					$("#tab_menu li:nth-child(1) span:nth-child(1)").css("margin-left","0px")
				}
			}
		}
		
		if ($("#m_cate ul li.all").hasClass("select")) {
			$("#tab_menu li:nth-child(1)").html("<span>전체 취미</span>")
		}
	})
	
			
	
	/* 서브카테고리 선택 */
	$(document).on("click","#s_cate ul li", function() {
		$(this).toggleClass("select")
		
		if ($("#s_cate ul").find("li").hasClass('select')) {
			$("#s_cate ul li.all").removeClass("select")					
		}else {
			$("#s_cate ul li.all").addClass("select")
		}
	})
	
	
	/* 지역 선택값 text tab메뉴에 추가하기 */
	$("#area_list ul li").click(function() {
		$(this).toggleClass("select")
		
		if ($("#area_list ul li.all").nextAll().hasClass('select')) {
			$("#area_list ul li.all").removeClass("select")
			$("#area_list ul li.online").removeClass("select")
		}else {
			$("#area_list ul li.all").addClass("select")
		}
		
		if ($(this).hasClass("select")) {
			if ($("#tab_menu li:nth-child(2) span").text() === "전체 지역" ||$("#tab_menu li:nth-child(2) span").text() === "온라인"){
				$("#tab_menu li:nth-child(2)").html("")
				$("#tab_menu li:nth-child(2)").append("<span>"+$(this).text()+"</span>")
			}else {
				$("#tab_menu li:nth-child(2)").append("<span style='margin-left:5px;'>"+$(this).text()+"</span>")
			}			
		}else {
			let sel = $("#tab_menu li:nth-child(2)").children().length	
			
			for(let i=0; i <= sel; i++){
				if ($("#tab_menu li:nth-child(2) span:nth-child("+i+")").text() === $(this).text()){							
					$("#tab_menu li:nth-child(2) span:nth-child("+i+")").remove()
					$("#tab_menu li:nth-child(2) span:nth-child(1)").css("margin-left","0px")
				}
			}
		}
		
		if ($("#area_list ul li.all").hasClass("select")) {
			$("#tab_menu li:nth-child(2)").html("<span>전체 지역</span>")
		}
	})
	
	/* 전체 선택 시 그 외 선택 초기화 처리 */
	$("#m_cate ul li.all").click(function() {
		$(this).addClass("select")
		$(this).siblings().removeClass("select")
		$("#tab_menu li:nth-child(1)").html("<span>전체 취미</span>")
		$("#s_cate").hide()
	})
	
	$("#s_cate ul li.all").click(function() {
		$(this).addClass("select")
		$(this).siblings().removeClass("select")
	})
	
	$("#area_list ul li.all").click(function() {
		$(this).addClass("select")
		$(this).siblings().removeClass("select")
		$("#tab_menu li:nth-child(2)").html("<span>전체 지역</span>")
	})
	
	/* 온라인 선택 시 그 외 선택 초기화 처리  */
	$("#area_list ul li.online").click(function() {			
		$(this).addClass("select")
		$(this).siblings().removeClass("select")
		$("#tab_menu li:nth-child(2)").html("<span>온라인</span>")
					
	})	
	
	
	/* select 정렬선택 */
	$("#selectBoxArea div").filter(":first").click(function() {
		$("div.select_list").toggle()
	})
	
	$("#selectBoxArea .select_list ul li").click(function() {
		$("#selectBoxArea div:nth-child(1)").text($(this).text())
		$("div.select_list").toggle()
	})
})