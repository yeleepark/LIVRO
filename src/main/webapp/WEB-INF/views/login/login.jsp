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
<script type="text/javascript">
	/* 	$(function(){
	 //로그인 시 아이디 비밀번호가 틀리면 나타나는 문구를 감싸줄? div 박스
	 $("#logincheck").hide();
	 }); */

	/* 
	최유정 : 다시해..싸발ㅡㅡ !!!
	function loginChk() {
		var member_id = $("#member_id").val().trim();
		var member_pw = $("#member_pw").val().trim();
		
		

		var loginVal = {
			"id" : member_id,
			"pw": member_pw
		}
		

		if (member_id == null || member_id == "" || member_pw == null
				|| member_pw == "") {
			$("#logincheck").html("아이디와 비밀번호를 입력해주세요.").css({
				"color" : "red",
				"font-size" : "15px",
				"font-weight" : "400"
			});
		} else {
			$.ajax({
				type : "post",
				url : "login.do",
				data : JSON.stringify(loginVal),
				contentType : "application/json",
				dataType : "json",
				success : function(msg) {
					if (msg.check) {
						location.href = "/"

					} else {
						$("#logincheck").html("아이디 혹은 비밀번호가 올바르지 않습니다.").css({
							"color" : "red",
							"font-size" : "15px",
							"font-weight" : "400"
						});
					}
				}, 
				error : function(){
					alert("통신실패")
				}
			});
		}
	};  */
</script>
</head>
<body>
	<section>
		<div class="login-wrapper">
			<h2>Welcome!</h2>
			<form action="login.do">
				<input type="text" name="member_id" autocomplete="off"
					id="member_id" placeholder="&#xf2bd; User ID"> <input
					type="password" name="member_pw" autocomplete="off" id="member_pw"
					placeholder="&#xf2bd; Password">
				<div id="logincheck"></div>
				<input type="submit" value="Log In" id="goLoginBtn"
					onclick="loginChk()"> <span> <a href="registForm.do">Don't
						have an Account?</a> <a href="#">ID/PW찾기</a>
				</span>
			</form>
		</div>

	</section>
</body>
</html>