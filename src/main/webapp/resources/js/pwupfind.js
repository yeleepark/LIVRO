var member_id = $("#member_id").val();
//비밀번호 정규식 (영문, 숫자, 특문 반드시 포함 / 공백 x / 8~20자리)
var pwR = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

var arr = new Array(pwR);

arr.fill(false);

console.log(arr[0]);
$(document).ready(function(e) {
		$("#member_pw" && "#member_pwchk").keyup(function(e) {
				arr[0] = false;
				//if문에 사용할 비밀번호값을 변수에 저장해줌
				
				var member_pw = $("#member_pw").val().trim();
				var member_pwchk = $("#member_pwchk").val().trim();
	
	if (member_pw != null || member_pw != "" || member_pwchk != "" || member_pwchk != null) {
			//일치여부 확인 , 정규식 검사 후 비밀번호를 사용가능한 문구출력
			console.log(member_pw, member_pwchk);
			if ((pwR.test(member_pw)&& pwR.test(member_pwchk) && (member_pw == member_pwchk))) {
			$('#pwchk_check').text('비밀번호를 사용할 수 있습니다.');
				$('#pwchk_check').css({'color': 'blue','font-size': '12px'});
				$("#chang_btn").css('display','block');
				
				arr[1] = true;
				
				return true;
				
				
			} else if (pwR.test(member_pw) == false && pwR.test(member_pwchk) == false) {
				//정규식을 만족하지 못했을 경우
				$('#pwchk_check').text('비밀번호는 8~15자 이내 문자, 특수문자, 숫자를 반드시 포함해야합니다.');
				$('#pwchk_check').css({'color': 'red','font-size': '12px'});
				
				$("#chang_btn").css('display','none');
				
				$('#chang_btn').keydown(function(e){
					console.log(e.keycode)
					if(e.keyCode === 13){
						e.preventDefault();
					}
				})
			} else {
				//입력된 비밀번호가 일치하지 않을 때
				$('#pwchk_check').text('비밀번호가 일치하지 않습니다.');
				$('#pwchk_check').css({'color': 'red','font-size': '12px'});
				$("#chang_btn").css('display','none');
	
				
				$('#chang_btn').keydown(function(e){
					console.log(e.keycode)
					if(e.keyCode === 13){
						e.preventDefault();
					}
				})
				
			}

		
		
		}
		})
})


window.onload=function(){
	  var chang_btn = document.getElementById('chang_btn');
	  chang_btn.onclick=function(){
	   document.myForm.target= opener.name; //호출하고자하는 부모창의 이름
	   document.myForm.submit(); // 폼 전송
	   self.close(); //창 닫기 
	  }
}
		

	

