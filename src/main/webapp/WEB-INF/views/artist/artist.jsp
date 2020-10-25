<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/artist.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    
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
					
					file<br><!-- 파일 -->
					<input type="file" name="music_file" /> 
					<span style="color:red; font-weight: bold;"><form:errors path="music_file"/></span>
					
					<!-- 에러시 문자열 반환 -->
					<input type="text" name="music_content" placeholder="설명문">
					<input type="submit" value="send">
				</form:form>
				</div>
				
				<br><br><br><br><br>
				<!-- 음원 출력 공간 -->
				<div>
					<div class="music-table">
						<c:choose>
						<c:when test="${empty musicdto }">
							<p>업로드된 음원이 없습니다</p>
						</c:when>
						<c:otherwise>
							<c:forEach items="${musicdto }" var ="musicdto">
<%-- 									<audio src="/LIVRO/resources/audio/${musicdto.music_savename }" controls></audio> --%>
									<audio src="/LIVRO/resources/audio/${musicdto.music_savename }')" controls></audio>
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
			
			
			
			
			<div id="tab-2" class="tab-content">
				응원
			</div>
			
			<div id="tab-3" class="tab-content">
				일정
			</div>
		</div>
		<div class="right-wrapper">
			<div id="artist-profile"></div>
			<div id="artist-desc">
				<p>
						${musicnickdto.member_nickname }
				</p>
				<input type="button" value="팔로우">
			</div>
		</div>
	</section>

	<script>
	 $(document).ready(function(){
			
			$('ul.tabs li').click(function(){
				var tab_id = $(this).attr('data-tab');
	
				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');
	
				$(this).addClass('current');
				$("#"+tab_id).addClass('current');
			})
	
		})
	</script>
</body>
</html>