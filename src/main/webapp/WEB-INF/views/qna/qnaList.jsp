<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="resources/css/qna_list.css">
<title>LIVRO-Q&A</title>
</head>
<!-- 번호 제목 작성자 작성일  -->
<jsp:include page="/WEB-INF/views/header/header.jsp" />
<body>
	<script type="text/javascript">

function chkRole(){
	alert("로그인 후 이용해주세요!");
	location.href='loginForm.do';
}
</script>
	<div class="board_list_wrap">
		<div class="board_list">
			<div class="board_list_head">
				<div class="qna_no">번호</div>
				<div class="qna_flag">답변여부</div>
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
					<c:forEach items="${qnalist }" var="qnalist">
						<div class="board_list_body">
							<div class="item">
								<div class="qna_no">${qnalist.qna_no }</div>
								<div class="qna_flag">${qnalist.qna_flag }</div>
								<div class="qna_title">
									<a href="qnadetail.do?qna_no=${qnalist.qna_no }">${qnalist.qna_title }</a>
								</div>
								<div class="qna_writer">${qnalist.member_nickname }</div>
								<div class="qna_date">
									<fmt:formatDate value="${qnalist.qna_regdate }" pattern = "yyyy-MM-dd"/>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<div class="board_list_footer">
				<input type="button" value="내가 쓴 글" onclick="#">
				<c:choose>
					<c:when test="${empty logindto }">
						<input type="button" value="글쓰기" onclick="chkRole();">
					</c:when>
					<c:otherwise>
						<input type="button" value="글쓰기" onclick="location.href='qnainsertform.do'">
					</c:otherwise>
				</c:choose>

			</div>

			<div class="board_list_search">
				<input type="text" placeholder="검색" />
			</div>
		</div>
	</div>

</body>
</html>