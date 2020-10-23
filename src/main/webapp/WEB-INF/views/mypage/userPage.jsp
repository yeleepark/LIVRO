<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/userPage.css">
<script type="text/javascript"src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header/header.jsp" />

	<section>
		<div class="mypage-container">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">정보수정</li>
				<li class="tab-link" data-tab="tab-2">팔로우목록</li>
				<li class="tab-link" data-tab="tab-3">후원내역조회</li>
				<li class="tab-link" data-tab="tab-4">채널개설</li>
			</ul>
			
			<!-- 회원 정보 수정 탭 -->
			<div class="tab-content current" id="tab-1">
				<h2><i class="fas fa-lock"></i> 정보수정</h2>
				<div class="tab-1-container">
					<div class="tab-1-left">
						<label for ="member_id">아이디</label>
						<input type="text" name="member_id" value="${logindto.member_id }" readonly="readonly">
						<label for ="member_nickname">닉네임</label>
						<input type="text" name="member_nickname" value="${logindto.member_id }">
						<label for ="member_email">이메일</label>
						<input type="text" name="member_email" value="${logindto.member_email }">
						<label for ="member_addr">주소</label>
						<input type="text" name="member_addr" value="${logindto.member_addr }">
						<label for ="member_phone">전화번호</label>
						<input type="text" name="member_phone" value="${logindto.member_phone }">
						<input type="button" value="수정">
					</div>
					<div class="tab-1-right">
						<p>프로필 사진</p>
						<p>서버에 저장된 프로필 사진 이름 : ${profiledto.profile_savedname }</p>
						<p>프로필 사진의 실제 파일 이름 : ${profiledto.profile_realname }</p>
						<p>프로필 사진 등록된 시간 : ${profiledto.profile_regdate }</p>
						<%-- <p>${profiledto.profile_profile_path }</p> --%>
						<%-- <img src="/var/lib/tomcat9/webapps/livro/profile/${profiledto.profile_path }"> --%>
						<input type="file" value="프로필사진수정" onclick="location.href='profileUpdate.do'">	
					</div>
				</div>
			</div>
			
			<!-- 팔로우 목록 탭 -->
			<div class="tab-content" id="tab-2">
				<h2><i class="fas fa-users"></i> 팔로우 목록</h2>
			</div>
			
			<!-- 후원 내역 조회 탭 -->
			<div class="tab-content" id="tab-3">
				<h2><i class="fas fa-hand-holding-usd"></i> 후원 내역 조회</h2>
			</div>
			
			<!-- 아티스트 채널 탭 -->
			<div class="tab-content" id="tab-4">
				<h2><i class="fas fa-sliders-h"></i> 아티스트 채널 개설</h2>
				<div class="tab-4-container">
					<div class="uploadProfile">	
					<form action="">
						<label for ="member_id">아이디</label>
						<input type="text" name="member_id" value="${logindto.member_id }" disabled="disabled">
						<label for ="member_nickname">닉네임</label>
						<input type="text" name="member_nickname" value="${logindto.member_nickname }" disabled="disabled">
						<input type="button" value="닉네임변경">
						<label for ="member_email">이메일</label>
						<input type="text" name="member_email" value="${logindto.member_email }" disabled="disabled">
						<input type="submit" value="개설하기">
					</form>
					<input type="button" value="프로필 등록하기" onclick="insertProfile();">
					<p>서버에 저장된 프로필 사진 이름 : ${profiledto.profile_savedname }</p>
					<p>프로필 사진의 실제 파일 이름 : ${profiledto.profile_realname }</p>
					<p>프로필 사진 등록된 시간 : ${profiledto.profile_regdate }</p>
					<input type="button" value="수정하기" onclick="updateProfile();">
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		$(document).ready(function() {

			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			});

		})
		
		   function insertProfile() {
            // window.name = "부모창 이름";            
            window.name = "userPage.do"; //필요한건가?
            
            // window.open("자식창 이름", "불러올 자식 창의 닉네임", "팝업창 옵션");
            window.open("profileForm.do", "insert",
                    "width = 450, height = 320, resizable = no, scrollbars = no, status = no");
        	}
		
			function updateProfile(){
				// window.name = "부모창 이름";            
	            window.name = "userPage.do"; //필요한건가?
	            
	            // window.open("자식창 이름", "불러올 자식 창의 닉네임", "팝업창 옵션");
	            window.open("updateForm.do", "insert",
	                    "width = 450, height = 320, resizable = no, scrollbars = no, status = no");
			}

	</script>
</body>
</html>