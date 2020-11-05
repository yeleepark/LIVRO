<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID PW Find</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/find.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js" scrossorigin="anonymous" defer></script>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript" src="resources/js/find.js">
</script>


</head>
<body>

	<section>
		<div class="id-wrapper">
			<h2>ID 찾기</h2>
			<input type="text" name="member_name" autocomplete="off"
				id="member_name" placeholder="&#xf2bd; Name" /> <input type="text"
				name="member_phone" autocomplete="off" id="member_phone"
				placeholder="&#xf2bd; Phone)01022339988" />
			<div id="idalert"></div>
			<input type="button" id="idBtn" value="Go to Find" onclick="idChk()" />
			<span> <a href="registForm.do">Don't have an Account?</a> <a
				href="loginForm.do">LOGIN</a> <a href="main.do">홈으로</a>
			</span>

		</div>


		<div class="pw-wrapper">
			<h2>PW 찾기</h2>
			
			<input type="text" name="member_id" autocomplete="off" id="member_id" placeholder="&#xf2bd; User id" /> 
			
			<input type="text"	name="member_email" autocomplete="off" id="member_email" placeholder="&#xf2bd; Email" />
			<div id="pwalert"></div>
			<input type="button" id="pwBtn" value="Go to Find" onclick="pwChk()">
			<span> <a href="registForm.do">Don't have an Account?</a>
			 <a href="loginForm.do">LOGIN</a> 
				<a href="main.do">홈으로</a>
			</span>
			<div id="keyalert">
				<input type="text" id="input_email_code" placeholder="&#xf2bd; 인증번호입력" /> 
				<input type="button" class="chkBtn" value="인증번호 확인" onclick="CodeChk();">
			</div>
			<div class="msg_check" id="email_check"></div>
		
		</div>
	</section>


</body>
</html>






