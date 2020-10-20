<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 디테일</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp"/>

	<div>
		<div>${dto.member_id }</div>
		<div>${dto.notice_title }</div>
		<div>
			<textarea>${dto.notice_content }</textarea>
		</div>
		<div>
			<input type="button" value="목록" onclick="location.href='list.do'">
			<input type="button" value="수정" onclick="location.href='update.do'">
			<input type="button" value="삭제" onclick="location.href='delete.do?notice_no=${dto.notice_no}'">
		</div>
	</div>

</body>
</html>