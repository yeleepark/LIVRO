<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/artistPage.css">
<script type="text/javascript"src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4"></script>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="resources/js/ChartAjax.js"></script>
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header/header.jsp" />

	<section>
		<div class="mypage-container">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">회원정보수정</li>
				<li class="tab-link" data-tab="tab-2">팔로우목록</li>
				<li class="tab-link" data-tab="tab-3">팔로워목록</li>
				<li class="tab-link" data-tab="tab-4">후원내역조회</li>
				<li class="tab-link" data-tab="tab-5">후원받은조회</li>
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
						<div class="profileImg"><img src="resources/img/BG.jpg" id="profile"></div>
						<%-- <div class="profileImg"><img src="/resources/profileimg/${profiledto.profile_savedname }"></div> --%>
						<p>서버에 저장된 프로필 사진 이름 : ${profiledto.profile_savedname }</p>
						<p>프로필 사진의 실제 파일 이름 : ${profiledto.profile_realname }</p>
						<p>프로필 사진 등록된 시간 : ${profiledto.profile_regdate }</p>
						<input type="button" value="프로필사진수정" onclick="updateProfile();">	
					</div>
				</div>
			</div>
			
			<!-- 팔로우 목록 탭 -->
			<div class="tab-content" id="tab-2">
				<h2><i class="fas fa-users"></i> 팔로우 목록</h2>
				<c:choose>
					<c:when test="${empty followdto }">
						<p>팔로우한 아티스트가 없습니다</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${followdto }" var="follow">
							<p><a href="artist.do?member_id=${follow.artist_id }">
							<c:out value="${follow.artist_nickname }"/></a></p>
							<p><c:out value="${follow.following_date }"/></p>
						</c:forEach>
					</c:otherwise>
				</c:choose>		
			</div>
			
			<!-- 팔로워 목록 탭 -->
			<div class="tab-content" id="tab-3">
				<h2><i class="fas fa-users"></i> 팔로워 목록</h2>
				<c:choose>
					<c:when test="${empty followerdto }">
						<p>나를 팔로우한 사용자가 없습니다</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${followerdto }" var="follower">
							<p><c:out value="${follower.follower_nickname }"/></p>
							<p><c:out value="${follower.follower_date }"/></p>
						</c:forEach>
					</c:otherwise>
				</c:choose>		
			</div>
			
			<!-- 후원내역조회 -->
			<div class="tab-content" id="tab-4">
				<h2><i class="fas fa-hand-holding-usd"></i> 후원 내역 조회</h2>
				<div class="tab-4-container">
					<div class="tab-4-left">
						<div class="tab-4-1">
							<div class="tab-4-1-1">
								<span id="totalPrice">총후원금액</span>
							</div>
							<div id="donaAll" class="tab-4-1-2"></div>
						</div>
						<div class="tap-4-2">
							<input type="button" onclick="horizonBar(chartData)" value="수직바">
							<input type="button" onclick="pie(chartData);" value="파이">
							<input type="hidden" name="member_nickname" value="${logindto.member_nickname}">
							<div class="myCharts">
							<canvas id="myChart" class="chartjs">
								This text is displayed if your browser does not support HTML5 Canvas.
							</canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="tab-content" id="tab-5">
				<h2><i class="fas fa-hand-holding-usd"></i> 후원 받은 조회</h2>
			</div>
			
		</div>
	</section>
	<script src="resources/js/Chart.js"></script>
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
		
		function updateProfile(){
	           window.name = "artistPage.do";
	           window.open("updateForm.do", "insert",
	                       "width = 450, height = 320, resizable = no, scrollbars = no, status = no");
		}

	</script>
</body>
</html>