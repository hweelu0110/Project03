/**
 * club info Edit js
 */
 
function fn_imgEditPopup() {
	confirmPopup($("#imgEdit_div"))
}

function readURL(input, index) {
	if (input.files && input.files[index]) {
		let reader = new FileReader()
		reader.onload = function(e) {
			$("#mem_img").attr("src",e.target.result)
		}
		reader.readAsDataURL(input.files[index])
	}
}

function fn_delURL() {
	$("#mem_img").attr("src","${path}/resources/img/profile_default.png")
	$("#mem_imgfile").val("")			
}	

$(function() {
	
	if($("#mem_imgfile").val() == "") {
		$("#mem_imgBtn").attr("disabled")
		$("#mem_imgBtn").removeClass("pointBtn")
		$("#mem_imgBtn").addClass("basicBtn")
	}else {
		$("#mem_imgBtn").removeAttr("disabled")
		$("#mem_imgBtn").addClass("pointBtn")
		$("#mem_imgBtn").removeClass("basicBtn")
	}			
	
	$("#imgEdit_div .closeBtn").click(function() {
		$("#mem_img").attr("src","${path}/resources/img/profile_default.png")
		$("#mem_imgfile").val("")
	})
})