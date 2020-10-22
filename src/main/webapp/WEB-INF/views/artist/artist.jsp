<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	
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
				<!-- 현승 작업 여기서 -->
				
				<form:form method="post" enctype="multipart/form-data" modelAttribute="MusicDto" action="upload.do">
					<input type="hidden" name="member_id" value="${artistdto.member_id }">
					file<br><!-- 파일 -->
					<input type="file" name="music_file" /> 
					<span style="color:red; font-weight: bold;"><form:errors path="music_file"/></span>
					
					<!-- 에러시 문자열 반환 -->
					<input type="text" name="music_content" placeholder="설명문">
					<input type="submit" value="send">
		
				</form:form>
				
				<audio src="resources/audio/브라운 아이드 소울-04-정말 사랑했을까-192k.mp3" controls></audio>
				
				
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
				<p>${artistdto.member_nickname }</p>
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