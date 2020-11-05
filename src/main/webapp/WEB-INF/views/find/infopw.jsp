<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userPw</title>
</head>
<body>

<body>
	<section>
		<div class="user_pw">
			<h2>비밀번호 변경</h2>
			<form action="/userPwres" method="POST">
				<input type="hidden" id="member_id" name="member_id" value="${logindto.member_id }"> 
				<input type="hidden" id="member_role" name="member_role" value="${logindto.member_role }">
				
				<label for=member_pw>비밀번호</label> 
				<input type="password" id="member_pw" autocomplete="off" required="required" name="member_pw" placeholder="비밀번호 입력" />
				 
				<label for=member_pw>비밀번호 재입력</label> 
				<input type="password" id="member_pwchk" autocomplete="off" required="required" name="member_pwchk" placeholder="새 비밀번호 재 입력" />
				<div id="pwchk_check"></div>
				<input type="submit" value="변경"> 
			</form>
		</div>
	</section>
	<script type="text/javascript">
	
	//비밀번호 정규식 (영문, 숫자, 특문 반드시 포함 / 공백 x / 8~20자리)
	var pwR = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	var arr = new Array(1);
	arr.fill(false);
	
	$(document).ready(function() {

			$("#member_pw" && "#member_pwchk").keyup(
					function() {
						arr[0] = false;
						//if문에 사용할 비밀번호값을 변수에 저장해줌
						var memberpw = $("#member_pw").val().trim();
						var memberpwchk = $("#member_pwchk").val().trim();

						if (memberpw != null|| memberpw != ""|| memberpwchk != ""|| memberpwchk != null) {
							//일치여부 확인 , 정규식 검사 후 비밀번호를 사용가능한 문구출력
							if ((pwR.test(memberpw)&& pwR.test(memberpwchk) && (memberpw == memberpwchk))) {
								$('#pwchk_check').text('비밀번호를 사용할 수 있습니다.');
								$('#pwchk_check').css({'color': 'blue','font-size': '12px'});
								arr[1] = true;

							} else if (pwR.test(memberpw) == false&& pwR.test(memberpwchk) == false) {
								//정규식을 만족하지 못했을 경우
								$('#pwchk_check').text('비밀번호는 8~15자 이내 문자, 특수문자, 숫자를 반드시 포함해야합니다.');
								$('#pwchk_check').css({'color': 'red','font-size': '12px'});

								return false;
								
							} else {
								//입력된 비밀번호가 일치하지 않을 때
								$('#pwchk_check').text('비밀번호가 일치하지 않습니다.');
								$('#pwchk_check').css({'color': 'red','font-size': '12px'});
							
								return false;
							
							}

						}

					});
	
	
	
	</script>
</body>
</html>