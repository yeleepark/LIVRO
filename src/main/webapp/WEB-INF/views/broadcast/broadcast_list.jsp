<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="resources/css/broadcast_list.css">
<title>LIVRO</title>
<style type="text/css">
</style>
</head>
<script>
	/* 버튼 유효성 검사 */
	function chkRole() {
		var memberrole = $("#memberRole").val().trim();
		console.log(memberrole);
		if (memberrole == null || memberrole == '') {
			alert("로그인 후 이용가능합니다.");
			location.href = "loginForm.do"
		} else {
			if (memberrole == 'U') {
				alert("아티스트로 먼저 등록해주세요.");
				location.href = "mypageIndex.do"
			} else {
				if (memberrole == 'A') {
					location.href = "live.do?member_id= + '${logindto.member_id}'";
				}
			}
		}

	}
</script>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp" />
	<input type="hidden" value="${logindto.member_role}" id="memberRole">
	<section id="section">
		<div class="live_start">
			<p>
				<i class="fas fa-bullhorn"></i>지금 방송을 시작해보세요!
			</p>
			<input class="startbtn" type="button" id="broadgo" value="방송하기"
				onclick="chkRole()">

		</div>
		<div class="broadcast-table" id="broadcast-table-cnt">

			<div class="wrapper">
				<c:forEach items="${list }" var="dto" varStatus="status">

					<c:if test="${dto.broadcast_flag eq 'Y' }">
						<div class="brolist_wrapper">
							<div class="broadcast-thumnail">
								<img class="liveimg" src="resources/img/red.png"> <a
									href="broadDetail.do?broadcast_no=${dto.broadcast_no }"> <img
									class="broadcast-mainimg"
									src="/resources/profileimg/${dto.member_profile }"></a>
							</div>
							<div class="broadcast-name">
								<div class="broadcast-title-wrapper">
									<p>
										<a href="broadDetail.do?broadcast_no=${dto.broadcast_no }">${dto.broadcast_title }</a>
									</p>
								</div>
								<div class="broadcast-nick-wrapper">
									<p>
										<i class="fas fa-user"></i><a
											href="artist.do?member_id=${dto.member_id }">${dto.member_nickname }</a>
									</p>
								</div>

								<div class="broadcast-content-wrapper">
									<p class="broadcast-content">${dto.broadcast_content }</p>
								</div>
								<div class="broadcast-category-wrapper">
									<p>[${dto.broadcast_category }]</p>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</section>
	<script>
		/*방송 없을 떄*/

		let ele = document.getElementsByClassName(('broadcast-table'))[0];
		let h1 = document.createElement('h1');

		if (ele.childElementCount < 1) {

			// 방송이 하나도 없을 때 출력되는 메시지
			h1.innerHTML = '진행중인 방송이 없습니다 헤헤';

			ele.appendChild(h1);
		}

		var lastnum = 12;
		console.log(lastnum);
		$(document)
				.ready(
						function() {
							$(window).scroll(function() {
								console.log("후..");
								console.log($(window).scrollTop())
								console.log($(window).height())
								console.log($(document).height())
								var curHeight = $(window).scrollTop();
								// 문서의 높이
								var docHeight = $(document).height();
								// 어느 정도 조건이 만족하면 내용 생성
								if (curHeight > docHeight - 900) {
									console.log("getList시작!!!!")
									getList();
								}
							});

							function getList() {
								//ajax 실행 데이터 가져오기
								console.log("getList시작");
								$
										.ajax({
											url : 'infinitescroll.do',
											data : {
												"lastnum" : lastnum
											},
											type : 'post',
											success : function(data) {
												var str = "";
												console.log("데이터 가져옴");
												$
														.each(
																data,
																function(i) {
																	str += "<div class='brolist_wrapper'>"
																			+ "<div class='broadcast-thumnail'>"
																			+ "<img class='liveimg' src='resources/img/red.png'>"
																			+ "<a href='broadDetail.do?broadcast_no="
																			+ data[i].broadcast_no
																			+ "'>"
																			+ "<img class='broadcast-mainimg' src='/resources/profileimg/"+data[i].member_profile+"'></a>"
																			+ "</div>"
																			+ "<div class='broadcast-name'>"
																			+ "<div class='broadcast-title-wrapper'>"
																			+ "<p> <a href='broadDetail.do?broadcast_no="
																			+ data[i].broadcast_no
																			+ "'>"
																			+ data[i].broadcast_title
																			+ "</a>"
																			+ "</p>"
																			+ "</div>"
																			+ "<div class='broadcast-nick-wrapper'>"
																			+ "<p>"
																			+ "<i class='fas fa-user'></i>"
																			+ "<a href='artist.do?member_id="
																			+ data[i].member_id
																			+ "'>"
																			+ data[i].member_nickname
																			+ "</a>"
																			+ "</p>"
																			+ "</div>"
																			+ "<div class='broadcast-content-wrapper'>"
																			+ "<p class='broadcast-content'> "
																			+ data[i].broadcast_content
																			+ "</p>"
																			+ "</div>"
																			+ "<div class='broadcast-category-wrapper'>"
																			+ "<p>"
																			+ "["
																			+ data[i].broadcast_category
																			+ "]"
																			/* + data[i].broadcast_no */
																			+ "</p>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div>"
																})
												console
														.log("12개중에"
																+ data.length
																+ "개 가져옴");
												var ele = document
														.createElement('div');
												ele.classList.add('wrapper');
												ele.innerHTML = str;
												/* 	$(".wrapper > div")
															.last().after(ele); */
												$(".broadcast-table").append(
														ele);
												lastnum += 12;
												/* if (!data) {
													alert("마지막 데이터입니다!");
												} */
											},
											error : function(error) {
												alert("통신실패!");
											}
										});
							}
						});
	</script>
</body>
</html>