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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>LIVRO-회원가입</title>
<!-- <script type="text/javascript" src="resources/js/regist.js">

</script> -->
<script type="text/javascript">
//정규식
//모든 공백 체크 정규식
var empR = /\s/g;
//아이디 정규식(5~20자의 영문 소문자, 숫자와 사용가능)
var idR = /^[a-z0-9]{5,20}$/;
//비밀번호 정규식(8~15 특수문자 / 문자 / 숫자 반드시 포함)
var pwR =/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
//이름 정규식(한글2~6자 이내 특수기호, 공백사용안돼)
var nameR = /^[가-힣]{2,6}/;
//닉네임 정규식(한글, 소문자 ,숫자 사용가능 )
var nickR = /^[가-힣a-zA-Z]{2,20}$/;
//이메일 검사 정규식
var mailR = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
// 휴대폰번호 정규식
var phoneR = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/;

$(document).ready(function() {
	//비밀번호 확인 및 정규화
	//비밀번호창과 비밀번호확인창에 둘다 입력을 했을 경우 실행되는 함수 :keyup()
	$("#member_pw" && "#member_pwchk").keyup(function(){
		//if문에 사용할 비밀번호값을 변수에 저장해줌
		var memberpw = $("#member_pw").val().trim();
		var memberpwchk = $("#member_pwchk").val().trim();
		
		
		if(memberpw != null || memberpw !="" || memberpwchk != "" || memberpwchk != null){
			//일치여부 확인 , 정규식 검사 후 비밀번호를 사용가능한 문구출력
			if((pwR.test($("#member_pw").val()) && pwR.test($("#member_pwchk").val()) && (memberpw == memberpwchk))){
				$('#pwchk_check').text('비밀번호를 사용할 수 있습니다.');
				$('#pwchk_check').css({
					'color' : 'blue',
					'font-size' : '13px'
				});
				
			}else if(pwR.test($('#member_pw').val()) == false && pwR.test($('#member_pwchk').val()) == false){
				//정규식을 만족하지 못했을 경우
				$('#pwchk_check').text('비밀번호는 8~15자 이내 문자, 특수문자, 숫자를 반드시 포함해야합니다.');
				$('#pwchk_check').css({
					'color' : 'red',
					'font-size' : '13px'
					});
			
			}
			else{
			//입력된 비밀번호가 일치하지 않을 때
			$('#pwchk_check').text('비밀번호가 일치하지 않습니다.');
			$('#pwchk_check').css({
				'color' : 'red',
				'font-size' : '13px'
				});
			}
					
		}
		
	});

	//이름 정규식 확인 
	$("#member_name").keydown(function(){
		var member_name = $("#member_name").val().trim();
				if(nameR.test($('#member_name').val()) == false){
				$("#name_check").text('이름은 한글만 가능합니다.');
				$('#name_check').css({
					'color' : 'red',
					'font-size' : '13px'
					});
				}else{
					$("#name_check").text('');
				}
		})
	});
	
	

//비밀번호 먼저 입력 후, 비밀번호 확인 창으로 넘어가게끔
function disFunc(){
	alert("비밀번호 먼저 입력해주세요!")
	var memberpw = $("#member_pw").val().trim();
	if(memberpw == null || memberpw == ""){
		$("#member_pw").focus();
	}
	
}

function id_Chk() {
	$.ajax({
		url : "idChk.do",
		type : "post",
		dataType : "json",
		data : {
			"member_id" : $("#member_id").val().trim()
		},
		success : function(data) {
			if (data == 1) {
				$('#id_check').text('사용중인 아이디 입니다.');
				$('#id_check').css({
					'color' : 'red',
					'font-size' : '13px'
				});
			} else {
				if (data == 0 && idR.test($('#member_id').val())) {
					$('#id_check').text('사용가능한 아이디입니다.');
					$('#id_check').css({
						'color' : 'blue',
						'font-size' : '13px'
					});
				} else {
					$('#id_check').text('아이디는 5~20자 이내 소문자,숫자만 사용가능합니다.');
					$('#id_check').css({
						'color' : 'red',
						'font-size' : '13px'
					});
				}
			}
		}
	})
}

//닉네임 중복체크
function nick_Chk(){
	$.ajax({
		url : "nickChk.do",
		type : "post",
		dataType : "json",
		data : {
			"member_nickname" : $("#member_nickname").val().trim()
		},
		success : function(data){
			if(data == 1){
				$('#nickname_check').text('사용중인 닉네임 입니다.');
				$('#nickname_check').css({
					'color' : 'red',
					'font-size' : '13px'
				});
			}else{
				if(data == 0 && nickR.test($("#member_nick").val())){
					$('#nickname_check').text('사용가능한 닉네임입니다.');
					$('#nickname_check').css({
						'color' : 'blue',
						'font-size' : '13px'
					});
				}else{
					$('#nickname_check').text('닉네임은 3~20자 이내 한글,소문자,숫자만 사용가능합니다.');
					$('#nickname_check').css({
						'color' : 'red',
						'font-size' : '13px'
					});
				}
				
			}
			
		}
		
		
	})
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
							autocomplete="off" name="member_id" required="required"
							title="아이디는 5~20자 이내 소문자,숫자만 사용가능합니다." /> <input type="button"
							class="joinChkBtn" id="idChkBtn" value="중복확인" onclick="id_Chk();">
						<div class="msg_check" id="id_check"></div>
					</div>
					<div>
						<label for=member_pw>비밀번호</label><input type="password"
							id="member_pw" autocomplete="off" name="member_pw"
							required="required"
							title="비밀번호는 8~15자 이내 문자, 특수문자, 숫자를 반드시 포함해야합니다." />
						<div class="msg_check" id="pw_check"></div>
					</div>
					<div>
						<label for=member_pwchk>비밀번호 확인</label><input type="password"
							id="member_pwchk" name="member_pwchk" required="required"
							title="비밀번호를 먼저 입력해주세요." onclick="disFunc();"/>
						<div class="msg_check" id="pwchk_check"></div>
					</div>
					<div>
						<label for=member_name>이름</label><input type="text"
							id="member_name" name="member_name" required="required"
							title="이름은 2~6자 이내 한글로만 가능합니다." />
						<div class="msg_check" id="name_check"></div>
					</div>
					<div>
						<label for=member_nickname>닉네임</label> <input type="text"
							id="member_nickname" name="member_nickname" required="required"
							title="닉네임은 4~20자 이내 한글,소문자,숫자만 사용가능합니다." /> <input
							type="button" class="joinChkBtn" value="중복확인" onclick="nick_Chk();">
						<div class="msg_check" id="nickname_check"></div>
					</div>
				</div>
				<div class=join-right>

					<div>
						<label for="member_addr">주소</label> <input placeholder="우편번호"
							type="text" readonly="readonly" id="member_addr"
							required="required">
						<button type="button" class="joinChkBtn" onclick="execPostCode();">
							<i class="fa fa-search"></i> 우편번호 찾기
						</button>
					</div>
					<div>
						<input placeholder="도로명 주소" id="member_addr" type="text"
							readonly="readonly" required="required" />
					</div>
					<div>
						<input placeholder="상세주소" type="text" id="member_detailaddress"
							name="member_addr" required="required" />
					</div>



					<div>
						<label for=member_email>이메일</label> <input type="text"
							id="member_email" placeholder="ex)livro@naver.com"
							name="member_email" required="required" /> <input type="button"
							class="joinChkBtn" value="이메일인증">
						<div class="msg_check" id="email_check"></div>
					</div>
					<div>

						<label for=member_phone>휴대폰번호</label><input type="text"
							id="member_phone" placeholder="-생략하고 입력해주세요." name="member_phone"
							required="required" />
						<div class="msg_check" id="phone_check"></div>
					</div>


					<!-- <input value="Agree" type="checkbox" id="" name="Agree" /> Agree
					to terms and conditions ( 회원가입 동의 ) <span> <br> -->
					<input type="submit" value="Sign Up" id="confirm" class="goJoinBtn">
					<!-- </span> -->
				</div>
			</form>
		</div>
	</section>
</body>
</html>







