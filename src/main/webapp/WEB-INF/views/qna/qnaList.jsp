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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="resources/css/qna_list.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js"
	crossorigin="anonymous" defer></script>
<title>LIVRO-Q&A</title>
</head>
<!-- 번호 제목 작성자 작성일  -->
<jsp:include page="/WEB-INF/views/header/header.jsp" />
<script type="text/javascript" src="resources/js/qnaList.js">
</script>

<body>
	<div class="board_list_wrap">
		<div class="board_list">
			<span>Q&A</span>
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
								<div class="qna_flag">
									<c:choose>
										<c:when test="${qnalist.qna_flag eq 'N'}">
											<div>답변대기</div>
										</c:when>
										<c:otherwise>
											<div>답변완료</div>
										</c:otherwise>
									</c:choose>
								</div>
								<c:choose>
									<c:when test="${qnalist.qna_secret eq 'Y' }">
										<div class="qna_title">
											<c:choose>
												<c:when
													test="${logindto.member_nickname eq qnalist.member_nickname  || logindto.member_role eq 'M'}">
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
			<div id="paginationBox">
				<ul class="pagination">
					<c:if test="${pagination.prev}">
						<li class="page-items"><a class="page-link" href="#"
							onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
						</li>
					</c:if>
					<c:forEach begin="${pagination.startPage}"
						end="${pagination.endPage}" var="idx">
						<li
							class="page-items 
							<c:out value="${pagination.page == idx ? 'qnaactive' : ''}"/> ">
							<a class="page-link" href="#"
							onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
								${idx} </a>
						</li>
					</c:forEach>
					<c:if test="${pagination.next}">
						<li class="page-items"><a class="page-link" href="#"
							onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
			<!-- pagination{e} -->
			<!--검색-->
			<div class="board_list_search">
				<form action="qnalist.do" method="get">
					<select name="searchType" id="searchType">
						<option value="title">제목</option>
						<option value="writer">작성자</option>
					</select> 
					<input type="text" placeholder="검색" name="keyword" id="keyword" />
					<input type="submit" value="검색" id="btnSearch" class="qna_list_btn"/>
				</form>
			</div>

			<!-- 버튼 -->
			<div class="board_list_footer">
				<input type="button" value="내가 쓴 글" onclick="#" class="qna_list_btn">
				<c:choose>
					<c:when test="${empty logindto }">
						<input type="button" value="글쓰기" onclick="chkRole();" class="qna_list_btn">
					</c:when>
					<c:otherwise>
						<input type="button" value="글쓰기"
							onclick="location.href='qnainsertform.do'" class="qna_list_btn">
					</c:otherwise>
				</c:choose>

			</div>

		</div>
	</div>






</body>
</html>