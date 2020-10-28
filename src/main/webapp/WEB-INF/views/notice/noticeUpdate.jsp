<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Editor's Dependecy Style -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet" href="resources/css/noticeUpdate.css">
<title>Insert title here</title>


</head>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp"/>
<div class="notice_update_wrap">
	<form action="updateres.do" method="post">
	<input type="hidden" name="notice_no" value="${dto.notice_no }">
	<div >
		<div class="notice_title_wrap">
			<input type="text" name="notice_title" class="notice_title_input" value="${dto.notice_title }">
		</div>
		<div id="editor"></div>
		<div class="notice_button_wrap">
			<input type="submit" value="수정" onclick="formSubmit()">
			<input type="button" value="취소" onclick="location.href='detail.do?notice_no=${dto.notice_no}'">
		</div>
	</div>
	</form>
</div>
	
	
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script>
		const editor = new toastui.Editor({
			el : document.querySelector('#editor'),
			previewStyle : 'tab',
			height : '400px',
			initialValue : `${dto.notice_content }`,
			initialEditType : 'wysiwyg'
		});
		editor.getHtml();
		function formSubmit() {
			let input = document.createElement("input");
			input.setAttribute("type", "hidden");
			input.setAttribute("name", "notice_content")
			input.setAttribute("value", editor.getHtml());
			document.querySelector("#editor").append(input);
		}
		/* 
		 * input 태그를 생성하고 type=hidden, name=qna_content, value=editor.getHtml() 속성을 추가 
		 * #editor에 생성한 input 태그를 추가한다
		 */
	</script>
	 

</body>
</html>