<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/qnalist.css">
<title>LIVRO-Q&A</title>
</head>
<!-- 번호 제목 작성자 작성일  -->
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp" />
	<div class="board_list_wrap">
		<div class="board_list">
			<div class="board_list_head">
				<div class="qna_no">번호</div>
				<div class="qna_title">제목</div>
				<div class="qna_writer">작성자</div>
				<div class="qna_date">작성일</div>
			</div>
			<c:choose>
				<c:when test="${empty qnalist }">
					<div class="board_list_body">
						<div>작성된 글이 없습니다.</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${qnalist }" var="qnadto">
						<div class="board_list_body">
							<div class="item">
								<div class="qna_no">${qnadto.qna_no }</div>
								<div class="qna_title">
									<a href="#">${qnadto.qna_title }</a>
								</div>
								<div class="qna_writer">${qnadto.member_nickname }</div>
								<div class="qna_date">${qnadto.qna_regdate }</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<div class="board_list_footer">
				<input type="button" value="내가 쓴 글" onclick="#"> 
				<input type="button" value="글쓰기" onclick="#">
			</div>
			
			<div class="board_list_search">
				<input type="text" placeholder="검색"/>
			</div>
		</div>
	</div>

</body>
</html>