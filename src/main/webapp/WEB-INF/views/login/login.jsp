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
$(function(){
	$("#logincheck").hide();
});

function loginChk(){
	var member_id = $("#member_id").val().trim(); //아이디 받아오고
	var member_pw = $("#member_pw").val().trim(); //비번 받아오고
	
	var loginVal = {
			"member_id" : member_id,
			"member_pw" : member_pw
	} // 값 넣어주고
	
	console.log(member_id);
	console.log(member_pw); // 콘솔 찍히는지 확인 완.
	
	if(member_id == null || member_id == "" || member_pw == null || member_pw== ""){
		$("#logincheck").show();
		$("#logincheck").html("아이디와 비밀번호를 입력해주세요.").css("color","red");
	} else{
		$.ajax({
            type:"post",
            url : "login.do",
            data : JSON.stringify(loginVal),
            contentType: "application/json",
            dataType : "json", // ->login.do 컨트롤러로 넘어간다~~~~~
            success: function(msg){ // 로그인 성공하면
            	
               if(msg.check==true){ // 컨트롤러에서 받아온 boolean 타입의 check의 값이 true이면
                  location.href ='main.do'; //메인으로
               }else{ // 아니면 = 비밀번호나 아이디가 틀리면
                  $("#logincheck").show(); 
                  $("#logincheck").html("아이디 혹은 비밀번호가 올바르지 않습니다").css("color","red");
               }
            },
            error : function(){
               alert("통신 실패");
            }
         });
	}
}
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
					onclick="loginChk()"> 
					<span> <a href="registForm.do">Don't
						have an Account?</a> <a href="#">ID/PW찾기</a>
						<a href="main.do">홈으로</a>
				</span>
			
			</form>
		</div>

	</section>
</body>
</html>