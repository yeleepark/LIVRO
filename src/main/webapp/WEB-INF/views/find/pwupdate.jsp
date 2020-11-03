<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>새 비밀번호변경</title>
<link rel="stylesheet" href="resources/css/find.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/d28db34e8b.js"
	crossorigin="anonymous" defer></script>
<script type="text/javascript">
	
var member_id = $("#member_id").val();

window.onload=function(){
	  var chang_btn = document.getElementById('chang_btn');
	  chang_btn.onclick=function(){
	   document.myForm.target= opener.name; //호출하고자하는 부모창의 이름
	   document.myForm.submit(); // 폼 전송
	   self.close(); //창 닫기 
	  }
}


</script>


</head>
<body>
	<section>
	<div class="pw">
		<h2>비밀번호 변경</h2>
		<form action="pwupdateres.do" method="POST" name="myForm">
			<input type="hidden" id="member_id" name="member_id" value="${member_id }"> 
			<label for=member_pw>비밀번호</label>
			<input type="password" id="member_pw" autocomplete="off" name="member_pw" placeholder="새 비밀번호 입력" />
			<input type="submit" value="변경" id="chang_btn">


		</form>
	</div>
	</section>
</body>
</html>






