<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header</title>
<link rel="stylesheet" href="header.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>

	<header role="header">
		<div class="header-bar header-left">
			<a href="#">LIVRO</a>
		</div>

		<div class="header-bar header-center">
			<input type="text" placeholder="search" id="searchForm">
			<button type="submit" id="searchBtn">
				<i class="fas fa-search"></i>
			</button>
		</div>

		<div class="header-bar header-right">
			<input type="button" value="Login" id="loginForm" onclick="#"> 
			<input type="button" value="Regist" id="registForm" onclick="#">
			<nav role="navigation">
				<span id="menuIcon"><i class="fas fa-bars"></i></span>
				<ul class="side-bar">
					<li><a href="#">NOTICE</a></li>
					<li><a href="#">Q&A</a></li>
					<li><a href="#">LIVE</a></li>
					<li><a href="#">FOLLOWING</a></li>
					<li><a href="#">RANKING</a></li>
				</ul>
			</nav>
		</div>
	</header>

<script src="resources/js/main.js"></script>
</body>
</html>