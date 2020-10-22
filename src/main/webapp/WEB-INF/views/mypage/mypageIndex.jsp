<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:choose>
		<c:when test="${logindto.member_role == 'U' || logindto.member_role == 'A'}">
			<c:redirect url="userPage.do?member_id=${logindto.member_id }"/>
		</c:when>
		<c:otherwise>
			<c:redirect url="adminPage.do?member_id=${logindto.member_id }"/>
		</c:otherwise>
	</c:choose>

</body>
</html>