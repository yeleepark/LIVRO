<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<form:form method="post" enctype="multipart/form-data"
			modelAttribute="uploadFile" action="profileUpload.do">
			<p>[프로필 사진 업로드]</p>
			<p>이름 : ${logindto.member_id }</p>
			<input type="file" name="profile">
			<input type="hidden" name="member_id" value="${logindto.member_id }">
			<br />
			<form:errors path="profile" />
			<br />
			<input type="submit" value="등록">
		</form:form>
	</section>
</body>
</html>