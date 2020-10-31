$(function() {
	$("#logincheck").hide();
});

function loginChk() {

	var member_id = $("#member_id").val().trim();
	var member_pw = $("#member_pw").val().trim();



	var loginVal = {
		"member_id": member_id,
		"member_pw": member_pw
	}

	if (member_id == null || member_id == "" || member_pw == null || member_pw == "") {
		$("#logincheck").show();
		$("#logincheck").html("아이디와 비밀번호를 입력해주세요.").css({
			'color': 'red',
			'font-size': '11px'
		});
	} else {
		$.ajax({
			type: "post",
			url: "login.do",
			data: JSON.stringify(loginVal),
			contentType: "application/json",
			dataType: "json",
			success: function(msg) {
				if (msg.check == true) {
					console.log(msg.logindto.member_enabled);
					location.href = 'success.do';
				} else {
					$("#logincheck").show();
					$("#logincheck").html("아이디 혹은 비밀번호가 올바르지 않습니다").css({
						'color': 'red',
						'font-size': '11px'
					});
				}
			},
			error: function() {
				$("#logincheck").show();
				$("#logincheck").html("아이디 혹은 비밀번호가 올바르지 않습니다").css({
					'color': 'red',
					'font-size': '11px'
				});
			}
		});
	}
}