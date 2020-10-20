<%
response.setHeader("pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.addHeader("Cache-Control","No-store");
response.setDateHeader("Expires",1L);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header</title>
<link rel="stylesheet" href="resources/css/header.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>

	<header role="header">
		<div class="header-bar header-left">
			<a href="main.do">LIVRO</a>
		</div>

		<div class="header-bar header-center">
			<input type="text" placeholder="search" id="searchForm" name="keyword">
			<button type="submit" id="searchBtn">
				<i class="fas fa-search"></i>
			</button>
		</div>

		<div class="header-bar header-right">
			<c:choose>
			<c:when test="${empty dto }">
				<input type="button" value="Login" id="loginForm" onclick="location.href='loginForm.do'"> 
				<input type="button" value="Regist" id="registForm" onclick="location.href='registForm.do'">
			</c:when>
			<c:otherwise>
				<input type="button" value="LogOut" id="loginForm" onclick="location.href='logout.do'"> 
				<input type="button" value="Mypage" id="registForm" onclick="#">
			</c:otherwise>
			</c:choose>
			<nav role="navigation">
				<span id="menuIcon"><i class="fas fa-bars"></i></span>
				<ul class="side-bar">
					<c:choose>
					<c:when test="${empty dto }">
					<li class="lists"><a href="loginForm.do">LOGIN</a></li>
					<li class="lists"><a href="registForm.do ">REGIST</a></li>
					</c:when>
					<c:otherwise>
					<li class="lists"><a href="logout.do">LOGOUT</a></li>
					</c:otherwise>
					</c:choose>
					<li><a href="notice.do">NOTICE</a></li>
					<li><a href="#">Q&A</a></li>
					<li><a href="broadcast.do">LIVE</a></li>
					<li><a href="#">FOLLOWING</a></li>
					<li><a href="#">RANKING</a></li>
				</ul>
			</nav>
		</div>
	</header>

<script src="resources/js/main.js"></script>
</body>
</html>