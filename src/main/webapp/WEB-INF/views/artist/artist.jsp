<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/artist.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- 캘린더 -->
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
<title>LIVRO-Artist</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header/header.jsp" />

	<section>
		<div class="left-wrapper">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">Music</li>
				<li class="tab-link" data-tab="tab-2">Support</li>
				<li class="tab-link" data-tab="tab-3">Calendar</li>
			</ul>


			<!-- 음원 -->
			<div id="tab-1" class="tab-content current">
				<!-- 음원 업로드 공간 -->
				<div>
					<form:form method="post" enctype="multipart/form-data" modelAttribute="MusicDto" action="upload.do">
						<input type="hidden" name="member_id" value="${logindto.member_id }">
						<input type="hidden" name="member_nickname" value="${logindto.member_nickname }">
						<p>파일</p>
						<!-- 파일 -->
						<input type="file" name="music_file" />
						<span style="color: red; font-weight: bold;"> <form:errors path="music_file" /></span>

						<!-- 에러시 문자열 반환 -->
						<input type="text" name="music_content" placeholder="설명문">
						<input type="submit" value="send">
					</form:form>
				</div>

				<br> <br> <br> <br> <br>
				<!-- 음원 출력 공간 -->
				<div>
					<div class="music-table">
						<c:choose>
							<c:when test="${empty musicdto }">
								<p>업로드된 음원이 없습니다</p>
							</c:when>
							<c:otherwise>
								<c:forEach items="${musicdto }" var="musicdto">
									<audio src="resources/audio/${musicdto.music_savename }" controls></audio>
									${musicdto.music_title }
									${musicdto.music_content }
									${musicdto.music_no }
									<input type="button" value="삭제" onclick="location.href='deletemusic.do?member_id=${musicdto.member_id }&music_no=${musicdto.music_no }'">

									<br>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>
			<!-- 음원 -->

			<div id="tab-2" class="tab-content">
				<div class="supportTable">
					<h2>${memberdto.member_nickname }님께응원글을남겨주세요!</h2>

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
									<input type="button" value="작성" class="InsertBtn">
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
										<div>
											<p>${support.member_nickname }</p>
										</div>
										<div>
											<p class="change">${support.support_content }</p>
											<p>${support.support_regdate }</p>
											<input type="button" value="댓글보기" class="showReply"> <input type="hidden" value="${support.support_no }">
										</div>
										<div>
											<input type="hidden" value="${support.support_no }">
											<c:if test="${logindto.member_nickname == support.member_nickname }">
												<input type="button" value="수정" class="updateBtn">
												<input type="button" value="삭제" class="deleteBtn">
											</c:if>
										</div>
										<div class="replyShow"></div>
										<div class="reply">
											<div>
												<p>댓글작성</p>
											</div>
											<div>
												<textarea class="replyContent"></textarea>
											</div>
											<div>
												<input type="button" value="작성" class="replyDone"> <input type="hidden" value="${support.support_no }">
											</div>
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

				<div id="menu">
					<span id="menu-navi">
						<button type="button" class="btn btn-default btn-sm move-today" data-action="move-today">Today</button>
						<button type="button" class="btn btn-default btn-sm move-day" data-action="move-prev">
							<i class="calendar-icon ic-arrow-line-left" data-action="move-prev"></i>
						</button>
						<button type="button" class="btn btn-default btn-sm move-day" data-action="move-next">
							<i class="calendar-icon ic-arrow-line-right" data-action="move-next"></i>
						</button>
					</span> <span id="renderRange" class="render-range"></span>
				</div>

				<div id="calendar"></div>

			</div>

		</div>

		<div class="right-wrapper">
			<div id="artist-profile">
				<%-- <img src="${profiledto.profile_savedname }"> --%>
			</div>

			<div id="artist-desc">
				<p>${memberdto.member_nickname }</p>

				<input type="button" value="팔로우">
			</div>
		</div>

	</section>
	<!--  캘린더  -->
	<script src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
	<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
	<script type="text/javascript">
		var cal = new tui.Calendar('#calendar', {
			defaultView : 'month' // monthly view option
		});
	</script>
	<script>
		$(document).ready(
				function() {
					// tab menu
					$('ul.tabs li').click(function() {
						var tab_id = $(this).attr('data-tab');

						$('ul.tabs li').removeClass('current');
						$('.tab-content').removeClass('current');

						$(this).addClass('current');
						$("#" + tab_id).addClass('current');
					});

					// Insert support board
					$(".InsertBtn").click(function() {
						insertJson(); // json 형식으로 입력
					});

					// Update support board
					$(".updateBtn").click(
							function() {
								alert('수정하시겠습니까?');
								$(this).parent().parent().find('.change')
										.contents().unwrap().wrap(
												'<textarea></textarea>');
								$(this).attr('value', '변경');
								$(this).attr("value", "변경")
										.click(
												function() {
													var updateNo = $(this)
															.prev().val();
													var content = $(this)
															.parent().parent()
															.find('textarea')
															.val();
													updateJson(updateNo,
															content); // json 형식으로 입력 
												});
							});

					// Delete Support board
					$(".deleteBtn").click(function() {
						alert('삭제클릭');
						var deleteNo = $(this).prev().prev().val();
						deleteJson(deleteNo); // json 형식으로 입력
					});

					$(".replyBtn").click(
							function() {
								$(this).parent().parent().find('.reply')
										.addClass('replyActive');
							});


					$(".showReply").click(function() {
						var supNo = $(this).next().val();
						var commContent = $(this).parent().siblings('.reply').addClass('replyActive');
						showReply(supNo);
						})
						
						// Insert Reply
					$(".replyDone").click(function() {
							var commContent = $(this).parent().parent().find('textarea').val();
							var commNo = $(this).next().val();
							var commId = "${logindto.member_id}";
							replyInsert(commContent, commNo, commId)
						})

				});

		/* 댓글 리스트 */
		function showReply(supNo) {
			var support_no = supNo;
			console.log(support_no + " showReply 찍힘");
			$.ajax({
				type : "post",
				url : "showList.do?support_no=" + support_no,
				headers : {
					"Content-Type" : "application/json"
				},
				dateType : "json",
				data : JSON.stringify({
					support_no : support_no
				}),
				success : function(data) {
					console.log(data); // 일단 성공 
					console.log(typeof(data))
					var res = JSON.stringify(data);
					$('.replyShow').html(res);
				}
			})
		}

		/* 응원글 작성 */
		function insertJson() {

			var member_id = "${memberdto.member_id}";
			var member_nickname = "${logindto.member_nickname}";
			var support_content = $("#support_content").val();

			$.ajax({
				type : "post",
				url : "supportInsert.do",
				headers : {
					"Content-Type" : "application/json"
				},
				dateType : "text",
				data : JSON.stringify({
					member_id : member_id,
					member_nickname : member_nickname,
					support_content : support_content
				}),
				success : function() {
					listRest();
				}
			});
		}

		/* 게시글 수정 */
		function updateJson(no, content) {
			var support_no = no;
			var support_content = content;
			console.log(support_content);
			$.ajax({
				type : "post",
				url : "supportUpdate.do?suppport_no=" + no,
				headers : {
					"Content-Type" : "application/json"
				},
				dateType : "text",
				data : JSON.stringify({
					support_no : support_no,
					support_content : support_content
				}),
				success : function() {
					listRest();
				}
			});
		};

		/* 응원글 삭제 */
		function deleteJson(no) {
			var support_no = no;

			$.ajax({
				type : "post",
				url : "supportDelete.do?support_no=" + no,
				headers : {
					"Content-Type" : "application/json"
				},
				dateType : "text",
				data : JSON.stringify({
					support_no : support_no
				}),
				success : function() {
					listRest();
				}
			});
		}

		function replyInsert(commContent, commNo, commId) {
			var support_no = commNo;
			var member_id = commId;
			var comm_content = commContent;
			console.log(support_no + " " + member_id + " " + comm_content);

			$.ajax({
				type : "post",
				url : "commInsert.do",
				headers : {
					"Content-Type" : "application/json"
				},
				dateType : "text",
				data : JSON.stringify({
					support_no : support_no,
					member_id : member_id,
					comm_content : comm_content
				}),
				success : function(result) {
					console.log(result) //  성공..
					/* replyRest(support_no); */
				}
			});

		}

		function listRest() {
			console.log("출력확인");
			$.ajax({
				type : "get",
				url : "artist.do?member_id=${memberdto.member_id }",
				success : function(result) {
					var htmlObj = $(result);
					/* 			var res = htmlObj.find('.supportTable');
					 $('.supportTable').replaceWith(res); */

					$(htmlObj).find('ul.tabs li').removeClass('current');
					$(htmlObj).find('#tab-1').removeClass('current');
					$(htmlObj).find('ul.tabs li:nth-child(2)').addClass('current');
					$(htmlObj).find('#tab-2').addClass('current');
					$(htmlObj).find('header').remove();
					$('body').html(htmlObj);
				}
			});
		}
	</script>
</body>
</html>