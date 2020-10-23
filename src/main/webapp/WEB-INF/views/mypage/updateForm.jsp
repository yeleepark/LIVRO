<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/updateForm.css">
<title>Insert title here</title>
</head>
<body>
	<form method="post" enctype="multipart/form-data" action="profileUpdate.do" name="updateForm">
		<input type="hidden" name="member_id" value="${logindto.member_id }">
		<label for="profile">프로필 사진을 등록해주세요</label> 
		<input type="file" name="profile" required="required" id="profileImg"> 
		<input type="submit" value="개설" id="submitBtn">
	</form>
	<div class="selectImg"><img src="" /></div>
</body>
<script type="text/javascript"src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

window.onload=function(){
	  var pop_btn = document.getElementById('submitBtn');
	  pop_btn.onclick=function(){
	   document.updateForm.target= opener.name; //호출하고자하는 부모창의 이름
	   document.updateForm.submit(); // 폼 전송
	   self.close(); //창 닫기 
	  }
	 };

$("#profileImg").change(function(){
	if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     	$(".selectImg img").attr("src", data.target.result).width(200);
	     	$(".selectImg img").attr("src", data.target.result).height(200);
    	}
    reader.readAsDataURL(this.files[0]);
    }
});


</script>

</html>