<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
	<c:choose>
		<c:when test="${empty supportdto }">
			<div class="rows">
				<span>작성된 글이 없습니다</span>
			</div>
		</c:when>
		<c:otherwise>
			<div class="countArea">
			<c:forEach items="${supportdto }" var="support" begin="0" end="0">
				<p>총 <span id="listCount">${support.count }</span>개의 게시물이 있습니다</p>
			</c:forEach>
			</div>
			<c:forEach items="${supportdto }" var="support">
				<div class="rows">
					<!-- 첫줄 -->
					<div class="rows-left">
						<p class="writerNick">${support.writer_nickname}</p>
						<input type="hidden" value="${support.writer_id }" class="writerId">
					</div>
					<div class="rows-center">
						<textarea class="change" readonly="readonly">${support.support_content }</textarea>
						<p><fmt:formatDate value="${support.support_regdate }" pattern="yyyy-MM-dd-HH:mm:ss" /></p>
						<input type="hidden" value="${support.support_no }">
					</div>
					<div class="rows-right">
						<input type="hidden" value="${support.support_no }">
						<c:if test="${logindto.member_nickname == support.writer_nickname }">
							<input type="button" value="수정" class="updateBtn" onclick="updateSupport(this);">
							<input type="button" value="완료" class="updateRes" onclick="updateRes(this);">
							<input type="button" value="삭제" class="deleteBtn" onclick="deleteSupport(this);">
							<input type="hidden" value="${support.support_no }" class="supportNo">
						</c:if>
						<c:if test="${logindto.member_role == 'M'}">
							<input type="button" value="삭제" class="deleteBtn" onclick="deleteSupport(this);">
						</c:if>
						<c:choose>
						<c:when test="${empty logindto }"></c:when>
						<c:otherwise>
							<c:if test="${logindto.member_id == support.member_id && support.writer_id != support.member_id 
							|| logindto.member_id != support.writer_id}">
								<input type="button" value="신고" class="reportBtn" onclick="report(this);">
							</c:if>
						</c:otherwise>
						</c:choose>
					</div>
					<!-- 두번째줄 -->
					<div class="rows-middle">
						<div>
								<c:if test="${empty commcount }">
									<input type="button" value="&#xf004" class="showReply" onclick="showReply(this);"> 
									<input type="button" value="&#xf00d" class="closeReply" onclick="closeReply(this);"> 
									<input type="hidden" value="${support.support_no }" class="supportNo">
								</c:if>
								<c:forEach items="${commcount }" var="commcount">
										<%-- 댓글 있을 때 --%>
									<c:if test="${commcount.support_no != support.support_no }">
										<input type="button" value="&#xf004" class="showReply" onclick="showReply(this);"> 
										<input type="button" value="&#xf00d" class="closeReply" onclick="closeReply(this);"> 
										<input type="hidden" value="${support.support_no }" class="supportNo">
									</c:if>
								</c:forEach>
								<c:forEach items="${commcount }" var="commcount">
										<%-- 댓글 있을 때 --%>
									<c:if test="${commcount.support_no == support.support_no }">
											<input type="button" value="&#xf004" class="showReply replyon" onclick="showReply(this);"> 
											<input type="button" value="&#xf00d" class="closeReply" onclick="closeReply(this);"> 
											<input type="hidden" value="${support.support_no }" class="supportNo">
									</c:if>
								</c:forEach>
						</div>
						<!--  반복 부분 -->
						<div class="replyArea"></div>
						<!-- 반복 끝 -->
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</div>
	<div class="showClose">				
			<input type="button" value="Show More" onclick="showMore(this);" class="showMoreBtn">
			<input type="button" value="Close" onclick="closeMore(this);" class="closeMoreBtn">
			<input type="button" value="Show More" onclick="myShowMore(this);" class="myShowMoreBtn">
			<input type="button" value="Close" onclick="myCloseMore(this);" class="myCloseMoreBtn">
	</div>
	
</body>
</html>