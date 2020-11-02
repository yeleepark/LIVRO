<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아티스트 채널, 실시간 방송 리스트</title>
<link rel="stylesheet" href="resources/css/search.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp"/>
	<div class="wrapper">
	<div class="search-list">
		<div class="artist-section">
		<h2><i class="fas fa-search"></i> 아티스트 채널 리스트</h2>
			<c:choose>
				<c:when test="${empty map.memberlist }">
					<div>
						<p class="noSearch"><i class="fas fa-times"></i> 검색값이 없습니다</p>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${map.memberlist }" var="memberdto" >
						<div>
						<p><i class="fas fa-chevron-right"></i> <a href="artist.do?member_id=${memberdto.member_id }">${memberdto.member_nickname }</a></p>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="broad-section">
		<h2><i class="fas fa-search"></i> 실시간 방송 리스트</h2>
			<c:choose>
				<c:when test="${empty map.broadlist }">
					<div>
						<p class="noSearch"><i class="fas fa-times"></i> 검색값이 없습니다</p>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${map.broadlist }" var="broadcastdto" >
						<div>
						<p><img src="resources/img/red.png" alt="생방송"> 
							<a href="broadDetail.do?broadcast_no=${broadcastdto.broadcast_no }">${broadcastdto.broadcast_title }</a>
						</p>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="all-list">
		<h2>전체 아티스트 리스트</h2>
		<c:choose>
			<c:when test="${empty map.artistlist }">
				<div>
					<p>아티스트가 없습니다</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${map.artistlist }" var="artistdto">
					<div>
						<p>${artistdto.member_nickname }</p>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	</div>
</body>
</html>