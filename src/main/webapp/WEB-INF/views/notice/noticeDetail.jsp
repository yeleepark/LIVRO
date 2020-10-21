<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 디테일</title>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/tui-editor/dist/tui-editor.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp"/>
	<div>
		<div>${dto.member_id }</div>
		<div>${dto.notice_title }</div>
		<div>
			<div id="viewer" ></div>
		</div>
		<div>
			<input type="button" value="목록" onclick="location.href='notice.do'">
			<input type="button" value="수정" onclick="location.href='update.do?notice_no=${dto.notice_no}'">
			<input type="button" value="삭제" onclick="location.href='delete.do?notice_no=${dto.notice_no}'">
		</div>
	</div>

	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.js"></script>
	<script>
		const viewer = new toastui.Editor({
			el : document.querySelector('#viewer'),
			initialValue : `${dto.notice_content }`
		});
	</script>


</body>
</html>