<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 주소 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
				<li class="tab-link" data-tab="tab-2" onclick="list();">Support</li>
				<li class="tab-link" data-tab="tab-3" id="tab3">Calendar</li>
				<li class="tab-link" data-tab="tab-4">Livro</li>
				<li class="tab-link" data-tab="tab-5" id="tab5">Map</li>
			</ul>


			<!-- 음원 -->
			<div id="tab-1" class="tab-content tabCurrent">
				<h2>
					<i class="fas fa-volume-down"></i> 음원
				</h2>
				<!-- 음원 업로드 공간 -->
				<c:if test="${logindto.member_nickname eq memberdto.member_nickname}">
					<div class="insertMusic">
						<form:form method="post" enctype="multipart/form-data" modelAttribute="MusicDto" action="upload.do">
							<input type="hidden" name="member_id" value="${logindto.member_id }">
							<input type="hidden" name="member_nickname"
								value="${logindto.member_nickname }">
							<div class="file_upload_block">
								<div class="file_upload_wrap1">
									<span class="file_up">파일 업로드</span>
								</div>
								<!-- 파일 -->
								<div class="file_upload_wrap2">
									<input type="file" name="music_file" /> <span
										style="color: red; font-weight: bold;"> <form:errors
											path="music_file" /></span>
									<!-- 에러시 문자열 반환 -->
									<input type="text" name="music_content" placeholder="설명문"
										required="required">
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
												<img alt="라이브로 아이콘" src="resources/img/livro_icon.png"
													class="livro_icon">
											</div>
											<div class="music_explain">
												<p class="music_title_tag">${musicdto.music_title }</p>
												<p class="music_content_tag">${musicdto.music_content }</p>
											</div>
										</div>
										<audio style="width: 90%" controls>
											<source src="resources/audio/${musicdto.music_savename }"
												class="control_panel" type="audio/mp3">
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
					<h2>
						<i class="fas fa-heart"></i> ${memberdto.member_nickname }님께 응원글을 남겨주세요!
					</h2>

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
									<input type="button" value="작성" class="insertBtn" onclick="insertSupport(this);">
								</div>
							</div>
						</c:otherwise>
					</c:choose>

					<div class="supportDetail">
						<div class="support-index">
							<span>작성자</span> <span>내용</span> 
							<c:if test="${not empty logindto }">
							<input type="button" value="내가 작성한 글" class="mineBtn" onclick="mine(this);">
							<input type="button" value="전체 게시글 보기" class="allBtn" onclick="allBtn(this);">
							</c:if>
						</div>
						<div class="support-content">
						</div>
					</div>
				</div>

			</div>

			<!-- 일정 게시판 탭-->
			<div id="tab-3" class="tab-content">
				<div>
					<h2>
						<i class="far fa-calendar-alt"></i> ${memberdto.member_nickname }님의 공연일정
					</h2>
				</div>
				<div class="Calendar-container">
					<!-- 메뉴 -->
					<div id="calendar-menu">
						<span id="menu-navi-left">
							<button type="button" id="prevBtn" data-action="move-prev">
								<i class="fas fa-caret-square-left"></i>
							</button>
							<button type="button" id="today" data-action="move-today">Today</button>
							<button type="button" id="nextBtn" data-action="move-next">
								<i class="fas fa-caret-square-right"></i>
							</button>
						</span> <span id="menu-navi-right"> <span id="printMonth"></span><span>월</span>
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
				<h2>
					<i class="fas fa-record-vinyl"></i> 방송기록
				</h2>
				<div class="broadTable">
					<c:choose>
						<c:when test="${empty broaddto }">
							<div>
								<p>방송 내역이 없습니다</p>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${broaddto }" var="broad">
								<c:if test="${broad.broadcast_flag == 'Y' }">
									<div class="live-row">
										<div>
											<img src="resources/img/red.png" alt="생방송"> 
											<span><a href="broadDetail.do?broadcast_no=${broad.broadcast_no }">${broad.broadcast_title }</a></span>
											<span><i class="fas fa-mouse-pointer"></i></span>
										</div>
										<p>
											<span>[ ${broad.broadcast_category } ]</span>
											${broad.broadcast_content }
										</p>
										<p>
											<fmt:formatDate value="${broad.broadcast_startdate }" pattern="yyyy-MM-dd-HH:mm:ss" />
											<span>~ 방송중</span>
										</p>
									</div>
								</c:if>
							</c:forEach>
							<c:forEach items="${broaddto }" var="broad">
								<c:if test="${broad.broadcast_flag == 'N' }">
									<div class="live-row">
										<img src="resources/img/black.png" alt="지난방송"> <span>${broad.broadcast_title }</span>
										<p>
											<span>[ ${broad.broadcast_category } ]</span>
											${broad.broadcast_content }
										</p>
										<p>
											<fmt:formatDate value="${broad.broadcast_startdate }" pattern="yyyy-MM-dd-HH:mm:ss" />
											~ <span><fmt:formatDate	value="${broad.broadcast_enddate }" pattern="yyyy-MM-dd-HH:mm:ss" /></span>
										</p>
									</div>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<!-- 지도 : 유정 작업 여기서부터 -->
			<div id="tab-5" class="tab-content">
				<h2>
					<i class="fas fa-map-marker-alt"></i> 팬레터 보내는 곳
				</h2>

				<!-- 메세지 띄울 div공간 -->
				<div id="textarea"></div>
				
				<!-- 아티스트 자기 자신의 채널이고 , 지도가 띄워져있다면 삭제버튼 보이기 -->
				<c:if test="${logindto.member_nickname eq memberdto.member_nickname && !empty mapdto}">
					<div class="addr_btn_wrap">
						<input type="button" value="삭제" onclick="delChk()" class="artist_addr_btn">
					</div>
				</c:if>
				<!-- 아티스트 자기 자신의 채널일 때 주소입력지  -->
				<c:if test="${logindto.member_nickname eq memberdto.member_nickname }">
					<form action="artistmap.do" method="post" id="addrForm">
						<input type="hidden" value="${logindto.member_id }" name="member_id">
						<div class="artist_loc_wrap">
							<label for="artist_addr1">주소</label> 
							<input placeholder="우편번호" type="text" name="artist_postcode" id="artist_addr1" required="required">
							<button type="button" class="artist_addr_btn" onclick="execPostCode();">
								<i class="fa fa-search"></i> 우편번호 찾기
							</button>
							<input placeholder="도로명 주소" type="text" name="artist_loc" id="artist_addr2" required="required" /> 
							<input placeholder="상세주소" type="text" name="artist_detail_loc" id="artist_addr3" />
							<c:choose>
								<c:when test="${empty mapdto }">
									<input type="submit" value="등록" id="addAddr" class="artist_addr_btn">
								</c:when>
								<c:otherwise>
									<input type="button" value="주소변경" onclick="locConfirm();" class="artist_addr_btn">
								</c:otherwise>
							</c:choose>
						</div>
					</form>
				</c:if>
				<!--지도에 마커 찍어줄 값 불러와서 클래스 부여 -->
				<input type="hidden" value="${mapdto.artist_loc}" class="addr" id="addr_info">

				<div class="map-container">
					<div id="map" style="width: 100%; height: 350px;"></div>
				</div>
			</div>

		</div>


		<!-- 프로필 영역 -->
		<div class="right-wrapper">
			<div class="follower">
					<c:forEach items="${countdto }" var="count">
						<c:if test="${count.rank == 1}">
						<p><i class="fas fa-crown"></i></p>
						</c:if>
					</c:forEach>
			</div>
			<div id="artist-profile">
				<img src="resources/img/BG.jpg">
				<%-- <img src="${profiledto.profile_savedname }"> --%>
			</div>

			<div id="artist-desc">
				<div class="nick"><!-- 아티스트 닉네임 -->
					<p>${memberdto.member_nickname }</p>
				</div>
				<div class="followCount">
				<c:choose>
				<c:when test="${empty countdto }">
					<p>총 <span class="count">0</span>명이 팔로우하고 있습니다</p>
				</c:when>
				<c:otherwise>
				<c:forEach items="${countdto }" var="count">
						<p>총 <span class="count">${count.count }</span>명이 팔로우하고 있습니다</p>
				</c:forEach>
				</c:otherwise>
				</c:choose>
				</div>
				<div class="button-container">
					<c:choose>
					
						<%--로그인 안했을때 --%>
						<c:when test="${empty logindto }">
							<div class="btnOn">
								<button class="followBtn" onclick="alert('로그인 해주세요')">FOLLOW</button>
							</div>
						</c:when>
						
						<%-- 내 아티스트 페이지 --%>
						<c:when test="${logindto.member_id == memberdto.member_id }">
							<div class="btnOn">
								<button id="artistBtn" onclick="updateProfile();">프로필변경</button>
								<button id="followerBtn">팔로워보기</button>
							</div>
						</c:when>
						
						<%-- 로그인 했을 때--%>
						<c:otherwise>
							<div class="btnDefault">
								<%-- <span>디폴트 해당 아티스트의 팔로워가 있고 내가 팔로우 안함</span>--%>
								<button class="followBtn" onclick="follow(this);">FOLLOW</button>
								<button class="unfollowBtn" onclick="unfollow(this);">UNFOLLOW</button>
							</div>
							<c:choose>
								<c:when test="${empty dto }">
									<%-- 팔로워 없음 --%>
									<div class="btnOn">
										<button class="followBtn" onclick="follow(this);">FOLLOW</button>
										<button class="unfollowBtn" onclick="unfollow(this);">UNFOLLOW</button>
									</div>
								</c:when>
								<c:when test="${not empty dto }">
									<%--팔로워 있음 --%>
									<c:forEach items="${dto }" var="dto">
										<c:if test="${dto.follower_id == logindto.member_id }">
											<div class="btnOn">
												<%-- <p>해당 아티스트의 팔로워가 있고 내가 팔로우 함${dto.follower_id }</p>--%>
												<button class="YfollowBtn" onclick="follow(this);">FOLLOW</button>
												<button class="YunfollowBtn" onclick="unfollow(this);">UNFOLLOW</button>
											</div>
										</c:if>
									</c:forEach>
								</c:when>
							</c:choose>
						</c:otherwise>
						
					</c:choose>
				</div>
			</div>
			
			
		</div>
		
		<input type="hidden" value="${memberdto.member_id }" id="artistId">
		<!--  아티스트 아이디 -->
		<input type="hidden" value="${memberdto.member_nickname }"
			id="artistNickname">
		<!-- 아티스트 닉네임 -->
		<input type="hidden" value="${logindto.member_id }" id="loginId">
		<!-- 로그인 아이디 -->
		<input type="hidden" value="${logindto.member_nickname}"
			id="loginNickname">
		<!-- 로그인 아이디 -->
		<input type="hidden" value="${logindto.member_role }" id="memberRole">
		<!-- 아티스트 롤 -->
		<input type="hidden" value="${mapdto.artist_postcode }" id="artistPostcode">
		<input type="hidden" value="${mapdto.artist_loc}" id="artistLoc">
		<input type="hidden" value="${mapdto.artist_detail_loc}" id="artistDetailLoc">
		<!-- 아티스트 주소 3개 -->
	</section>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b922a72fda74bfd05bf5b30f2ab2056d&libraries=services"></script>
	<script src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
	<script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
	<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
	<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
	<script type="text/javascript" src="resources/js/artist.js"></script>
	<script type="text/javascript" src="resources/js/artist-support.js"></script>
	<script type="text/javascript" src="resources/js/artist-calendar.js"></script>
	<script type="text/javascript" src="resources/js/artist-map.js"></script>
</body>
</html>