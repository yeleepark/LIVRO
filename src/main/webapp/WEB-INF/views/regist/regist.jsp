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
<script type="text/javascript">
	//정규식
	
	//모든 공백 체크 정규식
	var empR = /\s/g;
	//아이디 정규식(5~20자의 영문 소문자, 숫자와 특수문자(-),(_)만 사용가능)
	var idR = /^[a-z0-9][a-z0-9_\-]{4,20}$/;
	//비밀번호 정규식(4~12자리 숫자, 문자로만 사용가능)
	var pwR = /^[A-Za-z0-9]{4,12}$/;
	//이름 정규식(한글2~6자 이내 특수기호, 공백사용안돼)
	var nameR = /^[가-힣]{2,6}|[a-zA-Z]{2,10}\s[a-zA-Z][2,10]$/;
	//이메일 검사 정규식
	var mailR = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰번호 정규식
	var phoneR = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	/* $(document).ready(function(){
		
		//아이디 중복확인
		$("#member_id").blur(function(){
			if(("#member_id").val()==''){
				$("#id_check").text("아이디를 입력하세요.");
				$("#id_check").css("color", "red");
			}else if(idR.test($("#member_id").val()!=true)){
				$("#id_check").text("5~20자의 영문소문자, 숫자만 사용가능합니다.");
				$("#id_check").css("color","red");
			}else if($("#member_id").val()!=''){
				$.ajax({
					async: true,
					type : 'POST',
					data : member_id //member_id라는 이름으로 member_id라는 데이터를 controller.do에 보냄
					urlc
				})
			}
			
		})
	}); */
	function idChk(){
		id = $("#member_id").val();
		
		$.ajax({
			url : 'idChk',
			type: 'POST',
			dataType : 'text' //서버로부터 내가 받는 데이터의 타입 
			contentType : 'text/html; charset=UTF-8' , //내가 서버로 보내는 데이터 타입
			data : id,
			success : function(data){
				if(data==0){
					console.log("아이디 없음");
					alert("사용하실 수 있는 아이디입니다.");
					
				}else{
					console.log("아이디 있음");
					alert("중복된 아이디가 존재합니다.");
				},
				error : function(){
					alert("통신실패");
				}
				
			}
		});
	}
</script>
</head>
<body>
	<section>
		<div class="join-wrapper">
			<h2>Sign Up!</h2>
			<form action="join.do" method="post">
				<div class="join-left">
					<div>
						<label for=member_id>아이디</label><input type="text" id="member_id"
							autocomplete="off" /> <input type="button" class="joinChkBtn"
							value="중복확인" onclick="idChk();">
						<div class="msg_check" id="id_check"></div>
					</div>
					<div>
						<label for=member_pw>비밀번호</label><input type="password"
							id="member_pw" autocomplete="off" />
						<div class="msg_check" id="pw_check"></div>
					</div>
					<div>
						<label for=member_pwchk>비밀번호 확인</label><input type="password"
							id="member_pwchk" /> <input type="button" class="joinChkBtn"
							value="중복확인">
						<div class="msg_check" id="pwchk_check"></div>
					</div>
					<div>
						<label for=member_name>이름</label><input type="text"
							id="member_name" />
						<div class="msg_check" id="name_check"></div>
					</div>
					<div>
						<label for=member_nickname>닉네임</label> <input type="text"
							id="member_nickname" /> <input type="button" class="joinChkBtn"
							value="중복확인">
						<div class="msg_check" id="nickname_check"></div>
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
							id="member_email" placeholder="ex)livro@naver.com" /> <input
							type="button" class="joinChkBtn" value="이메일인증">
						<div class="msg_check" id="email_check"></div>
					</div>
					<div>

						<label for=member_phone>휴대폰번호</label><input type="text"
							id="member_phone" placeholder="-생략하고 입력해주세요." />
						<div class="msg_check" id="phone_check"></div>
					</div>


					<!-- <input value="Agree" type="checkbox" id="" name="Agree" /> Agree
					to terms and conditions ( 회원가입 동의 ) <span> <br> -->
					<input type="submit" value="Sign Up" onclick="" id="confirm"
						class="goJoinBtn">
					<!-- </span> -->
				</div>
			</form>
		</div>
	</section>
</body>
</html>







