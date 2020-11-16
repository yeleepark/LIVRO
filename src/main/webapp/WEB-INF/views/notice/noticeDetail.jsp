<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 디테일</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/tui-editor/dist/tui-editor.css" />
<link rel="stylesheet" href="resources/css/noticeDetail.css">

</head>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp" />
	<div class="notice_detail_wrap">
	<p><i class="far fa-bell"></i>공지사항</p>
		<div>
			<div class="notice_title_wrap">${dto.notice_title }</div>
			<div class="notice_id_wrap">관리자</div>
			<div class="notice_date_wrap">
				<fmt:formatDate value="${dto.notice_regdate }"
					pattern="yyyy-MM-dd HH:mm" />
			</div>
		</div>

		<div class="notice_content_wrap">
			<div id="viewer"></div>
		</div>

		<div class="notice_btn">

			<input type="button" class="noticeBtn" value="목록" onclick="location.href='notice.do'">
			<c:if test="${logindto.member_role eq 'M'}">
				<input type="button" class="noticeBtn" value="수정" onclick="location.href='update.do?notice_no=${dto.notice_no}'">
				<input type="button" class="noticeBtn" value="삭제" onclick="location.href='delete.do?notice_no=${dto.notice_no}'">
			</c:if>

		</div>
	</div>




	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.js"></script>
	<script>
		const viewer = new toastui.Editor({
			el : document.querySelector('#viewer'),
			initialValue : `${dto.notice_content }`
		});
	</script>
	<jsp:include page="/WEB-INF/views/footer/footer.jsp" /> 	


</body>
</html>