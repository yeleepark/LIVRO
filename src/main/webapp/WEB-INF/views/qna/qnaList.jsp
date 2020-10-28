<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js"
	crossorigin="anonymous" defer></script>
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

 function alertMsg(){
		alert("해당 글은 작성자만 볼 수 있습니다.");
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
								<c:choose>
									<c:when test="${qnalist.qna_secret eq 'Y' }">
										<div class="qna_title">
											<c:choose>
												<c:when
													test="${logindto.member_nickname eq qnalist.member_nickname }">
													<a href="qnadetail.do?qna_no=${qnalist.qna_no }">${qnalist.qna_title }</a>
												</c:when>
												<c:otherwise>
													<i class="fas fa-lock"></i>
													<a href="#" onclick="alertMsg()">비밀글입니다.</a>
												</c:otherwise>
											</c:choose>
										</div>
									</c:when>
									<c:otherwise>
										<div class="qna_title">
											<a href="qnadetail.do?qna_no=${qnalist.qna_no }">${qnalist.qna_title }</a>
										</div>
									</c:otherwise>
								</c:choose>
								<div class="qna_writer">${qnalist.member_nickname }</div>
								<div class="qna_date">
									<fmt:formatDate value="${qnalist.qna_regdate }"
										pattern="yyyy-MM-dd" />
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<!-- 버튼 -->
			<div class="board_list_footer">
				<input type="button" value="내가 쓴 글" onclick="#">
				<c:choose>
					<c:when test="${empty logindto }">
						<input type="button" value="글쓰기" onclick="chkRole();">
					</c:when>
					<c:otherwise>
						<input type="button" value="글쓰기"
							onclick="location.href='qnainsertform.do'">
					</c:otherwise>
				</c:choose>

			</div>
			<!--검색-->
			<div class="board_list_search">
				<form action="qnasearch.do" method="post">
					<select name="qnaselect">
						<option value="qna_search_title">제목</option>
						<option valeu="qna_search_writer">작성자</option>
					</select> <input type="text" placeholder="검색" name="qnasearch" /> <input
						type="submit" value="검색" />
				</form>
			</div>
		</div>
	</div>

</body>
</html>