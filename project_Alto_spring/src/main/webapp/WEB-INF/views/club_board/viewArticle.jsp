<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="article" value="${articleMap.article }" />
<c:set var="FileList" value="${articleMap.FileList }" />
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
	<style type="text/css">
		.tr_modEable {
			visibility: hidden;
		}
		#tr_btn_modify {
			display: none;
		}
	</style>
	<script type="text/javascript">
		function backToList(obj) {
			obj.action = "${contextPath}/board/listArticles.do"
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
		
		let isFirstAddFile = true
		function fn_addModFile(_img_index) {
			console.log("here!")
			if (isFirstAddFile == true) {
				pre_img_num = _img_index
				img_index = ++_img_index
				isFirstAddFile = false;
			}
			else {
				++img_index;
			}
			
			let innerHtml = "";
			
			innerHtml += '<tr width=200px align=center>'
			
			innerHtml += '<td>' +
								"<input type=file name='FileName"+img_index+"' onchange='readURL(this, "+img_index+")' />" +
						 '</td>'
			innerHtml += '<td>' +		
								"<img id='preview"+img_index+"' width=640 height=480 />" +
						 '</td>'

			innerHtml += '</tr>'
			$("#td_addImage").append(innerHtml)		
			$("#added_img_num").val(img_index);		//추가된 이미지수를 hidden 속성의 태그에 저장해서 컨트롤러에 보냄
		}
		
		function fn_remove_article(url, notice_num) {
			let form = document.createElement("form")		//js이용해 동적으로 form태그 생성
			form.setAttribute("method", "post")
			form.setAttribute("action", url)
			let articleNoInput = document.createElement("input")		//js이용해 동적으로 input태그 생성
			articleNoInput.setAttribute("type", "hidden")		
			articleNoInput.setAttribute("name", "notice_num")
			articleNoInput.setAttribute("value", notice_num)
			form.appendChild(articleNoInput)				//동적으로 생성된 input태그를 동적으로 생성한 form에 append
			document.body.appendChild(form)					//form 태그를 body태그에 추가
			form.submit()									//서버에 요청함
		}
		
		function fn_removeModImage(_FileNO, _notice_num, _FileName, rowNum) {
			alert(rowNum)
			$.ajax({
				type: "post",
				url: "${contextPath}/club_board/removeModFile.do",
				dataType: "text",
				data: {imageFileNO: _imageFileNO, articleNO: _articleNO, imageFileName: _imageFileName},
				success: function(result, textStatus) {
					if (result == 'success') {
						alert("이미지를 삭제했습니다.")
						location.href="${contextPath}/club_board/viewArticle.do?removeCompleted=true&notice_num=" + _notice_num;
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
	<h2>게시판</h2>
	<form action="#" name="frmArticle" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" class="title2" style="width: 150px" id="name" />
				</td>
			</tr>
			<tr>
				<td>제목</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea id="content" style="width: 70%; height: 100px;"></textarea>
				</td>
			</tr>
					<tr>
				<td>파일 첨부</td>
				<td>
					<div class="input-file"  >
  					<input type="text"  style="width: 70%">
  					<label>다운로드</label>
					</div>

				</td>
			</tr>
			
			
		</table>
		
		<div>
				<a>
					<img alt="" src="image/heart.png" style="width:10px; height: 10px;">
					<a>좋아요</a>
					<a></a>
				</a>
					<img alt="" src="image/review.png" style="width:10px; height: 10px;">
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
					<input type="button" class="btn02" value="수정등록" onclick="fn_modify_article(frmArticle)" />
					<input type="button" class="btn01" value="취소" onclick="backToList(frmArticle)" />
				</td>
			</tr>
			
			<tr id="tr_btn">
				<td colspan="2" align="center">
					<c:if test="${login.mem_id == article.mem_id }">	<!-- 로그인 ID가 작성자 ID와 같은 경우 -->
						<input type="button" class="btn02" value="수정하기" onclick="fn_enable()" />
						<input type="button" class="btn01" value="삭제하기" onclick="fn_remove_article('${contextPath}/club_board/removeArticle.do', ${article.articleNO})" />
					</c:if>
					<input type="button" class="btn01" value="목록보기" onclick="backToList(frmArticle)" />
					
				</td>
			</tr>
		</table>
	</form>
	</section>
</body>
</html>