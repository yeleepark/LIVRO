<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel ="stylesheet" href="resources/css/notice.css">
<title>LIVRO-공지사항</title>

<!-- <script type="text/javascript" src="resources/js/notice.js"> -->
<script type="text/javascript" src="resources/js/notice.js"></script>
<link rel="stylesheet" href="resources/css/notice.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/header/header.jsp"/> 
	<!-- 리스트 -->
	<div class="board_list_wrap">
		<div class="board_list" >
		<span>공지사항</span>
			<div class="board_list_head">
				<div class="notice_no">번호</div>
				<div class="notice_title">제목</div>
				<div class="notice_writer">관리자</div>
				<div class="notice_date">작성일</div>
			</div>
		<c:choose>
			<c:when test="${empty noticelist }">
				<div class="board_list_body">
					<div>작성된 글	이 없습니다</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${noticelist }" var="noticelist">
				<div class="board_list_body">
					<div class="item">
						<div class="notice_no">${noticelist.notice_no }</div>
						<div class="notice_title"><a href="detail.do?notice_no=${noticelist.notice_no }">${noticelist.notice_title }</a></div>
						<div class="notice_writer">관리자</div>
						<div class="notice_date">
							<fmt:formatDate value="${noticelist.notice_regdate }" pattern = "yyyy-MM-dd"/>
						</div>
					</div>
				</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	</div>
	
<!-- 페이지네이션 -->
	<div id="paginationBox">
		<ul class="pagination">
			<c:if test="${pagination.prev}">
				<li class="page-items"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
			</c:if>
				

			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-items <c:out value="${pagination.page == idx ? 'active1' : ''}"/> ">
					<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
				</li>
			</c:forEach>
				

			<c:if test="${pagination.next}">
				<li class="page-items"><a class="page-link" href="#" onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
			</c:if>
		</ul>
	</div>

	<!-- pagination{e} -->
		<div>

	<!-- 검색 -->
			<div class="board_list_search">
				<form action="noticeSearch.do" method="get">
					<input type="text" name="noticeKeyword" placeholder="글 + 제목 검색">
					<input type="submit" value="검색하기">
				</form>
			</div>
			<div id="insert_block" class="board_list_footer" align="right">
				<c:if test="${logindto.member_role eq 'M'}">
					<input type="button" value="글작성" onclick="location.href='insert.do'">
				</c:if>
			</div>
		</div>
			
			
		</div>



</body>
</html>