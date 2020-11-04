<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js"
	crossorigin="anonymous"></script>
<!-- google font -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 주소 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- toast calendar -->
<link rel="stylesheet" type="text/css"
	href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
<link rel="stylesheet" type="text/css"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet" type="text/css"
	href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />
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
				<li class="tab-link" data-tab="tab-5">Map</li>
			</ul>


			<!-- 음원 -->
			<div id="tab-1" class="tab-content tabCurrent">
				<h2>
					<i class="fas fa-volume-down"></i> 음원
				</h2>
				<!-- 음원 업로드 공간 -->
				<c:if
					test="${logindto.member_nickname eq memberdto.member_nickname}">
					<div class="insertMusic">
						<form:form method="post" enctype="multipart/form-data"
							modelAttribute="MusicDto" action="upload.do">
							<input type="hidden" name="member_id"
								value="${logindto.member_id }">
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
											<c:if
												test="${logindto.member_nickname eq memberdto.member_nickname}">
												<input type="button" class="music_del_btn" value="삭제"
													onclick="location.href='deletemusic.do?member_id=${musicdto.member_id }&music_no=${musicdto.music_no }'">
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
						<i class="fas fa-heart"></i> ${memberdto.member_nickname }님께 응원글을
						남겨주세요!
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
									<input type="button" value="작성" class="insertBtn">
								</div>
							</div>
						</c:otherwise>
					</c:choose>

					<div class="supportDetail">
						<div class="support-index">
							<span>작성자</span> <span>내용</span>
						</div>
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
											<p class="writerNick">${support.member_nickname }</p>
											<input type="hidden" value="${support.member_id }"
												class="writerId">
										</div>
										<div class="rows-center">
											<textarea class="change" readonly="readonly">${support.support_content }</textarea>
											<p>${support.support_regdate }</p>
											<input type="hidden" value="${support.support_no }">
										</div>
										<div class="rows-right">
											<input type="hidden" value="${support.support_no }">
											<c:if
												test="${logindto.member_nickname == support.member_nickname }">
												<input type="button" value="수정" class="updateBtn">
												<input type="button" value="완료" class="updateRes">
												<input type="button" value="삭제" class="deleteBtn">
												<input type="hidden" value="${support.support_no }"
													class="supportNo">
											</c:if>
											<c:if test="${logindto.member_id == support.member_id }">
												<input type="button" value="신고" class="reportBtn"
													onclick="report(this);">
											</c:if>
										</div>
										<!-- 두번째줄 -->
										<div class="rows-middle">
											<div>
												<input type="button" value="&#xf06b" class="showReply">
												<input type="button" value="&#xf00d" class="closeReply">
												<input type="hidden" value="${support.support_no }"
													class="supportNo">
											</div>
											<!--  반복 부분 -->
											<div class="replyArea"></div>
											<!-- 반복 끝 -->
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>

			<!-- 일정 게시판 탭-->
			<div id="tab-3" class="tab-content">
				<div>
					<h2>
						<i class="far fa-calendar-alt"></i> ${memberdto.member_nickname }님의
						공연일정
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
						<input type="hidden" value="${cal.member_id }"
							class="cal_member_id">
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
											<img src="resources/img/red.png" alt="생방송"> <span><a
												href="broadDetail.do?broadcast_no=${broad.broadcast_no }">${broad.broadcast_title }</a></span>
											<span><i class="fas fa-mouse-pointer"></i></span>
										</div>
										<p>
											<span>[ ${broad.broadcast_category } ]</span>
											${broad.broadcast_content }
										</p>
										<p>
											<fmt:formatDate value="${broad.broadcast_startdate }"
												pattern="yyyy-MM-dd-HH:mm:ss" />
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
											<fmt:formatDate value="${broad.broadcast_startdate }"
												pattern="yyyy-MM-dd-HH:mm:ss" />
											~ <span><fmt:formatDate
													value="${broad.broadcast_enddate }"
													pattern="yyyy-MM-dd-HH:mm:ss" /></span>
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
					<i class="fas fa-map-marker-alt"></i> 팬레터 보내는 곳 ?
				</h2>
				<c:if test ="${logindto.member_id eq  memberdto.member_id && logindto.member_role == 'A'}">
				<form action="artistmap.do" method="post">
					<input type="text" value="${logindto.member_id }" name="member_id">
					<div class="artist_loc_wrap">
						<label for="artist_addr1">주소</label> <input placeholder="우편번호"
							vtype="text" readonly="readonly" name="artist_addr1"
							id="artist_addr1">
						<button type="button" class="joinChkBtn"
							vonclick="execPostCode();">
							<i class="fa fa-search"></i> 우편번호 찾기
						</button>
						<input placeholder="도로명 주소" type="text" readonly="readonly"
							name="artist_addr2" id="artist_addr2" /> <input
							placeholder="상세주소" type="text" name="artist_addr3"
							id="artist_addr3" /> <input type="text" placeholder="아티스트주소"
							value="" class="addr" /> <input type="submit" value="입력">
						<input type="button" value="삭제" onclick="artistmapdel.do">
					</div>
				</form>
				</c:if>

				<div class="map-container">
					<div id="map" style="width: 100%; height: 400px;"></div>
					<input type="hidden">
				</div>
			</div>

		</div>


		<!-- 프로필 영역 -->
		<div class="right-wrapper">
			<div id="artist-profile">
				<img src="resources/img/BG.jpg">
				<%-- <img src="${profiledto.profile_savedname }"> --%>
			</div>

			<div id="artist-desc">
				<p>
					<i class="fas fa-microphone"></i> <span>
						${memberdto.member_nickname }</span>
				</p>
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
								<%-- <p>디폴트 해당 아티스트의 팔로워가 있고 내가 팔로우 안함</p>--%>
								<button class="followBtn" onclick="follow(this);">FOLLOW</button>
								<button class="unfollowBtn" onclick="unfollow(this);">UNFOLLOW</button>
							</div>
							<c:choose>
								<c:when test="${empty dto }">
									<%--팔로워 없음 --%>
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
												<%--<p>해당 아티스트의 팔로워가 있고 내가 팔로우 함${dto.follower_id }</p>--%>
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
	</section>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b922a72fda74bfd05bf5b30f2ab2056d&libraries=services"></script>
	<script
		src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
	<script
		src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
	<script
		src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
	<script
		src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
	<script type="text/javascript" src="resources/js/artist.js"></script>
	<script type="text/javascript" src="resources/js/artist-support.js"></script>
	<script type="text/javascript" src="resources/js/artist-calendar.js"></script>
	<!-- <script type="text/javascript" src="resources/js/artist-map.js"></script> -->
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var addr = document.getElementsByClassName('addr')[0];

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						'addr',
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">팬레터</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
		//우편번호찾기
		function execPostCode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
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
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								//document.getElementById("member_addr").value = extraAddr;

							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('artist_addr1').value = data.zonecode;
							document.getElementById('artist_addr2').value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById('artist_addr3').focus();

						}
					}).open();
		}
	</script>

</body>
</html>