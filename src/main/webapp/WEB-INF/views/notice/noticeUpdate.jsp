<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp"/>

	<form action="updateres.do" method="post">
	<input type="hidden" name="member_no" value="${notice_no }">
	<div>
		<div><input type="text" value="${member_id }"></div>
		<div><input type="text" name="notice_title" value="${notice_title }"></div>
		<div>
			<textarea name="notice_content">${notice_content }</textarea>
		</div>
		<div>
			<input type="submit" value="수정">
			<input type="button" value="취소" onclick="location.href='detail.do?notice_no=${notice_no}'">
		</div>
	</div>
	</form>

</body>
</html>