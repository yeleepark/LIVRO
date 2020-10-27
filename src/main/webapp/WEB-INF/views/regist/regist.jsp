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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<title>LIVRO-회원가입</title>
<script type="text/javascript" src="resources/js/regist.js">
</script>

</head>
<body>
	<section>
		<div class="join-wrapper">
			<h2>Sign Up!</h2>
			<form action="join.do" method="post" id="joinform">
				<div class="join-left">
					<div>
						<label for=member_id>아이디</label><input type="text" id="member_id"
							autocomplete="off" name="member_id"
							title="아이디는 5~20자 이내 소문자,숫자만 사용가능합니다." placeholder="아이디 입력" /> <input
							type="button" class="joinChkBtn" id="idChkBtn" value="중복확인"
							onclick="id_Chk();">
						<div class="msg_check" id="id_check"></div>
					</div>
					<div>
						<label for=member_pw>비밀번호</label><input type="password"
							id="member_pw" autocomplete="off" name="member_pw"
							title="비밀번호는 8~15자 이내 문자, 특수문자, 숫자를 반드시 포함해야합니다."
							placeholder="비밀번호 입력" />
						<div class="msg_check" id="pw_check"></div>
					</div>
					<div>
						<label for=member_pwchk>비밀번호 확인</label><input type="password"
							id="member_pwchk" name="member_pwchk" title="비밀번호를 먼저 입력해주세요."
							placeholder="비밀번호 입력 확인" />
						<div class="msg_check" id="pwchk_check"></div>
					</div>
					<div>
						<label for=member_name>이름</label><input type="text"
							id="member_name" name="member_name"
							title="이름은 2~6자 이내 한글로만 가능합니다." placeholder="이름" />
						<div class="msg_check" id="name_check"></div>
					</div>
					<div>
						<label for=member_nickname>닉네임</label> <input type="text"
							id="member_nickname" name="member_nickname"
							title="닉네임은 3~10자 이내 한글,영문,숫자만 사용가능합니다.(공백사용불가)
							" placeholder="닉네임" /> <input
							type="button" class="joinChkBtn" value="중복확인"
							onclick="nick_Chk();">
						<div class="msg_check" id="nickname_check"></div>
					</div>
				</div>
				<div class=join-right>

					<div>
						<label for="member_addr1">주소</label> <input placeholder="우편번호"
							type="text" readonly="readonly" id="member_postcode"
							name="member_addr1">
						<button type="button" class="joinChkBtn" onclick="execPostCode();">
							<i class="fa fa-search"></i> 우편번호 찾기
						</button>
					</div>
					<div>
						<input placeholder="도로명 주소" id="member_addr" type="text"
							readonly="readonly" name="member_addr2" />
					</div>
					<div>
						<input placeholder="상세주소" type="text" id="member_addrdetail"
							name="member_addr3" />
					</div>



					<div>
						<label for=member_email>이메일</label> <input type="text"
							id="member_email" placeholder="ex)livro@naver.com"
							name="member_email" /> <input type="button" class="joinChkBtn"
							value="이메일인증" id="emailChkBtn" onclick="emailSend();">
						<div class="email_auth_code">
							<label for="email_auth">인증번호</label> <input type="text"
								placeholder="인증번호 입력" id="input_email_auth_code"> <input
								type="button" class="joinChkBtn" value="인증번호 확인"
								onclick="emailCodeChk();">
						</div>
						<div class="msg_check" id="email_check"></div>
					</div>
					<div>

						<label for=member_phone>휴대폰번호</label><input type="text"
							id="member_phone" placeholder="- 생략하고 입력해주세요."
							name="member_phone" />
						<div class="msg_check" id="phone_check"></div>
					</div>


					<!-- <input value="Agree" type="checkbox" id="" name="Agree" /> Agree
					to terms and conditions ( 회원가입 동의 ) <span> <br> -->
					<input type="submit" value="Sign Up" id="confirm" class="goJoinBtn">
					<input type="button" value="홈으로" class="goJoinBtn"
						onclick="historyback();">
					<!-- <span>	<a href="main.do">홈으로</a></span> -->
					<!-- </span> -->

				</div>
			</form>
		</div>
	</section>
</body>
</html>







