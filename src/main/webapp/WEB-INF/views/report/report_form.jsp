<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기 form(방송에서 아티스트 신고하기)</title>
<style type="text/css">
	#bigdiv{
		padding-top: 70px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header/header.jsp"/>
	<div id="bigdiv">
	<h1>${receive_nickname} 님 신고하기</h1>
		<form action="reportinsert.do" method="post">
			<input type="hidden" name="send_id" value="${logindto.member_id }">
			<input type="hidden" name="send_nickname" value="${logindto.member_nickname }">
			<input type="hidden" name="receive_id" value="${receive_id }">
			<input type="hidden" name="receive_nickname" value="${receive_nickname }">
				<div>
					<label for="report_title"></label>
					<select name="report_title">
						<option value="욕설">욕설</option>
						<option value="선정성">선정성</option>
						<option value="기타">기타</option>
					</select>
				</div>
				<div>
					<label for="report_content">신고내용</label>
					<textarea rows="3" cols="3" style="resize: none;" name="report_content" ></textarea>
				</div>
				<div>
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