<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="resources/css/rank.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- moment -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header/header.jsp" />

	<section>
		<div class="descContainer">
			<div class="left-side">
				<h2><i class="fas fa-crown"></i> TOP5</h2>
			</div>
			<div class="right-side">
				<p id="new-title"> <i class="fas fa-child"></i> New Artist</p>
				<c:forEach items="${newdto }" var="newdto">
					<p id="welcome"><a href="artist.do?member_id=${newdto.member_id }">${newdto.member_nickname } 님</a>(<span id="regdatePrint"></span>)</p>
					<input type="hidden" value="${newdto.regdate }" id="newRegdate">
				</c:forEach>
				<c:if test="${logindto.member_role == 'U' }">
					<input type="button" value="채널개설" onclick="location.href='mypageIndex.do'">
				</c:if>
			</div>
		</div>
		
		<div class="rankContainer">
			<!-- 팔로워랭킹 -->
			<div class="top5">
				<!-- 차트 표시영역 -->
				<div class="top5print">
				<div class="title">FOLLOWER TOP5</div>
				<div class="updatePrint">UPDATE : <p class="updateTime"></p></div>
				</div>
				<div class="top5list">
					<c:forEach items="${rankdto }" var="rank">
						<div>
							<div class="rank-row">
								<span class="rankSpan">${rank.rank }</span>
								<span class="nickSpan"><a href="artist.do?member_id=${rank.member_id }">
								${rank.member_nickname } </a></span>
								<span class="descSpan">
								<i class="fas fa-people-arrows"></i> ${rank.count }명이 팔로우하고 있어요</span>
								<span class="artistSpan"><a href="artist.do?member_id=${rank.member_id }">
								<i class="fas fa-chevron-right"></i> 방문</a></span>
							</div>
							<input type="hidden" value="${rank.member_id }" class="top5id"> 
							<input type="hidden" value="${rank.rank }" class="top5rank"> 
							<input type="hidden" value="${rank.count }" class="top5count"> 
							<input type="hidden" value="${rank.member_nickname }" class="top5nick">
						</div>
					</c:forEach>
				</div>
			</div>
			
			<!-- 서포트 게시물 표시영역 -->
			<div class="support">
				<!-- 차트 표시영역 -->
				
				<div class="supportPrint">
					<div class="title">SUPPORT TOP5</div>
					<div class="updatePrint">UPDATE : <p class="updateTime"></p></div>
				</div>
				<div class="supportlist">
					<c:forEach items="${supportdto }" var="support">
						<div class="support-row">
							<span class="rankSpan">${support.rank }</span>
							<span class="nickSpan"><a href="artist.do?member_id=${support.member_id }">
							 ${support.member_nickname } </a></span>
							<span class="descSpan">${support.allCount }개의 응원글이 있어요</span>
							<span class="artistSpan"><a href="artist.do?member_id=${support.member_id }">
							<i class="fas fa-chevron-right"></i> 방문</a></span>
						</div>
						<input type="hidden" value="${support.member_id }" class="artistId">
						<input type="hidden" value="${support.member_nickname }" class="artistNick">
						<input type="hidden" value="${support.allCount }" class="supportCount">
						<input type="hidden" value="${support.rank }" class="supportRank">
					</c:forEach>
				</div>
			</div>
		</div>
		


		<script src="https://d3js.org/d3.v6.min.js"></script>
		<script type="text/javascript" src="resources/js/rank.js"></script>

	</section>
</body>
</html>