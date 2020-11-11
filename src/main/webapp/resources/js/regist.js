//정규식
//모든 공백 체크 정규식
var empR = /\s/g;
//아이디 정규식(5~20자의 영문 소문자, 숫자와 사용가능)
var idR = /^[a-z0-9]{5,20}$/;
//비밀번호 정규식 (영문, 숫자, 특문 반드시 포함 / 공백 x / 8~20자리)
var pwR = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
//이름 정규식(한글2~6자 이내 특수기호, 공백사용안돼)
var nameR = /^[가-힣]{2,6}/;
//닉네임 정규식(한글, 소문자, 대문자 사용가능 )
var nickR = /^[가-힣a-zA-Z]{3,16}$/;
//이메일 검사 정규식
var mailR = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
//휴대폰번호 정규식
var phoneR = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

//최종 sign up 버튼을 누르기 전, 유효성 검사를 위한 배열선언 
//배열의 모든 번지가 true일 때 sign up버튼 활성화
var arr = new Array(7);
arr.fill(false);

$(document)
	.ready(
		function() {

			//비밀번호 확인 및 정규화
			//비밀번호창과 비밀번호확인창에 둘다 입력을 했을 경우(키보드에서 손을 뗐을때?) 실행되는 함수 :keyup()
			$("#member_pw" && "#member_pwchk")
				.keyup(
					function() {
						arr[1] = false;
						//if문에 사용할 비밀번호값을 변수에 저장해줌
						var memberpw = $("#member_pw")
							.val().trim();
						var memberpwchk = $("#member_pwchk")
							.val().trim();

						if (memberpw != null || memberpw != ""  || memberpwchk != "" || memberpwchk != null) {
							//일치여부 확인 , 정규식 검사 후 비밀번호를 사용가능한 문구출력
							if ((pwR.test(memberpw) && pwR.test(memberpwchk) && (memberpw == memberpwchk))) {
								$('#pwchk_check').text('비밀번호를 사용할 수 있습니다.');
								$('#pwchk_check').css({ 'color': 'blue', 'font-size': '11px' });
								arr[1] = true;

							} else if (pwR.test(memberpw) == false && pwR.test(memberpwchk) == false) {
								//정규식을 만족하지 못했을 경우
								$('#pwchk_check').text('비밀번호는 8~15자 이내 문자, 특수문자, 숫자를 반드시 포함해야합니다.');
								$('#pwchk_check').css({ 'color': 'red', 'font-size': '11px' });

							} else {
								//입력된 비밀번호가 일치하지 않을 때
								$('#pwchk_check').text('비밀번호가 일치하지 않습니다.');
								$('#pwchk_check').css({ 'color': 'red', 'font-size': '11px' });
							}

						}

					});

			//blur : 입력하고 다른 곳을 클릭했을 때 실행되는 함수
			$("#member_pwchk").blur(
				function() {
					if ($("#member_pw").val() != $("#member_pwchk").val()) {
						if ($("#member_pwchk").val() != '') {
							$('#pwchk_check').text('비밀번호를 다시 입력해주세요.');
							$('#pwchk_check').css({ 'color': 'red', 'font-size': '11px' });
							$("#member_pwchk").val('');
							$("#member_pw").focus();
						}
					}
				})

			//이름 정규식 확인 
			//keydown : 입력하고 나서!
			$("#member_name").keydown(function() {
				arr[2] = false;
				var member_name = $("#member_name").val().trim();
				if (nameR.test(member_name) == false) {
					$("#name_check").text('이름은 한글만 가능합니다.');
					$('#name_check').css({
						'color': 'red',
						'font-size': '11px'
					});
				} else {
					$("#name_check").text('');
					arr[2] = true;

				}
			})

			//휴대폰번호 정규식 확인
			$("#member_phone").keydown(function() {
				arr[6] = false;
				var member_phone = $("#member_phone").val().trim();
				if (phoneR.test(member_phone) == false) {
					$("#phone_check").text('휴대폰번호를 다시 입력해주세요.');
					$('#phone_check').css({
						'color': 'red',
						'font-size': '11px'
					});
				} else {
					$("#phone_check").text('');
					arr[6] = true;
				}
			})

			//이메일 정규식
			$("#emailChkBtn").hide(); //이메일 정규식을 만족했을 때 버튼 활성화 시킬 것!
			$("#member_email").keydown(function() {
				arr[5] = false;
				var member_email = $("#member_email").val().trim();
				$.ajax({
					url: "emailChk.do",
					type: "post",
					dataType: "json",
					data: {
						"member_email": member_email
					},
					success: function(data) {
						if (data == 1) {
							$("#email_check").text('이미 존재하는 이메일입니다.');
							$('#email_check').css({
								'color': 'red',
								'font-size': '11px'
							});

						} else {
							if (mailR.test(member_email) == false) {
								$("#email_check").text('올바른 이메일 형식으로 입력해주세요.');
								$('#email_check').css({
									'color': 'red',
									'font-size': '11px'
								});
							} else {
								$("#email_check").text('');
								$("#emailChkBtn").show();
								arr[5] = true;
							}
						}
					},
					error: function(error) {
						alert("통신실패");
					}
				});
			});
		

//이메일 인증번호 입력하는 div 클래스 안 보이게 
$(".email_auth_code").hide();

			$("#confirm").click(function() {
				console.log(arr);
				if (!arr.includes(false)) {
					$("#joinform").submit();
				} else if (!arr[0] == true) {
					alert("아이디 중복확인을 해주십시오.");
					$("#member_id").focus();
					return false;
				} else if (!arr[1] == true) {
					alert("비밀번호를 다시 확인하여주십시오.");
					$("#member_pw").focus();
					return false;
				} else if (!arr[2] == true) {
					alert("이름을 다시 확인하여주십시오.");
					$("#member_name").focus();
					return false;
				} else if (!arr[3] == true) {
					alert("닉네임을 다시 확인하여주십시오.");
					$("#member_pw").focus();
					return false;
				} else if (!arr[4] == true) {
					alert("주소를 다시 확인하여주십시오.");
					$("#member_addr1").focus();
					return false;
				} else if (!arr[5] == true) {
					alert("이메일을 다시 확인하여주십시오.");
					$("#member_email").focus();
					return false;
					S
				} else if (!arr[7] == true) {
					alert("휴대폰번호 다시 확인하여주십시오.");
					$("#member_phone").focus();
					return false;
				}
			});

		});

//아이디 중복확인
function id_Chk() {
	arr[0] = false;
	$.ajax({
		url: "idChk.do",
		type: "post",
		dataType: "json",
		data: {
			"member_id": $("#member_id").val().trim()
		},
		success: function(data) {
			if (data == 1) {
				$('#id_check').text('이미 존재하는 아이디 입니다.');
				$('#id_check').css({
					'color': 'red',
					'font-size': '11px'
				});
			} else {
				if (data == 0 && idR.test($('#member_id').val())) {
					$('#id_check').text('사용가능한 아이디입니다.');
					$('#id_check').css({
						'color': 'blue',
						'font-size': '11px'
					});
					arr[0] = true;
				} else {
					$('#id_check').text('아이디는 5~20자 이내 소문자,숫자만 사용가능합니다.');
					$('#id_check').css({
						'color': 'red',
						'font-size': '11px'
					});
				}
			}
		}
	})
}

//닉네임 중복체크
function nick_Chk() {
	arr[3] = false;
	$.ajax({
		url: "nickChk.do",
		type: "post",
		dataType: "json",
		data: {
			"member_nickname": $("#member_nickname").val().trim()
		},
		success: function(data) {
			if (data == 1) {
				$('#nickname_check').text('이미 존재하는 닉네임 입니다.');
				$('#nickname_check').css({
					'color': 'red',
					'font-size': '11px'
				});

			} else {
				if (nickR.test($("#member_nickname").val())
					&& $("#member_nickname").val().length < 11) {

					$('#nickname_check').text('사용가능한 닉네임입니다.');
					$('#nickname_check').css({
						'color': 'blue',
						'font-size': '11px'
					});

					arr[3] = true;

				} else if ($("#member_nickname").val().length > 10) {

					$('#nickname_check').text('닉네임은 10자 이내로 만들어주세요.');
					$('#nickname_check').css({
						'color': 'red',
						'font-size': '11px'
					});

				} else {
					$('#nickname_check').text(
						'닉네임은 3~10자 이내 한글, 영문만 사용가능합니다.(공백사용불가)');
					$('#nickname_check').css({
						'color': 'red',
						'font-size': '11px'
					});
				}

			}
		}
	})
}

//랜덤코드를 넣어줄 그릇
var emailcode = null;

//이메일 인증번호 전송 후 랜덤코드를 리턴받음
function emailSend() {
	arr[5] = false;
	var member_email = $("#member_email").val().trim();
	$.ajax({
		url: "emailSend.do?member_email=" + member_email,
		type: "get",
		success: function(data) {
			console.log(data)
			alert("이메일을 발송되었습니다. 인증번호를 확인 후 입력하여주십시오.")
			$(".email_auth_code").show();
			$("#input_email_auth_code").focus();
			emailcode = data;
			arr[5] = true;

		},
		error: function(e) {
			alert("이메일 인증에 실패하셨습니다.")
		}
	})
}

//이메일 인증
function emailCodeChk() {
	arr[5] = false;
	var inputemailcode = $("#input_email_auth_code").val().trim();

	if (emailcode == inputemailcode) {
		$("#email_check").text("이메일 인증을 성공했습니다.").css({
			'color': 'blue',
			'font-size': '11px'
		});

		arr[5] = true;

	} else {
		$("#email_check").text("이메일 인증을 실패했습니다. 다시 시도하여주십시오.").css({
			'color': 'red',
			'font-size': '11px'
		});
	}
}

//우편번호찾기
function execPostCode() {
	arr[4] = false;
	new daum.Postcode(
		{
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
						&& /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
						&& data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					//document.getElementById("member_addr").value = extraAddr;

				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('member_postcode').value = data.zonecode;
				document.getElementById("member_addr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("member_addrdetail").focus();
				arr[4] = true;
			}
		}).open();
}