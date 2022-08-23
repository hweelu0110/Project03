<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="album" value="${albumMap.album }" />
<c:set var="imageFileList" value="${albumMap.imageFileList }" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/club/schedule.css" />
	<script type="text/javascript">
	function backToList(obj) {
		obj.action = "${contextPath}/club_album/Albumlist.do"
		obj.submit()
	}
	
	//수정하기 클릭시 텍스트 박스를 활성화시킴
	function fn_enable() {
		document.getElementById("i_title").disabled=false
		document.getElementById("i_content").disabled=false
		
		document.getElementById("tr_btn_modify").style.display="block"
		document.getElementById("tr_btn").style.display = "none"
		$(".tr_modEable").css("visibility", "visible")
	}
	
	function readURL(input,index) {
		if (input.files && input.files[0]) {
			let reader = new FileReader()
			reader.onload = function(e) {
				$('#preview'+index).attr('src', e.target.result)
			}
			reader.readAsDataURL(input.files[0])
		}
	}	
	
	//수정등록 버튼 클릭시 컨트롤러에게 수정 데이터를 전송 
	function fn_modify_article(obj) {
		obj.action = "${contextPath}/club_board/modArticle.do"
		obj.submit()
	}
	
	let pre_img_num = 0;			//기존 이미지 갯수 (수정 이전의 이미지 갯수)
	let img_index = 0;				//새로 추가된 이미지 갯수 (수정 후 이미지 갯수)
	
	let isFirstAddImage = true
	function fn_addModImage(_img_index) {
		console.log("here!")
		if (isFirstAddImage == true) {
			pre_img_num = _img_index
			img_index = ++_img_index
			isFirstAddImage = false;
		}
		else {
			++img_index;
		}
		
		let innerHtml = "";
		
		innerHtml += '<tr width=200px align=center>'
		
		innerHtml += '<td>' +
							"<input type=file name='imageFileName"+img_index+"' onchange='readURL(this, "+img_index+")' />" +
					 '</td>'
		innerHtml += '<td>' +		
							"<img id='preview"+img_index+"' width=640 height=480 />" +
					 '</td>'

		innerHtml += '</tr>'
		$("#td_addImage").append(innerHtml)		
		$("#added_img_num").val(img_index);		//추가된 이미지수를 hidden 속성의 태그에 저장해서 컨트롤러에 보냄
	}
	
	function fn_remove_article(url, articleNO) {
		let form = document.createElement("form")		//js이용해 동적으로 form태그 생성
		form.setAttribute("method", "post")
		form.setAttribute("action", url)
		let articleNoInput = document.createElement("input")		//js이용해 동적으로 input태그 생성
		articleNoInput.setAttribute("type", "hidden")		
		articleNoInput.setAttribute("name", "album_num")
		articleNoInput.setAttribute("value", album_num)
		form.appendChild(articleNoInput)				//동적으로 생성된 input태그를 동적으로 생성한 form에 append
		document.body.appendChild(form)					//form 태그를 body태그에 추가
		form.submit()									//서버에 요청함
	}
	
	function fn_removeModImage(_imageFileNO, _album_num, _imageFileName, rowNum) {
		alert(rowNum)
		$.ajax({
			type: "post",
			url: "${contextPath}/board/removeModImage.do",
			dataType: "text",
			data: {imageFileNO: _imageFileNO, album_num: _album_num, imageFileName: _imageFileName},
			success: function(result, textStatus) {
				if (result == 'success') {
					alert("이미지를 삭제했습니다.")
					location.href="${contextPath}/club_album/Albumdetail.do?removeCompleted=true&album_num=" + _album_num;
					$('#tr_'+rowNum).remove()
					$('#tr_sub' +rowNum).remove()
				}
				else {
					alert("다시 시도해 주세요.")
				}
			},
			error: function(result, textStatus) {
				alert("에러가 발했습니다.")
			},
			complete: function(result, textStatus) {
			
			}
		})
	}
	
	</script>
</head>
<body>
	<section>
	<h2>사진첩</h2>
	<form action="#" name="frmAlbum" method="post" enctype="multipart/form-data">
		<table>
			
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" class="title2" style="width: 150px" id="name" value="${album.mem_id }" disabled/>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="title2" class="title2" style="width: 70%" value="${album.title }" disabled/>
				</td>
			</tr>
			
			<!-- 이미지(들) 출력 -->
			<!-- 다수 이미지 표시 -->
			
			<c:set var="img_index" />
			<c:choose>
				<c:when test="${not empty imageFileList && imageFileList != 'null' }">
					<c:forEach var="item" items="${imageFileList }" varStatus="status">
						<tr id="tr_${status.count }">
							<td width="150" align="center" bgcolor="#add3f7">
								이미지${status.count }
							</td>
							<td>
								<!-- 이미지 수정시 미리 원래 이미지 파일이름을 저장함 -->
								<input type="hidden" name="oldFileName" value="${item.imageFileName }" />
								<input type="hidden" name="imageFileNO" value="${item.imageFileNO }" />
								<img alt="이미지" src="${contextPath}/download.do?imageFileName=${item.imageFileName}&articleNO=${item.album_num}"
									id="preview${status.index }" width="450px" height="450px"><br />
							</td>
						</tr>
						<tr class="tr_modEable" id="tr_sub${status.count }">
							<td></td>
							<td>
								<input type="file" name="imageFileName${status.index }" id="i_imageFileName${status.index }" onchange="readURL(this, ${status.index})">
								<input type="button" value="이미지 삭제하기" 
										onclick="fn_removeModImage(${item.imageFileNO}, ${item.album_num }, '${item.imageFileName }', ${status.count })">
							</td>
						</tr>
						
						<c:if test="${status.last eq true}">
							<c:set var="img_index" value="${status.count }" />
							<input type="hidden" name="pre_img_num"  value="${status.count }"/>	<!-- 기존의 이미지수 -->
							<input type="hidden" name="added_img_num"  id="added_img_num"  value="${status.count }"/>	<!-- 수정시 새로 추가된 이미지수 -->
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:set var="img_index" value="${0 }" />
					<input type="hidden" name="pre_img_num"  value="${0 }"/>	<!-- 기존의 이미지수 -->
					<input type="hidden" name="added_img_num" id="added_img_num"  value="${0 }"/>	<!-- 수정시 새로 추가된 이미지수 -->					
				</c:otherwise>
			</c:choose>	
			
		</table>
		<hr>
		
		<div>
				<a>
					<img class="like2" src="../resources/img/heart.png" style="width:15px; height: 15px;">
					<a>좋아요</a>
					<a></a>
				</a>
					<img class="reply" src="../resources/img/review.png" style="width:15px; height: 15px;">
					<a>댓글</a>
					<a></a>
					
			</div>
			<div>
				<div>
					<h3>댓글</h3>
				</div>
			</div>
			<div>
				<div>
					<strong>댓글을 입력하세요</strong>
					<em></em>
					<textarea rows="" cols="" placeholder="댓글을 남겨보세요">
					
					</textarea>
				</div>
				<div>
					<a role="button">취소</a>
					<a role="button">등록</a>
				</div>
				
			</div>
			
			<table>
			
			<tr id="tr_btn_modify">
				<td colspan="2" align="center">
					<input type="button" class="btn02" value="수정등록" onclick="fn_modify_article(frmAlbum)" />
					<input type="button" class="btn01" value="취소" onclick="backToList(frmAlbum)" />
				</td>
			</tr>
			
			<tr id="tr_btn">
				<td colspan="4" align="center">
					<c:if test="${login.mem_id == album.mem_id }">
						<input type="button" class="btn02" value="수정하기" onclick="fn_enable()" />
						<input type="button" class="btn01" value="삭제하기" onclick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.album_num})" />
					</c:if>
					<button type="button" class="btn02" onclick="backToList(frmAlbum)">목록보기</button>
					
				</td>
			</tr>
		</table>
		
		
	</form>
	</section>
</body>
</html>