<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="article" value="${articleMap.article }" />
<c:set var="fileList" value="${articleMap.fileList }" />
<c:set var="club_code" value="${articleMap.article.club_code}"/>
<c:set var="cate" value="${param.cate}" />
<c:set var="tit" value="${param.tit}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="${path}/resources/css/club/board.css" />
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
			obj.action = "${path}/club_board/listArticles.do?club_code=${club_code}&cate=${cate}&tit=${tit}"
			obj.submit()
		}
		
		//수정하기 클릭시 텍스트 박스를 활성화시킴
		function fn_enable() {
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
			obj.action = "${path}/club_board/modArticle.do?club_code=${club_code}&cate=${cate}&tit=${tit}"
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
		
		function fn_removeModImage(_fileNO, _notice_num, _fileName, rowNum) {
			alert(rowNum)
			$.ajax({
				type: "post",
				url: "${path}/club_board/removeModFile.do?club_code=${club_code}&cate=${cate}&tit=${tit}",
				dataType: "text",
				data: {fileNO: _fileNO, notice_num: _notice_num, fileName: _fileName},
				success: function(result, textStatus) {
					if (result == 'success') {
						alert("이미지를 삭제했습니다.")
						location.href="${path}/club_board/viewArticle.do?removeCompleted=true&notice_num=" + _notice_num;
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
		<div id="clubMenu">
			<ul>
				<li><a href="${path}/club/clubInformation.do?club_code=${club_code}">정보</a></li>
				<li><a href="${path}/club_board/listArticles.do?club_code=${club_code}&cate=${cate}&tit=${tit}">게시판</a></li>
				<li><a href="${path}/club_album/Albumlist.do?club_code=${club_code}&cate=${cate}&tit=${tit}">사진첩</a></li>
				<li><a href="${path}/club/clubChat.do?club_code=${club_code}&cate=${cate}&tit=${tit}">채팅</a></li>
			</ul>
		</div>
		<div id="clubTit">
			<img src="${path}/resources/img/hobby_img/${cate}.png" />
			<h2>${tit}</h2>
		</div>
		
		<div id="clubCont">
			<h3>게시판</h3>
			
			<form action="#" name="frmArticle" method="post" enctype="multipart/form-data">
				<table id="clubView">
					<thead>
						<tr>
							<th colspan="6">${article.title}</th>
						</tr>					
						<tr>
							<td width="10%" align="right">작성자 ${article.mem_name}</td>
							<td width="*"><span class="regidate">${article.regidate}</span></td>
							<td width="8%">조회수</td>
							<td width="8%">${article.score}</td>
							<td width="8%">좋아요</td>
							<td width="8%">${article.like_num}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="6" class="contents">
								${article.contents}
							</td>
						</tr>
						
						<c:if test="${not empty fileList}">
							<tr>
								<th class="tit01">첨부파일</th>
								<td class="cont01" colspan="5">
									<c:forEach var="file" items="${fileList}">
										<div class="input-file">
					  						<input type="text" readonly="readonly" class="file-name" value="${file.fileName}" />
					  						<a class="file-label" href="${path}/club_board/filedownload.do?fileNo=${file.fileNo}">다운로드</a>
										</div>
									</c:forEach>				
								</td>
							</tr>	
						</c:if>
					</tbody>				
							
				</table>				
								
				<div>
					<div>
						<textarea placeholder="댓글을 남겨보세요"></textarea>
					</div>
					
					<div>
						<a role="button">취소</a>
						<a role="button">등록</a>
					</div>				
				</div>
				
				<div id="tr_btn_modify">
					<input type="button" class="btn02" value="수정등록" onclick="fn_modify_article(frmArticle)" />
					<input type="button" class="btn01" value="취소" onclick="backToList(frmArticle)" />
				</div>
				
				<div id="tr_btn" class="align_right">
					<c:if test="${login.mem_id == article.mem_id }">	
						<input type="button" class="basicBtn" value="수정하기" onclick="fn_enable()" />
						<input type="button" class="basicBtn" value="삭제하기" onclick="fn_remove_article('${path}/club_board/removeArticle.do?club_code=${club_code}&cate=${cate}&tit=${tit}', ${article.notice_num})" />
					</c:if>
					<input type="button" class="basicBtn02" value="목록보기" onclick="backToList(frmArticle)" />
				</div>
			</form>
		</div>		
		
	</section>
</body>
</html>