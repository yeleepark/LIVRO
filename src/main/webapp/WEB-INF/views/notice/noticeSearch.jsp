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

<script type="text/javascript" src="resources/js/noticeSearch.js">

</script>
<script src="https://kit.fontawesome.com/d28db34e8b.js"
	crossorigin="anonymous" defer></script>

</head>
<body>
		<jsp:include page="/WEB-INF/views/header/header.jsp"/>
	<!-- 검색리스트 -->
	<div class="board_list_wrap">
		<div class="board_list" >
		<span><a href="notice.do"><i class="far fa-bell"></i>공지사항</a></span>
			<div class="board_list_head">
				<div class="notice_no">번호</div>
				<div class="notice_title">제목</div>
				<div class="notice_writer">관리자</div>
				<div class="notice_date">작성일</div>
			</div>
		<c:choose>
		<c:when test="${empty searchlist }">
				<div class="board_list_body">
					<div>작성된 공지사항이 없습니다</div>
				</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${searchlist }" var="searchlist">
				<div class="board_list_body">
					<div class="item">
						<div class="notice_no">${searchlist.notice_no }</div>
						<div class="notice_title"><a href="detail.do?notice_no=${searchlist.notice_no }">${searchlist.notice_title }</a></div>
						<div class="notice_writer">관리자</div>
						<div class="notice_date">
							<fmt:formatDate value="${searchlist.notice_regdate }" pattern = "yyyy-MM-dd"/>
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
			<c:if test="${searchpagination.prev}">
				<li class="page-items"><a class="page-link" href="#" onClick="fn_prev('${searchpagination.page}', '${searchpagination.range}', '${searchpagination.rangeSize}')">Previous</a></li>
			</c:if>
				

			<c:forEach begin="${searchpagination.startPage}" end="${searchpagination.endPage}" var="idx">
				<li class="page-items <c:out value="${searchpagination.page == idx ? 'active1' : ''}"/> ">
					<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${searchpagination.range}', '${searchpagination.rangeSize}')"> ${idx} </a>
				</li>
			</c:forEach>
				

			<c:if test="${searchpagination.next}">
				<li class="page-items"><a class="page-link" href="#" onClick="fn_next('${searchpagination.page}', '${searchpagination.range}', '${searchpagination.rangeSize}')" >Next</a></li>
			</c:if>
		</ul>
	</div>
	<!-- 검색 -->
	<div>
	<div class="board_list_search">
		<form action="noticeSearch.do" method="get">
			<input type="hidden" name="page" value="1">
			<input type="hidden" name="range" value="1">
			<input type="text" class="noticeSearch" name="noticeKeyword" placeholder="글 + 제목">
			<input type="submit" class="noticeBtn" value="검색">
			<input type="button" class="noticeBtn" value="목록" onclick="location.href='notice.do'">
		</form>
	</div>
	<input type="hidden" id="noticeKeyword" value="${searchpagination.noticeKeyword }">

	<!-- pagination{e} -->
	<div class="board_list_footer" align="right">
		<c:if test="${logindto.member_role eq 'M' }">
			<input type="button" class="noticeBtn" value="글작성" onclick="location.href='insert.do'">
		</c:if>
	</div>
	</div>

</div>
	<jsp:include page="/WEB-INF/views/footer/footer.jsp" /> 	


</body>
</html>