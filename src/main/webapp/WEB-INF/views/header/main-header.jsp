<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header</title>
<link rel="stylesheet" href="resources/css/main-header.css" type="text/css">
<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
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
			<input type="button" value="Login" id="loginForm" onclick="location.href='loginForm.do'"> 
			<input type="button" value="Regist" id="registForm" onclick="location.href='registForm.do'">
			<nav role="navigation">
				<span id="menuIcon"><i class="fas fa-bars"></i></span>
				<ul class="side-bar">
					<li class="lists"><a href="#">LOGIN</a></li>
					<li class="lists"><a href="#">REGIST</a></li>
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