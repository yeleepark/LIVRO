<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/userPage.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header/header.jsp" />

	<section>
		<div class="mypage-container">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">정보수정${userdto.member_id }</li>
				<li class="tab-link" data-tab="tab-2">팔로우목록</li>
				<li class="tab-link" data-tab="tab-3">후원내역조회</li>
				<li class="tab-link" data-tab="tab-4">채널개설</li>
			</ul>
			<div class="tab-content current" id="tab-1">정보수정</div>
			<div class="tab-content" id="tab-2">팔로우 목록</div>
			<div class="tab-content" id="tab-3">후원내역조회</div>
			<div class="tab-content" id="tab-4">
				<p>아티스트 채널 개설</p>
				<!-- <input type="button" value="사진업로드" onclick="popUp();" id="fileBtn"> -->
				<section>
					<form:form method="post" enctype="multipart/form-data"
						modelAttribute="uploadFile" action="profileUpload.do">
						<p>[프로필 사진 업로드]</p>
						<p>이름 : ${logindto.member_id }</p>
						<input type="file" name="profile">
						<input type="hidden" name="member_id"
							value="${logindto.member_id }">
						<br />
						<form:errors path="profile" />
						<br />
						<input type="submit" value="등록">
					</form:form>
				</section>
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
		
		/* function popUp(){
			var url = "profileForm.do";
			var option = "width=300px, height=200px, resizable=no, location=no, top=300px, left=500px";
			window.open(url, "프로필 사진 업로드", option);
		} */
		
	</script>
</body>
</html>