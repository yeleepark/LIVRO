<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아티스트 채널, 실시간 방송 리스트</title>
</head>
<style>
	section{
		padding-top : 80px;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp"/>
	
	<section>
		<h1>아티스트 채널 리스트</h1>
		<div>
			<c:choose>
				<c:when test="${empty map }">
					<div>
						<span>검색값이 없습니다</span>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${map.memberlist }" var="memberdto" >
						<div>
						<p><a href="artist.do?member_id=${memberdto.member_id }">${memberdto.member_nickname }</a></p>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<hr/>
		<h1>실시간 방송 리스트</h1>
		<div>
			<c:choose>
				<c:when test="${empty map }">
					<div>
						<span>검색값이 없습니다</span>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${map.broadlist }" var="broadcastdto" >
						<div>
						<p>
							${broadcastdto.broadcast_title }
						</p>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
</body>
</html>