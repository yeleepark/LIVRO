<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/login.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous" defer></script>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<title>LIVRO-로그인</title>
</head>
<body>
	<section>
		<div class="login-wrapper">
			<h2>Welcome!</h2>
			<form action="#">
				<input type="text" id="user" name="" autocomplete="off" placeholder="&#xf2bd; User ID">
				<input type="password" id="password" name="" autocomplete="off" placeholder="&#xf2bd; Password"> 
				<input type="submit" value="Log In" onclick="#" id="goLoginBtn"> 
				<span> 
					<a href="#">Don't have an Account?</a> 
					<a href="#">ID/PW찾기</a>
				</span>
			</form>
		</div>
	</section>
</body>
</html>