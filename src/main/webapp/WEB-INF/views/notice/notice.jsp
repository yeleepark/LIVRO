<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIVRO-공지사항</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp"/>
	
	<div id="table">
		<c:choose>
		<c:when test="${empty list }">
		<div class="rows">
			<span>작성된 글이 없습니다</span>
		</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto">
				<div class="rows">
					<span>${dto.notice_no }</span>
					<span><a href="detail.do?notice_no=${dto.notice_no }">${dto.notice_title }</a></span>
					<span>${dto.member_id }</span>
					<span>${dto.notice_regdate }</span>
				</div>
			</c:forEach>
		</c:otherwise>
		</c:choose>
		<div id="lastRow">
			<input type="button" value="글작성" onclick="#">
		</div>
	</div>

</body>
</html>