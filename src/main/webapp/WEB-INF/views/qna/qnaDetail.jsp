<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/tui-editor/dist/tui-editor.css" />
<link rel="stylesheet" href="resources/css/qna_detail.css">
<title>Q&A-글상세</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp" />
	<div class="qna_detail_wrap">
		<div>
			<div class="qna_title_wrap">${qnadetaildto.qna_title }</div>
			<div class="qna_nick_wrap">${qnadetaildto.member_nickname }
				<fmt:formatDate value="${qnadetaildto.qna_regdate }"
					pattern="yy-MM-dd HH:mm" />
			</div>

		</div>

		<div class="qna_content_wrap">
			<div id="viewer"></div>
		</div>

		<div class="qna_reply_wrap">
			<div>
				<div>닉넴 날짜</div>
				<div>댓글내용</div>
			</div>
			<div class="qna_input_reply">
				<input type="text" placeholder="댓글은 관리지만 등록할 수 있습니다."> <input
					type="submit" value="입력">
			</div>
		</div>

		<div class="qna_btn">
			<input type="button" value="목록" onclick="history.go(-1);">
			<c:if
				test="${logindto.member_nickname eq qnadetaildto.member_nickname}">
				<input type="button" value="수정"
					onclick="location.href='qnaupdateform.do?qna_no=${qnadetaildto.qna_no}'">
				<input type="button" value="삭제"
					onclick="location.href='qnadelete.do?qna_no=${qnadetaildto.qna_no}'">
			</c:if>
		</div>

	</div>

	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.js"></script>
	<script>
		const viewer = new toastui.Editor({
			el : document.querySelector('#viewer'),
			initialValue : `${qnadetaildto.qna_content }`
		});
	</script>

</body>
</html>