<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/login.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js"
	crossorigin="anonymous" defer></script>
<!-- google font -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<title>LIVRO-로그인</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/login.js">
</script>
</head>
<body>
	<section>
		<div class="login-wrapper">
			<h2>Welcome!</h2>
		
			<input type="text" name="member_id" autocomplete="off" id="member_id" placeholder="&#xf2bd; User ID"> 
			<input type="password" name="member_pw" autocomplete="off" id="member_pw" placeholder="&#xf2bd; Password">
			
			<div id="logincheck"></div>
			<input type="button" value="Log In" id="goLoginBtn" onclick="loginChk()"> 
			<span> 
				<a href="registForm.do">Don't have an Account?</a> 
				<a href="findForm.do">ID/PW찾기</a> 
				<a href="main.do">홈으로</a>
			</span>

			<div class="Naver">
				<a href="${naver}"> 
				<img id="naverimg" alt="Naver" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"></a>
			</div>
			<div>
				<a href="${google} }"> 
				<img alt="Google" id="googleimg" src ="https://developers.google.com/identity/images/btn_google_signin_light_normal_web.png?hl=ko">
				</a>
			</div>
		</div>

	</section>
<body>
</body>
</body>
</html>