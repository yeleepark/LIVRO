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
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header/header.jsp" />

	<section>
		<div class="descContainer">
			<div class="left-side">
				<h2>TOP5</h2>
				<p>설명 뭐라고 하지 어쩌고 저쩌고</p>
			</div>
			<div class="right-side">
				<p>실시간 가장 인기있는 아티스트</p>
			</div>
		</div>
		
		
		<div class="rankContainer">
			<!-- 팔로워랭킹 -->
			<div class="top5">
				<!-- 차트 표시영역 -->
				<div class="top5print"></div>
				<div class="top5list">
				<p class="title">FOLLOWER</p>
					<c:forEach items="${rankdto }" var="rank">
						<div>
							<div class="rank-row">
								<span class="rankSpan">${rank.rank }</span>
								<span class="nickSpan"><a href="artist.do?member_id=${rank.member_id }">
								<i class="far fa-heart"></i>  ${rank.member_nickname } </a></span>
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
				<div class="supportPrint"></div>
				<div class="supportlist">
					<p class="title">SUPPORT</p>
					<c:forEach items="${supportdto }" var="support">
						<div class="support-row">
							<span class="rankSpan">${support.rank }</span>
							<span class="nickSpan"><a href="artist.do?member_id=${support.member_id }">
							<i class="far fa-heart"></i>  ${support.member_nickname } </a></span>
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