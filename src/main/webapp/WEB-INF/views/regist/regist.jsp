<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/join.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js"
	crossorigin="anonymous" defer></script>
<!-- google font -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<title>LIVRO-회원가입</title>
</head>
<body>
	<section>
		<div class="join-wrapper">
			<h2>Sign Up!</h2>
			<form action="">
				<div class="join-left">
					<div>
						<label for=member_id>아이디</label><input type="text" id="member_id"
							autocomplete="off" />
					</div>
					<div>
						<label for=member_pw>비밀번호</label><input type="password"
							id="member_pw" autocomplete="off" />
					</div>
					<div>
						<label for=member_pwchk>비밀번호 확인</label><input type="password"
							id="member_pwchk" /> <input type="button"
							class="joinChkBtn" value="중복확인">
					</div>
					<div>
						<label for=member_name>이름</label><input type="text"
							id="member_name" />
					</div>
					<div>
						<label for=member_nickname>닉네임</label> <input type="text"
							id="member_nickname" /> <input type="button" class="joinChkBtn"
							value="중복확인">
					</div>
				</div>
				<div class=join-right>

					<div>
						<label for="member_addr">주소</label> <input placeholder="우편번호"
							type="text" readonly="readonly" id="member_addr">
						<button type="button" class="joinChkBtn" onclick="execPostCode();">
							<i class="fa fa-search"></i> 우편번호 찾기
						</button>
					</div>
					<div>
						<input placeholder="도로명 주소" name="member_addr" id="member_addr"
							type="text" readonly="readonly" />
					</div>
					<div>
						<input placeholder="상세주소" type="text" name="member_detailaddress"
							id="member_detailaddress" />
					</div>



					<div>
						<label for=member_email>이메일</label> <input type="text"
							id="member_email" placeholder="ex)livro@naver.com"/>
					</div>
					<div>

						<label for=member_phone>휴대폰번호</label><input type="text"
							id="member_phone" placeholder="-생략하고 입력해주세요."/>
					</div>


					<!-- <input value="Agree" type="checkbox" id="" name="Agree" /> Agree
					to terms and conditions ( 회원가입 동의 ) <span> <br> --><input
						type="submit" value="Sign Up" onclick="" id="confirm"
						class="goJoinBtn">
					<!-- </span> -->
				</div>
			</form>
		</div>
	</section>
</body>
</html>







