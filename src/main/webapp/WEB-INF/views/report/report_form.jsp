<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/report.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous"></script>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<title>신고하기 form(방송에서 아티스트 신고하기)</title>
</head>
<body>
	<header>
	<jsp:include page="/WEB-INF/views/header/header.jsp"/>
	</header>
	
	<div id="bigdiv">
	<h2><i class="far fa-times-circle"></i> ${receive_nickname} 님 신고하기</h2>
		<form action="reportinsert.do" method="post" class="reportForm">
			<input type="hidden" name="send_id" value="${logindto.member_id }">
			<input type="hidden" name="send_nickname" value="${logindto.member_nickname }">
			<input type="hidden" name="receive_id" value="${receive_id }">
			<input type="hidden" name="receive_nickname" value="${receive_nickname }">
				<div class="category">
					<label for="report_title">카테고리</label>
					<select name="report_title">
						<option value="욕설">욕설</option>
						<option value="선정성">선정성</option>
						<option value="기타">기타</option>
					</select>
				</div>
				<div class="reportArea">
					<label for="report_content">신고내용</label>
					<textarea style="resize: none;" name="report_content" ></textarea>
				</div>
				<div class="btnArea">
					<input type="submit" value="신고하기">
					<input type="button" value="취소하기" onclick="closepop();">
				</div>
		</form>
	</div>
	
	<script type="text/javascript">
		function closepop(){
			self.close();
		}
	</script>
</body>
</html>