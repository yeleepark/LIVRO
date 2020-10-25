<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/artist.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
					<form:form method="post" enctype="multipart/form-data"
						modelAttribute="MusicDto" action="upload.do">
						<input type="hidden" name="member_id"
							value="${logindto.member_id }">
						<input type="hidden" name="member_nickname"
							value="${logindto.member_nickname }">
					
					file<br>
						<!-- 파일 -->
						<input type="file" name="music_file" />
						<span style="color: red; font-weight: bold;"><form:errors
								path="music_file" /></span>

						<!-- 에러시 문자열 반환 -->
						<input type="text" name="music_content" placeholder="설명문">
						<input type="submit" value="send">
					</form:form>
				</div>

				<br> <br> <br> <br> <br>
				<!-- 음원 출력 공간 -->
				<div>
					<div class="music-table">
						<audio src="resources/audio/브라운 아이드 소울-04-정말 사랑했을까-192k.mp3"
							controls="controls"></audio>
						<br>
						<c:choose>
							<c:when test="${empty musicdto }">
								<p>업로드된 음원이 없습니다</p>
							</c:when>
							<c:otherwise>
								<c:forEach items="${musicdto }" var="musicdto">
									<audio
										src="/LIVRO/resources/music/21e7c44c-a086-4592-98f1-4e14e1521a22브라운 아이드 소울-04-정말 사랑했을까-192k.mp3"
										controls></audio>
									${musicdto.music_title }
									${musicdto.music_content }
								<br>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>
			<!-- 음원 -->



			<!-- 응원 게시판 탭 -->
			<div id="tab-2" class="tab-content">
				<div id="supportTable">
					<div id="supportInsert">
						<span>${logindto.member_nickname }</span>
						<textarea name="support_content" id="support_content"></textarea>
						<input type="button" value="작성" id="InsertBtn">
					</div>
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
										<p>${support.member_nickname }</p>
										<textarea>${support.support_content }</textarea>
										<p>${support.support_regdate }</p>
										<div>
											<input type="button" value="${support.support_no }">
											<input type="button" value="수정" id="updateBtn"> <input
												type="button" value="삭제" id="deleteBtn">
										</div>
									</div>
									<div>
										<p>댓글작성</p>
										<textarea></textarea>
										<input type="button" value="작성">
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>

			<div id="tab-3" class="tab-content">일정</div>

		</div>
		<div class="right-wrapper">
			<div id="artist-profile"></div>
			<div id="artist-desc">
				<p>${musicnickdto.member_nickname }</p>
				<input type="button" value="팔로우">
			</div>
		</div>
	</section>

	<script>
	
	$(document).ready(function(){
	
		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		});

		$("#InsertBtn").click(function() {
			insertJson(); // json 형식으로 입력
		});

		$("#updateBtn").click(function() {
			var updateNo = $(this).prev().val();
			updateJson(updateNo); // json 형식으로 입력
		});

		$("#deleteBtn").click(function() {
			var deleteNo = $(this).prev().prev().val();
			deleteJson(deleteNo); // json 형식으로 입력
		});
	
	});
	
	/* 응원글 작성 */
	function insertJson() {

		var member_id = "${musicnickdto.member_id }";
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
	function updateJson(no) {
		var support_no = no;
		var support_content = $("#support_content").val();
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
	
	function listRest() {
		console.log("출력확인");
		$.ajax({
			type : "get",
			url : "artist.do?member_id=${musicnickdto.member_id }",
			success : function(result) {
				var htmlObj = $(result);
				$(htmlObj).find('ul.tabs li').removeClass('current');
				$(htmlObj).find('#tab-1').removeClass('current');
				$(htmlObj).find('ul.tabs li:nth-child(2)').addClass('current');
				$(htmlObj).find('#tab-2').addClass('current');
				$('body').html(htmlObj);
			}
		});
	}
	
	</script>
</body>
</html>