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
			<h2>Sign Up</h2>
			<form action="">
				<div>
					<label for="id">ID</label> <input type="text" id="id"
						placeholder="아이디 입력" />
				</div>
				<div>
					<label for="PW">PW</label> <input type="password" id="password"
						placeholder="비밀번호 입력" />
				</div>
				<div>
					<label for="PW Check">PW Check</label> <input type="password"
						id="passchk" placeholder="비밀번호 확인" /> <input type="button"
						id="passwordkchk" value="Check">
				</div>
				<div>
					<label for="Full name">Full name</label> <input type="text"
						id="name" placeholder="이름 입력" />
				</div>
				<div>
					<label for="Nickname">Nick Name</label> <input type="text"
						id="nickname" placeholder="닉네임 입력" /> <input type="button"
						id="nickchk" value="Check">
				</div>
				<div>
					<label for="Addr">Addr</label> <input type="text" id="addr"
						placeholder="주소 입력" />
				</div>
				<div>
					<label for="Email">Email</label> <input type="text" id="email"
						placeholder="이메일 입력" />
				</div>
				<div>

					<label for="Phone">Phone</label> <input type="text" id="phone"
						placeholder="핸드폰 입력" />
				</div>
				<div class="">
					<input value="Agree" type="checkbox" id="" name="Agree">Agree
					to terms and conditions ( 회원가입 동의 )

				</div>
				<span> <input type="submit" value="Sign Up" onclick=""
					id="confirm">
				</span>
			</form>
		</div>
	</section>
</body>
</html>







