<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:choose>
		<c:when test="${empty commdto }">
			<section class="replySection">
				<p>작성된 댓글이 없습니다</p>
			</section>
		</c:when>
		<c:otherwise>
			<c:forEach items="${commdto }" var="dto">
				<section class="replySection">
					<div class="rows-left">
						<p>${dto.member_id }</p>
					</div>
					<div class="rows-center">
						<textarea class="comm_content" readonly="readonly">${dto.comm_content }</textarea>
						<p>${dto.comm_regdate }</p>
					</div>
					<div class="rows-right">
						<input type="button" value="수정" class="replyUpdate" onclick="replyUpdate(this);""> 
						<input type="button" value="완료" class="updateDone" onclick="updateDone(this);"> 
						<input type="button" value="삭제" class="replyDelete" onclick="replyDelete(this);">
						<input type="hidden" value="${dto.comm_no}" class="replyNum">
						<input type="hidden" value="${dto.support_no}" class="supportNum">
					</div>
				</section>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<div class="replyInsertArea">
		<div class="rows-left">
			<p>${logindto.member_id }</p>
		</div>
		<div class="rows-center">
			<textarea class="replyContent"></textarea>
		</div>
		<div class="rows-right">
			<input type="button" value="작성" class="replyInsert" onclick="replyInsert(this);"> 
		</div>
	</div>
	
<input type="hidden" value="${memberdto.member_id }" id="artistId">
<!--  아티스트 아이디 -->
<input type="hidden" value="${logindto.member_id }" id="loginId">
<!-- 로그인 아이디 -->
<input type="hidden" value="${logindto.member_nickname}" id="loginNickname">
<!-- 로그인 아이디 -->
</body>

</html>