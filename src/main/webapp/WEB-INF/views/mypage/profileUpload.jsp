<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section>
	<form:form method="post" enctype="multipart/form-data" modelAttribute="uploadFile" action="fileupload">
		<p>프로필 사진 올리기</p>
		<input type="file" name="imgfile">
		<form:errors path="imgfile"/>
		<input type="submit" value="등록">
	</form:form>
</section>

</body>
</html>