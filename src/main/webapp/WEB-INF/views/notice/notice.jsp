<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel ="stylesheet" href="resources/css/notice.css">
<title>LIVRO-공지사항</title>

<script type="text/javascript">
	// 이전 버튼 이벤트 
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		
		var url = "${pageContext.request.contextPath}/notice.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
		
	}
	
	//페이지 번호 클릭 
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/notice.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
	}
	
	//다음 번호 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		
		var url = "${pageContext.request.contextPath}/notice.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		
		location.href = url;
	}
</script>
<style type="text/css">

	.page-items{
		visibility: visible;
	}

</style>
</head>
<body>
		<jsp:include page="/WEB-INF/views/header/header.jsp"/> 
	
	<div id="table" >
		<div id="firstRow">
			<span>공지사항 번호</span>
			<span>공지사항 제목</span>
			<span>관리자</span>
			<span>작성시간</span>
		</div>
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
		<div id="lastRow" align="right">
			<input type="button" value="글작성" onclick="location.href='insert.do'">
		</div>
	</div>
	

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




</body>
</html>