<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/artist.css">
<link rel="stylesheet" href="resources/css/music.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- toast calendar -->
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />
<title>LIVRO-Artist</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header/header.jsp" />

	<section>
		<div class="left-wrapper">
			<!--탭메뉴 -->
			<ul class="tabs">
				<li class="tab-link tabCurrent" data-tab="tab-1">Music</li>
				<li class="tab-link" data-tab="tab-2">Support</li>
				<li class="tab-link" data-tab="tab-3" id="tab3">Calendar</li>
				<li class="tab-link" data-tab="tab-4">Livro</li>
			</ul>


			<!-- 음원 -->
			<div id="tab-1" class="tab-content tabCurrent">
				<h2>음원</h2>
				<!-- 음원 업로드 공간 -->
				<c:if test="${logindto.member_nickname eq memberdto.member_nickname}">
					<div>
						<form:form method="post" enctype="multipart/form-data" modelAttribute="MusicDto" action="upload.do">
							<input type="hidden" name="member_id" value="${logindto.member_id }">
							<input type="hidden" name="member_nickname" value="${logindto.member_nickname }">
							<div class="file_upload_block">
								<div class="file_upload_wrap1">
									<span class="file_up">파일 업로드</span>
								</div>
								<!-- 파일 -->
								<div class="file_upload_wrap2">
									<input type="file" name="music_file" /> <span style="color: red; font-weight: bold;"> <form:errors path="music_file" /></span>
									<!-- 에러시 문자열 반환 -->
									<input type="text" name="music_content" placeholder="설명문" required="required">
								</div>
								<div class="file_upload_btn">
									<input type="submit" class="uploadBtn" value="send">
								</div>
							</div>
						</form:form>
					</div>
				</c:if>


				<!-- 음원 출력 공간 -->
				<div>
					<div class="music-table">
						<c:choose>
							<c:when test="${empty musicdto }">
								<div class="no_music">업로드된 음원이 없습니다</div>
							</c:when>

							<c:otherwise>
								<c:forEach items="${musicdto }" var="musicdto">
									<div class="music_block">
										<div class="music_tags">
											<div class="music_iconbox">
												<img alt="라이브로 아이콘" src="resources/img/livro_icon.png" class="livro_icon">
											</div>
											<div class="music_explain">
												<p class="music_title_tag">${musicdto.music_title }</p>
												<p class="music_content_tag">${musicdto.music_content }</p>
											</div>
										</div>
										<audio style="width: 90%" controls>
											<source src="resources/audio/${musicdto.music_savename }" class="control_panel" type="audio/mp3">
											이 웹 브라우저가 audio 요소를 지원하지 않습니다!
										</audio>
										<div class="music_delbtn_block">
											<c:if test="${logindto.member_nickname eq memberdto.member_nickname}">
												<input type="button" class="music_del_btn" value="삭제" onclick="location.href='deletemusic.do?member_id=${musicdto.member_id }&music_no=${musicdto.music_no }'">
											</c:if>
										</div>
										<div class="music_nextindex"></div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>

			<!-- 응원 -->
			<div id="tab-2" class="tab-content">
				<div class="supportTable">
					<h2>${memberdto.member_nickname }님께 응원글을 남겨주세요!</h2>

					<c:choose>
						<c:when test="${empty logindto }">
							<div class="support-login">
								<p>
									글 작성을 원하시면 <a href="loginForm.do">로그인</a> 해주세요
								</p>
							</div>
						</c:when>
						<c:otherwise>
							<div class="supportInsert">
								<div>
									<p>${logindto.member_nickname }</p>
								</div>
								<div>
									<textarea name="support_content" id="support_content"></textarea>
								</div>
								<div>
									<input type="button" value="작성" class="insertBtn">
								</div>
							</div>
						</c:otherwise>
					</c:choose>

					<div class="supportDetail">
						<c:choose>
							<c:when test="${empty supportdto }">
								<div class="rows">
									<span>작성된 글이 없습니다</span>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${supportdto }" var="support">
									<div class="rows">
										<!-- 첫줄 -->
										<div class="rows-left">
											<p>${support.member_nickname }</p>
										</div>
										<div class="rows-center">
											<textarea class="change" readonly="readonly">${support.support_content }</textarea>
											<p>${support.support_regdate }</p>
											<input type="hidden" value="${support.support_no }">
										</div>
										<div class="rows-right">
											<input type="hidden" value="${support.support_no }">
											<c:if test="${logindto.member_nickname == support.member_nickname }">
												<input type="button" value="수정" class="updateBtn">
												<input type="button" value="완료" class="updateRes">
												<input type="button" value="삭제" class="deleteBtn">
												<input type="hidden" value="${support.support_no }" class="supportNo">
											</c:if>
										</div>
										<!-- 두번째줄 -->
										<div class="rows-middle">
											<div>
												<input type="button" value="&#xf063" class="showReply">
												<input type="button" value="&#xf00d" class="closeReply">
											</div>
											<!--  반복 부분 -->
											<div class="replyArea">
												
											</div>
											<!-- 반복 끝 -->
											<div class="replyInsertArea">
												<div class="rows-left">
													<p>댓글작성</p>
												</div>
												<div class="rows-center">
													<textarea class="replyContent"></textarea>
												</div>
												<div class="rows-right">
													<input type="button" value="작성" class="replyDone"> 
													<input type="hidden" value="${support.support_no }" class="supportNo">
												</div>
											</div>
										</div>
									</div>
									<!-- 세번째줄 -->

								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>

			<!-- 일정 게시판 탭-->
			<div id="tab-3" class="tab-content">
				<div>
					<h2>${memberdto.member_id }님의 공연일정</h2>
				</div>
				<div class="Calendar-container">
					<!-- 메뉴 -->
					<div id="calendar-menu">
						<span id="menu-navi-left" style="border: 1px solid black;">
							<button type="button" id="prevBtn" data-action="move-prev">
								<i class="fas fa-caret-square-left"></i>
								<!-- 이전 -->
							</button>
							<button type="button" id="today" data-action="move-today">Today</button>
							<button type="button" id="nextBtn" data-action="move-next">
								<i class="fas fa-caret-square-right"></i>
								<!-- 다음 -->
							</button>
						</span> <span id="menu-navi-right" style="border: 1px solid black;">
							<button id="dayBtn">일간</button>
							<button id="weekBtn">주간</button>
							<button id="monthBtn">월간</button>
						</span>
					</div>
					<!-- 캘린더 -->
					<div id="calendar"></div>
					<c:forEach items="${caldto }" var="cal">
						<input type="hidden" value="${cal.cal_no }" class="cal_no">
						<input type="hidden" value="${cal.member_id }" class="cal_member_id">
						<input type="hidden" value="${cal.cal_title }" class="cal_title">
						<input type="hidden" value="${cal.cal_start }" class="cal_start">
						<input type="hidden" value="${cal.cal_end }" class="cal_end">
					</c:forEach> 
				</div>
			</div>

			<!-- 방송기록 -->
			<div id="tab-4" class="tab-content">
				<h2>방송기록</h2>
				
			</div>

		</div>


		<!-- 프로필 영역 -->
		<div class="right-wrapper">
			<div id="artist-profile">
				<img src="resources/img/BG.jpg">
				<%-- <img src="${profiledto.profile_savedname }"> --%>
			</div>

			<div id="artist-desc">
				<p><i class="fas fa-microphone"></i><span>  ${memberdto.member_nickname }</span></p>
				<c:if test="${logindto.member_id == memberdto.member_id }">
					<button id="artistBtn" onclick="updateProfile();">프로필변경</button>
					<button id="followerBtn">팔로워보기</button>
				</c:if>
				<c:if test="${logindto.member_id != memberdto.member_id }">
					<button id="followBtn">FOLLOW</button>
				</c:if>
			</div>
		</div>
		<input type="hidden" value="${memberdto.member_id }" id="artistId">
		<!--  아티스트 아이디 -->
		<input type="hidden" value="${logindto.member_id }" id="loginId">
		<!-- 로그인 아이디 -->
		<input type="hidden" value="${logindto.member_nickname}" id="loginNickname">
		<!-- 로그인 아이디 -->
	</section>

	<script src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
	<script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
	<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
	<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
	<script type="text/javascript" src="resources/js/artist.js"></script>
	<script type="text/javascript" src="resources/js/artist-calendar.js"></script>
	<script type="text/javascript"></script>

</body>
</html>